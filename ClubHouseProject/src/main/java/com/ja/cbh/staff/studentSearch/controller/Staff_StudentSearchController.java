package com.ja.cbh.staff.studentSearch.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.staff.studentSearch.service.Staff_StudentSearchService;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("/staff/studentSearch/*")
public class Staff_StudentSearchController {

	@Autowired
	private Staff_StudentSearchService staff_StudentSearchService;
	
	@RequestMapping("staff_StudentSearchPage")
	public String staff_StudentSearchPage(Model model){
		
//		ArrayList<HashMap<String, Object>> studentList = staff_StudentSearchService.getStudentData();
//		model.addAttribute("studentList", studentList);
		
		return "staff/studentSearch/staff_StudentSearchPage";
	}
	
	
}
