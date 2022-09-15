package com.ja.cbh.staff.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.staff.login.service.Staff_LoginService;
import com.ja.cbh.vo.StaffVO;

@Controller
@RequestMapping("/staff/login/*")
public class Staff_LoginController {

	@Autowired
	private Staff_LoginService loginService;

	@RequestMapping("staff_LoginPage")
	public String staff_LoginPage() {
		
		return "staff/login/staff_LoginPage";
	}
	
	//@로그인 기능
	@RequestMapping("staff_LoginProcess")
	public String staff_LoginProcess(StaffVO staffVO , HttpSession session) {
		
		StaffVO sessionUserInfo = loginService.staff_LoginProcess(staffVO);

		if(sessionUserInfo == null) {
			return "staff/login/staff_LoginFailPage";
		}else {
	
			session.setAttribute("sessionUserInfo", sessionUserInfo);
			return "redirect:../../staff/index/staff_IndexPage";
		}
	}
	
	//@로그아웃 기능 
	@RequestMapping("staff_LogoutProcess")// 로그아웃 -> 무조건 메인페이지로감
	public String staff_LogoutProcess(HttpSession session) {
		
		session.removeAttribute("sessionUserInfo");
		
		return "redirect:../../staff/login/staff_LoginPage";
	}
}
