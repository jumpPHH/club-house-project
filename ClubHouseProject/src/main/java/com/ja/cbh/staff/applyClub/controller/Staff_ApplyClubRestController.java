package com.ja.cbh.staff.applyClub.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.staff.applyClub.service.Staff_ApplyClubService;

@RestController
@RequestMapping("/staff/restApplyClub/*")
public class Staff_ApplyClubRestController {
	
	@Autowired
	private Staff_ApplyClubService staff_ApplyClubService;
	
	
	@RequestMapping("updateClubApplyState")
	public HashMap<String, Object> updateRejectClubApplyState(@RequestBody HashMap<String, Object> param){
		HashMap<String, Object> map = new HashMap<String, Object>();
		staff_ApplyClubService.modifyClubApplyState(param);
		
		return map;
	}
	
	
	@RequestMapping("getClubApply")
	public HashMap<String, Object> getClubApply(int no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("data", staff_ApplyClubService.getApplData(no));
		
		return map;
	}

}
