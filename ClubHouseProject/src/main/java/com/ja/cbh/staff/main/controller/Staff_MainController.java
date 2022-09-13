package com.ja.cbh.staff.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/staff/main/*")
public class Staff_MainController {

	@RequestMapping("staff_MainPage")
	public String staff_MainPage() {
		
		return "staff/main/staff_MainPage";
	}
	

}
