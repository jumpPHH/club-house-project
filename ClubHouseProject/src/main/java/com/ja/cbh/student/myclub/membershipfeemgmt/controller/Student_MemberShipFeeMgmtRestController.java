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
	public HashMap<String, Object> student_MemberShipFeeMgmtRegistration(@RequestBody ArrayList<HashMap<String, Object>> data , int club_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		String table = (String)data.get(0).get("TABLE");
		
		for(HashMap<String, Object> maps : data) {
			if(maps.get("DIV").equals("신규")) {
				memberShipFeeMgmtRestService.inputMemberShipFeeMgmt(maps);
			}else if(maps.get("DIV").equals("수정")) {
				memberShipFeeMgmtRestService.updateMemberShipFeeMgmt(maps);
			}else if(maps.get("DIV").equals("삭제")) { 
				memberShipFeeMgmtRestService.deleteMemberShipFeeMgmt(maps);
			}
		}
		
		map.put("data", memberShipFeeMgmtRestService.getMemberShipFeeMgmtList(table,club_no));
		
		return map;
	}
}
