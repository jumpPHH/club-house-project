package com.ja.cbh.student.myclubactivity.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.student.myclubactivity.service.Student_MyClubActivityServiceImpl;
import com.ja.cbh.vo.Club_ActVO;
import com.ja.cbh.vo.Club_StudVO;


@Controller
@RequestMapping("/student/myclubactivity/*")
public class Student_MyClubActivityController {
	
	@Autowired
	private Student_MyClubActivityServiceImpl student_MyClubActivityService;
	
	
	
	@RequestMapping("student_MyClubActivityWritePage")
	public String student_MyClubActivityWritePage() {
		
		return "student/myclubactivity/student_MyClubActivityWritePage";
	}

	@RequestMapping("student_MyClubActivityWritePageProcess")
	public String student_MyClubActivityWritePageProcess(Club_ActVO param , HttpSession session) {
		
		
		Club_StudVO sessionUser = (Club_StudVO)session.getAttribute("sessionUserInfo");
		int clubStudNo = sessionUser.getClub_stud_no();
		
		param.setClub_no(clubStudNo);
		
		student_MyClubActivityService.student_MyClubActivityWritePage(param);
		
		return "redirect:./student_MyClubActivityListPage";
	}
	
	
	
	@RequestMapping("student_MyClubActivityListPage")
	public String student_MyClubActivityListPage() {
		
		return "student/myclubactivity/student_MyClubActivityListPage";
	}
	
	@RequestMapping("student_MyClubActivityReadPage")
	public String student_MyClubActivityReadPage() {
		
		return "student/myclubactivity/student_MyClubActivityReadPage";
	}
	
	
	
	
	
}
