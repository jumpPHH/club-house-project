package com.ja.cbh.staff.club.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.staff.club.service.Staff_ClubRestService;

@RestController
@RequestMapping("/staff/club/*")
public class Staff_ClubRestController {

	@Autowired
	private Staff_ClubRestService staff_ClubRestService; 
	
	
	@RequestMapping("clubData")
	public HashMap<String, Object> clubData(){
		
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		
		map.put("data", staff_ClubRestService.getClubData()); 
		return map;
	}
	
	@RequestMapping("getStudData")
	public HashMap<String, Object> getStudData(int club_no){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> studList = staff_ClubRestService.getStudData(club_no);
		map.put("studList", studList); 
		
		return map;
	}
	
	@RequestMapping("allClubData")
	public HashMap<String, Object> allClubData(){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> allStudList = staff_ClubRestService.getAllStudData();
		map.put("allStudList", allStudList);
		
		return map;
	}
	
	@RequestMapping("search")
	public HashMap<String, Object> search(@RequestParam(value = "stud_name" , defaultValue = "")String stud_name, 
			@RequestParam(value = "stud_id" , defaultValue = "")String stud_id){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> searchStudList = staff_ClubRestService.getSearchStudData(stud_name, stud_id);
		map.put("searchStudList", searchStudList);
		
		
		return map;
	}
	
	
	
	
	
	
	
	
	
}
