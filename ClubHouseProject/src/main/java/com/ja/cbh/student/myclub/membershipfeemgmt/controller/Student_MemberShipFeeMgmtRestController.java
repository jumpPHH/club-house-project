package com.ja.cbh.student.myclub.membershipfeemgmt.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.student.myclub.membershipfeemgmt.service.Student_MemberShipFeeMgmtRestService;

@RestController
@RequestMapping("/student/myclub/membershipfeemgmt/*")
public class Student_MemberShipFeeMgmtRestController {
	
	@Autowired
	private Student_MemberShipFeeMgmtRestService memberShipFeeMgmtRestService;
	
	@RequestMapping("student_MemberShipFeeMgmtRegistration")
	public HashMap<String, Object> student_MemberShipFeeMgmtRegistration(@RequestBody ArrayList<HashMap<String, Object>> data2){
		HashMap<String, Object> map = new HashMap<String, Object>();
		String table = (String)data2.get(0).get("TABLE");
		for(HashMap<String, Object> maps : data2) {
			if(maps.get("DIV").equals("저장")) {
				memberShipFeeMgmtRestService.inputMemberShipFeeMgmt(maps);
			}
		}
		return map;
	}
	
	
}
