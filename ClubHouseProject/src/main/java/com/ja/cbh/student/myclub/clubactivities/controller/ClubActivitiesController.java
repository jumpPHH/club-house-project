package com.ja.cbh.student.myclub.clubactivities.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.cbh.student.myclub.clubactivities.service.ClubActivitesServiceImpl;
import com.ja.cbh.student.myclub.main.service.Student_MainService;
import com.ja.cbh.vo.Club_ActVO;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("/student/myclub/clubactivities/*")
public class ClubActivitiesController {

	@Autowired
	private ClubActivitesServiceImpl clubActivitiesService;
	 @Autowired
	   private Student_MainService mainService;

	// 동아리 활동내역 메인페이지. 동아리 활동 내역이 보이는 페이지임.
	// 나중에 추가해야할 기능. 해당 동아리가 아닌 사람이 파라미터만 수정해서 데이터를
	@RequestMapping("student_indexPage")
	public String student_indexPage(Model model, HttpSession session,String searchWord,@RequestParam(value = "pageNum",defaultValue = "1") int pageNum) {
	   StudVO sessionUserInfo = (StudVO)session.getAttribute("sessionUserInfo");
      String stud_id = sessionUserInfo.getStud_id();
	
		
		
		model.addAttribute("MainData",mainService.student_MainData(stud_id));

		
		

		ArrayList<Club_ActVO> clubActivitiesList = clubActivitiesService.getClubActivitiesList(searchWord);
		
		int clubActCount = clubActivitiesService.getClubActCountByClubNoAndSearchWord(searchWord);
		
		int totalPageCount = (int)Math.ceil(clubActCount/10.0);
		//1 2 3 4 5	, 6 7 8 9 10 ....16 17 18 19 20
		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPageNum", pageNum);
		model.addAttribute("totalPageCount", totalPageCount);
		
		//링크 유지...
		String additionalParam = "";
		if(searchWord != null) {
			additionalParam += "&searchWord=" + searchWord;
		}
		
		model.addAttribute("additionalParam", additionalParam);

		model.addAttribute("clubActivitiesList", clubActivitiesList);

		return "student/myclub/clubactivities/student_indexPage";
	}

	// 특정 글 상세보기 페이지
	@RequestMapping("student_clubActivitiesContentPage")
	public String student_clubActivitiesContentPage(Model model, String club_act_no,
													HttpSession session) {
		int clubActNo = Integer.parseInt(club_act_no);
		
		StudVO sessionUserInfo = (StudVO) session.getAttribute("sessionUserInfo");

		HashMap<String, Object> map = clubActivitiesService.getClubActivityByClubActNoAndClubNo(clubActNo);

		model.addAttribute("map", map);
		model.addAttribute("sessionUserInfo", sessionUserInfo);

		return "student/myclub/clubactivities/student_clubActivitiesContentPage";
	}
	
	//작성 페이지
	@RequestMapping("student_writeClubActPage")
	public String student_writeClubActPage(Model model) {
		
		
		
		return "student/myclub/clubactivities/student_writeClubActPage";
	}
	
	@RequestMapping("student_writeClubActProcess")
	public String student_writeClubActProcess(Club_ActVO clubActVO, HttpSession session) {
		
		StudVO studVO = (StudVO)session.getAttribute("sessionUserInfo");
		clubActVO.setStud_id(studVO.getStud_id());
		
		clubActivitiesService.inputClubActByClubActVO(clubActVO);
		
		return "redirect:./student_indexPage";
	}

	//수정 페이지
	@RequestMapping("student_modifyClubActPage")
	public String student_modifyClubActPage(Model model, String club_act_no, String club_no) {
		int clubNo = Integer.parseInt(club_no);
		
		int clubActNo = Integer.parseInt(club_act_no);
		
		model.addAttribute("clubActNo", clubActNo);
		model.addAttribute("clubNo", clubNo);
		
		
		
		
		return "student/myclub/clubactivities/student_modifyClubActPage";
	}
	
	// 수정 프로세스
	@RequestMapping("student_modifyClubActProcess")
	public String student_modifyClubActProcess(Club_ActVO NewClubActVO) {
		int clubActNo = NewClubActVO.getClub_act_no();
		
		
		Club_ActVO originClubActVO = clubActivitiesService.getClubActByClubActNoAndClubNoForJustDataUse(clubActNo);
		originClubActVO.setClub_act_title(NewClubActVO.getClub_act_title());
		originClubActVO.setClub_act_content(NewClubActVO.getClub_act_content());
		
		clubActivitiesService.modifyClubAct(originClubActVO);
		
		return "redirect:./student_indexPage";
	}

	@RequestMapping("student_deleteClubActProcess")
	public String student_deleteClubActProcess(String club_act_no) {
		int clubActNo = Integer.parseInt(club_act_no);
	
		
		Club_ActVO clubActVO = new Club_ActVO();
		
		clubActVO.setClub_act_no(clubActNo);
		
		clubActivitiesService.deleteClubActByClubNoAndClubActNo(clubActVO);
		
		return "redirect:./student_indexPage";
	}
	
}
