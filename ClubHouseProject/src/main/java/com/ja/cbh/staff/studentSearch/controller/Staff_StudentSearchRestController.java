package com.ja.cbh.staff.studentSearch.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.staff.studentSearch.service.Staff_StudentSearchRestService;
import com.ja.cbh.staff.studentSearch.service.Staff_StudentSearchService;
import com.ja.cbh.vo.StudVO;

@RestController
@RequestMapping("/staff/studentSearch/")
public class Staff_StudentSearchRestController {
	
	@Autowired
	private Staff_StudentSearchService staff_StudentSearchService;	
	
	@Autowired
	private Staff_StudentSearchRestService staff_StudentSearchRestService;
	
	@RequestMapping("studData")
	public HashMap<String, Object> studData(Model model, String stud_id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("studentData", staff_StudentSearchService.getStudentDataList());
		//map.put("data", staff_StudentSearchService.getStudentData(stud_id));
		
		return map;
	}
	
//	@RequestMapping("getstudDataList")
//	public HashMap<String, Object> getstudDataList(Model model){
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("studentData", staff_StudentSearchService.getStudentDataList());
//		
//		return map;
//	}
	
	@RequestMapping("deleteData")
	public HashMap<String, Object> deleteData(String stud_id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		staff_StudentSearchRestService.deleteData(stud_id);
		
		return map;
	}
	
	@RequestMapping("updateData")
	public HashMap<String, Object> updateData(StudVO param){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		staff_StudentSearchRestService.updateData(param);
		return map;
	}
	
	@RequestMapping("totalCount")
	public HashMap<String, Object> totalCount(int no){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		staff_StudentSearchRestService.getStudentCount(no);
		
		return map;
	}
}
