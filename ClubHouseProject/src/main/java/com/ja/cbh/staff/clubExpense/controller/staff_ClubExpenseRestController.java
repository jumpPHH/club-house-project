package com.ja.cbh.staff.clubExpense.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.staff.clubExpense.service.staff_ClubExpenseRestService;

@RestController
@RequestMapping("/staff/restClubExpense/*")
public class staff_ClubExpenseRestController {

	@Autowired
	private staff_ClubExpenseRestService staff_ClubExpenseRestService;

	@RequestMapping("getClubExpenseList")
	public HashMap<String, Object> getClubExpenseList(@RequestBody HashMap<String, Object> param){
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(param.get("SEARCHWORD"));
		System.out.println(param.get("STATE"));
		map.put("data", staff_ClubExpenseRestService.getClubExpenseApplyList(param));
		
		
		return map;
	}
	
	@RequestMapping("getClubExpenseData")
	public HashMap<String, Object> getClubExpenseData(
			@RequestParam(value = "No", defaultValue = "0") int No){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("data", staff_ClubExpenseRestService.getClubExpenseApplyByClubExpnsApplyNo(No));
		
		return map;
	}

	@RequestMapping("updateClubExpenseState")
	public HashMap<String, Object> updateClubExpenseState(@RequestBody HashMap<String, Object> param){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(param.get("NO"));
		System.out.println(param.get("STATE"));
		
		staff_ClubExpenseRestService.modifyClubExpnsApplyStateByClubExpnsApplyNo(param);
		int No = (int)param.get("NO");
		
		map.put("data", staff_ClubExpenseRestService.getClubExpenseApplyByClubExpnsApplyNo(No));
		
		
		return map;
	}

}
