package com.ja.cbh.staff.studentSearch.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.staff.studentSearch.service.Staff_StudentSearchService;

@RestController
@RequestMapping("/staff/studentSearch/")
public class Staff_StudentSearchRestController {
	
	@Autowired
	private Staff_StudentSearchService staff_StudentSearchService;	
	
	
	public HashMap<String, Object> studData(Model model, String stud_id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("studentData", staff_StudentSearchService.getStudentData(stud_id));
		
		return map;
	}
}
