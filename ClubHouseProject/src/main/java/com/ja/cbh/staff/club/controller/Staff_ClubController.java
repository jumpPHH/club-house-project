package com.ja.cbh.staff.club.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/staff/club/*")
@Controller
public class Staff_ClubController {

	@RequestMapping("staff_ClubStudControlPage")
	public String staff_ClubStudControlPage() {
		
		
		return "staff/club/staff_ClubStudControlPage";
	}
}
