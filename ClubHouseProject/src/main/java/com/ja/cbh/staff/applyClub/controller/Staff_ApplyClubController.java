package com.ja.cbh.staff.applyClub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/staff/applyClub/*")
public class Staff_ApplyClubController {
	
	@RequestMapping("applyClubPage")
	public String applyClubPage() {
		
		return "staff/applyClub/applyClubPage";
	}
}
