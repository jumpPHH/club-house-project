package com.ja.cbh.student.myclub.membershipfeemgmt.controller;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.student.myclub.membershipfeemgmt.service.Student_MemberShipFeeMgmtRestService;
import com.ja.cbh.vo.Club_Fee;

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
	
	
	@RequestMapping("student_MemberShipFeeMgmtSave")
	public HashMap<String, Object> student_MemberShipFeeMgmtSave(@RequestBody ArrayList<HashMap<String, Object>> data2){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(HashMap<String, Object> maps : data2) {			
				memberShipFeeMgmtRestService.updateMemberShipFeeMgmtSave(maps);
			
		}
		return map;
	}
	
	@RequestMapping("student_MemberShipFeeMgmtDelete")
	public HashMap<String, Object> student_MemberShipFeeMgmtDelete(int club_fee_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
				memberShipFeeMgmtRestService.deleteMemberShipFeeMgmtDelete(club_fee_no);
				
		return map;
	}
	
	@RequestMapping("student_MemberShipFeeMgmtDetail")
	public HashMap<String, Object> student_MemberShipFeeMgmtDetail(int club_fee_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Club_Fee clubFeeDetailData = memberShipFeeMgmtRestService.selectMemberShipFeeMgmtDetail(club_fee_no);
		
		DecimalFormat decFormat = new DecimalFormat("###,###");

		int income_amount = clubFeeDetailData.getClub_fee_income_amount();
		int using_amount = clubFeeDetailData.getClub_fee_using_amount();

		String expnsApply1 = decFormat.format(income_amount)+"원";
		String expnsApply2 = decFormat.format(using_amount)+"원";
		
		try {
			Date club_fee_use_date = clubFeeDetailData.getClub_fee_use_date();	
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String dateToStr = dateFormat.format(club_fee_use_date);
			
			map.put("club_fee_use_date", dateToStr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		map.put("result","success");
		map.put("data", clubFeeDetailData);
		map.put("income_amount", expnsApply1);
		map.put("using_amount", expnsApply2);
		
		return map;
	}
	
	
	
}
