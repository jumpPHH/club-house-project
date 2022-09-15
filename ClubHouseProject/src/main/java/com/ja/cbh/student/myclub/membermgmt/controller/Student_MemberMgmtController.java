package com.ja.cbh.student.myclub.membermgmt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student/myclub/membermgmt/*")
public class Student_MemberMgmtController {

	
	@RequestMapping("student_MemberMgmtPage")
	public String student_MemberMgmtPage() {
		
		
		return "student/myclub/membermgmt/student_MemberMgmtPage";
	}
	
	
	@RequestMapping("student_MemberJoinMgmtPage")
	public String student_MemberJoinMgmtPage() {
		
		
		return "student/myclub/membermgmt/student_MemberJoinMgmtPage";
	}
	
}
