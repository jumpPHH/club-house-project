package com.ja.cbh.student.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student/main/*")
public class Student_MainController {

	@RequestMapping("student_MainPage")
	public String student_MainPage() {
		
		return "student/main/student_MainPage";
	}
}
