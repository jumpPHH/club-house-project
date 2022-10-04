package com.ja.cbh.student.myclub.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.student.myclub.schedule.service.Student_ClubScheduleRestService;

@Controller
@RequestMapping("/student/myclub/schedule/*")
public class Student_ClubScheduleController {

	@Autowired
	private Student_ClubScheduleRestService clubScheduleRestService;
	
	@RequestMapping("student_ClubSchedulePage")
	public String student_ClubSchedulePage(Model model) {
		
		model.addAttribute("ShowScheduleData",	clubScheduleRestService.showSchedule());

		return "student/myclub/schedule/student_ClubSchedulePage";
	}
}
