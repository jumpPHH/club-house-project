package com.ja.cbh.student.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.student.login.service.Student_LoginService;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("/student/login/*")
public class Student_LoginController {

	@Autowired
	private Student_LoginService loginService;

	@RequestMapping("student_LoginPage")
	public String student_LoginPage() {
		
		return "student/login/student_LoginPage";
	}
	
	//@로그인 기능
	@RequestMapping("student_LoginProcess")
	public String student_LoginProcess(StudVO studVO, HttpSession session) {
		
		StudVO sessionUserInfo = loginService.student_LoginProcess(studVO);

		if(sessionUserInfo == null) {
			return "student/login/student_LoginFailPage";
		}else {
	
			session.setAttribute("sessionUserInfo", sessionUserInfo);
			return "redirect:../../student/myclub/main/student_MainPage";
		}
	}
	
	//@로그아웃 기능 
	@RequestMapping("student_LogoutProcess")// 로그아웃 -> 무조건 로그인페이지로감
	public String student_LogoutProcess(HttpSession session) {
		
		session.removeAttribute("sessionUserInfo");
		
		return "redirect:../../student/login/student_LoginPage";
	}
}
