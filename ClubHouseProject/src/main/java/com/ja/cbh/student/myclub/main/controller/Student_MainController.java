package com.ja.cbh.student.myclub.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.student.myclub.main.service.Student_MainService;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("/student/myclub/main/*")
public class Student_MainController {

	@Autowired
	private Student_MainService mainService;
	
	@RequestMapping("student_MainPage")
	public String student_MainPage(HttpSession session,Model model) {
		StudVO sessionUserInfo = (StudVO)session.getAttribute("sessionUserInfo");
		String stud_id = sessionUserInfo.getStud_id();		
	
		model.addAttribute("MainData",mainService.student_MainData(stud_id));
		model.addAttribute("MainBoardData",mainService.student_MainBoardData(stud_id));
		model.addAttribute("MainActData",mainService.student_MainActData(stud_id));
		
		return "student/myclub/main/student_MainPage"; 
	}
	
	@RequestMapping("student_ErrorPage")
	public String student_ErrorPage() {
	
		return "student/myclub/main/student_ErrorPage"; 
	}
}
