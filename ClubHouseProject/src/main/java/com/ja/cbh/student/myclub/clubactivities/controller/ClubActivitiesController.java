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
import com.ja.cbh.vo.Club_ActVO;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("/student/myclub/clubactivities/*")
public class ClubActivitiesController {

	@Autowired
	private ClubActivitesServiceImpl clubActivitiesService;
	
	// 동아리 활동내역 메인페이지. 동아리 활동 내역이 보이는 페이지임.
	// 나중에 추가해야할 기능. 해당 동아리가 아닌 사람이 파라미터만 수정해서 데이터를 
	@RequestMapping("student_indexPage")
	public String student_indexPage(Model model, @RequestParam(value="club_no")String club_no) {
		int clubNo = Integer.parseInt(club_no);
		
		ArrayList<Club_ActVO> clubActivitiesList = clubActivitiesService.getClubActivitiesList(clubNo);
		
		model.addAttribute("clubActivitiesList", clubActivitiesList);
		
		
		return "student/myclub/clubactivities/student_indexPage";
	}
	
	
	//특정 글 상세보기 페이지
	@RequestMapping("student_clubActivitiesContentPage")
	public String student_clubActivitiesContentPage(Model model, String club_act_no, String club_no, HttpSession session) {
		int clubActNo = Integer.parseInt(club_act_no);
		int clubNo = Integer.parseInt(club_no);
		
		 StudVO sessionUserInfo = (StudVO)session.getAttribute("sessionUserInfo");
		
		HashMap<String, Object> map = clubActivitiesService.getClubActivityByClubActNoAndClubNo(clubActNo,clubNo);
		model.addAttribute("map", map);      
		model.addAttribute("sessionUserInfo",sessionUserInfo);
		
		return "student/myclub/clubactivities/student_clubActivitiesContentPage";
	}
	
	@RequestMapping("student_modifyClubActPage")
	public String student_modifyClubActPage() {
		
		
		return "student/myclub/clubactivities/student_modifyClubActPage";
	}
	
}
