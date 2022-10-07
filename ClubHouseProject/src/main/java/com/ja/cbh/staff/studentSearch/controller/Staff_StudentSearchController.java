package com.ja.cbh.staff.studentSearch.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.staff.studentSearch.service.Staff_StudentSearchService;
import com.ja.cbh.vo.StaffVO;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("/staff/studentSearch/*")
public class Staff_StudentSearchController {

	@Autowired
	private Staff_StudentSearchService staff_StudentSearchService;
	
	@RequestMapping("staff_StudentSearchPage")
	public String staff_StudentSearchPage(Model model, HttpSession session){
		
//		ArrayList<StudVO> studentList = staff_StudentSearchService.getStudentDataList();
//		model.addAttribute("studentList", studentList);
		//System.out.println(studentList);
		
//		StaffVO sessionUserInfo = (StaffVO)session.getAttribute("sessionUserInfo");
//		String staff_id = sessionUserInfo.getStaff_id();
//		
//		model.addAttribute("studentData", staff_StudentSearchService.getStudentData(staff_id));
//		model.addAttribute("studentList", staff_StudentSearchService.getStudentData(studId));
		
		return "staff/studentSearch/staff_StudentSearchPage";
	}
	
	
}
