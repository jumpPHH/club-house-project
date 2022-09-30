package com.ja.cbh.staff.division.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.staff.division.service.staff_DivisionRestService;
import com.ja.cbh.vo.StaffVO;


@RestController
@RequestMapping("/staff/restDivision/*")
public class Staff_DivisionRestController {

	@Autowired
	private staff_DivisionRestService staff_DivisionRestService;
	
	
	@RequestMapping("/saveDivision")
	public HashMap<String, Object> saveDivision (@RequestBody ArrayList<HashMap<String, Object>> data2){
		HashMap<String, Object> map = new HashMap<String, Object>();
			String table = (String)data2.get(0).get("TABLE");
			for(HashMap<String, Object> maps : data2) {
				if(maps.get("DIV").equals("신규")) {
					System.out.println("테이블 :"+maps.get("TABLE"));
					System.out.println("넘버 :"+maps.get("NO"));
					System.out.println("이름 :" +maps.get("NAME"));
					System.out.println("영어이름 :"+maps.get("ENG"));
					System.out.println("약어:" + maps.get("ABRVT"));
					System.out.println("**************************");
					staff_DivisionRestService.inputDivision(maps);
				}else if(maps.get("DIV").equals("수정")) {
					
					staff_DivisionRestService.modifyDivision(maps);
				}else if(maps.get("DIV").equals("삭제")) {
					staff_DivisionRestService.deleteDivision(maps);
				}
			}
			
		map.put("data", staff_DivisionRestService.getDivisionList(table));	
		map.put("count", staff_DivisionRestService.getCountDivision(table));	
	
		return map; 
	}
	
	@RequestMapping("/getDivisionList")
	public HashMap<String, Object> getDivisionList (String table){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("data", staff_DivisionRestService.getDivisionList(table));
		map.put("count", staff_DivisionRestService.getCountDivision(table));
	
		return map;
	}
	
	@RequestMapping("getApvForm")
	public HashMap<String, Object> getApvForm(String NO){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("FORM", staff_DivisionRestService.getApvForm(NO));
		return map;
	}
	
	@RequestMapping("saveApvForm")
	public HashMap<String, Object> saveApvForm(@RequestBody HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		staff_DivisionRestService.modifyApvForm(param);
	 return map;
	}
}
