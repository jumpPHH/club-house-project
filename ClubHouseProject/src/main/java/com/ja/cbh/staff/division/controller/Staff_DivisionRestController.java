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

	
	@RequestMapping("/saveAndList")
	public HashMap<String, Object> saveAndList (@RequestBody List<Map<String, Object>> data2){
		HashMap<String, Object> map = new HashMap<String, Object>();
			
			for(Map<String, Object> maps : data2) {
				
				System.out.println("테이블 " + maps.get("TABLE"));
				System.out.println("분류 " + maps.get("DIV"));
				System.out.println("넘버 " + maps.get("NO"));
				System.out.println("코드명 " + maps.get("NAME"));
				System.out.println("상태 " + maps.get("STATE"));
			}
			
		return map; 
	}
}
