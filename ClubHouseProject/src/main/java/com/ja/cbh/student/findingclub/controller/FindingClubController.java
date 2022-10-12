package com.ja.cbh.student.findingclub.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.student.findingclub.service.FindingClubServiceImpl;
import com.ja.cbh.vo.ClubDeptCategoryVO;
import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_Dept_CategoryVO;
import com.ja.cbh.vo.Club_StudVO;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("student/findingclub/*")
public class FindingClubController {

	@Autowired
	private FindingClubServiceImpl findingClubService;
	
	
	
	@RequestMapping("student_indexPage")
	public String student_indexPage(Model model) {
		System.out.println("안들어오지?");
		return "student/findingclub/student_indexPage";
	}
	
	@RequestMapping("student_clubsOfCategoryPage")
	public String student_clubsOfCategoryPage(Model model, @Param("club_category_no") String club_category_no, @Param("searchWord") String searchWord) {
		int clubCategoryNo = Integer.parseInt(club_category_no);
		
		ArrayList<ClubVO> clubList = findingClubService.getAllClubsOfCategory(clubCategoryNo, searchWord);
		Club_Dept_CategoryVO clubCategoryVO = findingClubService.getClubCategoryByNo(clubCategoryNo);
		
		model.addAttribute("clubCategoryVO", clubCategoryVO);
		model.addAttribute("clubList", clubList);
		model.addAttribute("clubCategoryNo", clubCategoryNo);
		
		return "student/findingclub/student_clubsOfCategoryPage";
	
	}
	
	@RequestMapping("student_clubIntroducingPage")
	public String student_clubIntroducingPage(Model model, String club_no) {
		int clubNo = Integer.parseInt(club_no);
		
		ClubVO clubData = findingClubService.getClubByNo(clubNo);
		StudVO clubBossData = findingClubService.getStudByStudId(clubData.getClub_boss()) ;
		Club_Dept_CategoryVO clubCategoryData = findingClubService.getClubCategoryByNo(clubData.getClub_category_no());
		model.addAttribute("clubCategoryData", clubCategoryData);
		model.addAttribute("clubData", clubData);
		model.addAttribute("clubBossData", clubBossData);
		
		
		return "student/findingclub/student_clubIntroducingPage";
	}
	
	
	// 클럽 가입신청 완료 페이지. 페이지 이동과 동시에 동아리 회원에 club_no와 stud_id를 포함한 상태로 insert됨
	@RequestMapping("student_clubRequestJoinProcess")
	public String student_clubRequestJoinProcess(String club_no, HttpSession session, HttpServletResponse response, String msg) {
		
		if((StudVO)session.getAttribute("sessionUserInfo")==null) {
			 try {
					response.setContentType("text/html; charset=utf-8");
					PrintWriter w = response.getWriter();
					msg = "로그인이 필요합니다.";
					w.write("<script>alert('"+msg+"');location.href='"+"../login/student_LoginPage'"+";</script>");
					w.flush();
					w.close();
		     }catch(Exception e) {
					e.printStackTrace();
		     }
			
			return "";
		}else {
		
		int clubNo = Integer.parseInt(club_no);
		
		StudVO studVO = (StudVO)session.getAttribute("sessionUserInfo");
		Club_StudVO club_StudVO = new Club_StudVO();
		String studId = studVO.getStud_id(); 
		

		club_StudVO.setStud_id(studId);
		club_StudVO.setClub_no(clubNo);
		
		System.out.println(club_StudVO.getClub_no());
		System.out.println(club_StudVO.getClub_stud_etc());
		System.out.println(club_StudVO.getClub_stud_grade());
		System.out.println(club_StudVO.getClub_stud_no());
		System.out.println(club_StudVO.getClub_stud_state());
		System.out.println(club_StudVO.getStud_id());
		System.out.println(club_StudVO.getClub_stud_drop_date());
		System.out.println(club_StudVO.getClub_stud_join_date());
		
		if(findingClubService.getClubStudByStudId(studId) != null) {
			try {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter w = response.getWriter();
				msg = "회원님은 이미 동아리에 가입되어 있거나, 가입 심사중인 상태입니다";
				w.write("<script>alert('"+msg+"');location.href='"+"/cbh/student/index/student_IndexPage'"+";</script>");
				w.flush();
				w.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return "";
		}
		
		findingClubService.inputClubStud(club_StudVO);
		
		return "student/findingclub/student_clubRequestJoinCompletePage";
		}
	}
	
	
	
}
