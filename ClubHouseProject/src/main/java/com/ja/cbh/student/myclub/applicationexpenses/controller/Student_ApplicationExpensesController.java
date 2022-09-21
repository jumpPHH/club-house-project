package com.ja.cbh.student.myclub.applicationexpenses.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student/myclub/applicationexpenses/*")
public class Student_ApplicationExpensesController {
	
	
	@RequestMapping("student_ApplicationExpensesPage")
	public String student_ApplicationExpensesPage() {
		
		
		return "/student/myclub/applicationexpenses/student_ApplicationExpensesPage";
	}
	
	@RequestMapping("student_ApplicationExpensesListPage")
	public String student_ApplicationExpensesListPage() {
		
		
		return "/student/myclub/applicationexpenses/student_ApplicationExpensesListPage";
	}
}
