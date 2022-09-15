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
}
