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
import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_Dept_CategoryVO;
import com.ja.cbh.vo.Club_StudVO;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("student/findingclub/*")
public class FindingClubController {

	@Autowired
	private FindingClubServiceImpl findingClubService;
	
	
	
	@RequestMapping("mainPage")
	public String mainPage(Model model) {
		System.out.println("안들어오지?");
		return "student/findingclub/mainPage";
	}
	
	@RequestMapping("clubs_Of_CategoryPage")
	public String club_Of_CategoryPage(Model model, @Param("club_category_no") String club_category_no, @Param("searchWord") String searchWord) {
		int clubCategoryNo = Integer.parseInt(club_category_no);
		
		Club_Dept_CategoryVO clubCategoryInfo = findingClubService.getClubCategoryByNo(clubCategoryNo);
		ArrayList<ClubVO> clubList = findingClubService.getAllClubsOfCategory(clubCategoryNo, searchWord);
		
		model.addAttribute("clubList", clubList);
		model.addAttribute("clubCategoryInfo", clubCategoryInfo);
		model.addAttribute("clubCategoryNo", clubCategoryNo);
		
		return "student/findingclub/clubs_Of_CategoryPage";
	
	}
	
	@RequestMapping("club_IntroducingPage")
	public String club_introducingPage(Model model, String club_no) {
		int clubNo = Integer.parseInt(club_no);
		
		ClubVO clubData = findingClubService.getClubByNo(clubNo);
		model.addAttribute("clubData", clubData);
		
		return "student/findingclub/club_IntroducingPage";
	}
	
	
	// 클럽 가입신청 완료 페이지. 페이지 이동과 동시에 동아리 회원에 club_no와 stud_id를 포함한 상태로 insert됨
	@RequestMapping("club_requestJoinProcess")
	public String club_requestJoinCompletePage(String club_no, HttpSession session, HttpServletResponse response, String msg) {
		
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
		
		
		findingClubService.inputClubStud(club_StudVO);
		
		return "student/findingclub/club_requestJoinCompletePage";
		}
	}
	
	
	
}
