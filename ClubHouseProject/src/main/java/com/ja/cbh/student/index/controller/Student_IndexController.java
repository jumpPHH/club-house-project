package com.ja.cbh.student.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student/index/*")
public class Student_IndexController {

	@RequestMapping("student_IndexPage")
	public String student_IndexPage() {
		
		return "student/index/student_IndexPage";
	}
}
