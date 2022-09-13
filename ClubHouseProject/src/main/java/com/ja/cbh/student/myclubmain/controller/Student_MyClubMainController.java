package com.ja.cbh.student.myclubmain.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.student.myclubmain.service.Student_MyClubMainService;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("/student/myclubmain/*")
public class Student_MyClubMainController {

	@Autowired
	private Student_MyClubMainService myClubMainService;
	
	@RequestMapping("student_MyClubMainPage")
	public String student_MyClubMainPage(StudVO studVO, HttpSession session,Model model) {
		StudVO sessionUserInfo = (StudVO)session.getAttribute("sessionUserInfo");
		String stud_id = sessionUserInfo.getStud_id();
		studVO.setStud_id(stud_id);
		
		model.addAttribute("myClubMainData",myClubMainService.student_MyCLubMainData(studVO)); 

		return "student/myclubmain/student_MyClubMainPage"; 
	}
}
