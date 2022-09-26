package com.ja.cbh.student.myclub.membershipfeemgmt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.student.myclub.main.service.Student_MainService;
import com.ja.cbh.student.myclub.membershipfeemgmt.service.Student_MemberShipFeeMgmtService;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("/student/myclub/membershipfeemgmt/*")
public class Student_MemberShipFeeMgmtController {
	
	@Autowired
	private Student_MemberShipFeeMgmtService memberShipFeeMgmtService; 
	
	@RequestMapping("student_MemberShipFeeMgmtPage")
	public String student_MemberShipFeeMgmtPage(HttpSession session , Model model) {
		
		StudVO sessionUserInfo = (StudVO)session.getAttribute("sessionUserInfo");
		String stud_id = sessionUserInfo.getStud_id();
	
		model.addAttribute("ClubBossAndAccountingMemberIs",memberShipFeeMgmtService.clubBossAndAccountingMemberIs(stud_id));
		
		return "student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtPage";
	}
	
	@RequestMapping("student_MemberShipFeeMgmtListPage")
	public String student_MemberShipFeeMgmtListPage() {
		
		
		return "student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage";
	}
}
