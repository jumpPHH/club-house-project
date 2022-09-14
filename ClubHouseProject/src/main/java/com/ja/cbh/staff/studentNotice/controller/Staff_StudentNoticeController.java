package com.ja.cbh.staff.studentNotice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/staff/studentNotice/*")
public class Staff_StudentNoticeController {
	
	@RequestMapping("staff_StudentNoticePage")
	public String staff_StudentNoticePage(){
		
		return "staff/studentNotice/staff_StudentNoticePage";
	}
}
