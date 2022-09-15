package com.ja.cbh.staff.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/staff/index/*")
public class Staff_IndexController {

	@RequestMapping("staff_IndexPage")
	public String staff_IndexPage() {
		
		return "staff/index/staff_IndexPage";
	}
	

}
