package com.ja.cbh.staff.division.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.vo.StaffVO;


@RestController
@RequestMapping("/staff/restDivision/*")
public class Staff_DivisionRestController {

	
	@RequestMapping("/test")
	public HashMap<String, Object> test (@RequestBody List<Map<String, Object>> data2){
		HashMap<String, Object> map = new HashMap<String, Object>();
			
			for(Map<String, Object> maps : data2) {
				System.out.println(maps.get("staff_id"));
			}
		return map; 
	}
}
