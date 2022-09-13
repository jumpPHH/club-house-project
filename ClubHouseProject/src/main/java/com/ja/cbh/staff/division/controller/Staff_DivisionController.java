package com.ja.cbh.staff.division.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.staff.division.service.staff_DivisionService;

@Controller
@RequestMapping("/staff/division/*")
public class Staff_DivisionController {

	@Autowired
	private staff_DivisionService staff_DivisionService;
	
	@RequestMapping("staff_DivisionPage")
	public String staff_MainPage(Model model) {
		
		model.addAttribute("data", staff_DivisionService.getNotiDivList());
		
		return "staff/division/staff_DivisionPage";
	}

}

