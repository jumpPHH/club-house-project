package com.ja.cbh.student.myclub.membershipfeemgmt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student/myclub/membershipfeemgmt/*")
public class Student_MemberShipFeeMgmtController {

	
	@RequestMapping("student_MemberShipFeeMgmtPage")
	public String student_MemberShipFeeMgmtPage() {
		
		return "student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtPage";
	}
	
	@RequestMapping("student_MemberShipFeeMgmtListPage")
	public String student_MemberShipFeeMgmtListPage() {
		
		return "student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage";
	}
}
