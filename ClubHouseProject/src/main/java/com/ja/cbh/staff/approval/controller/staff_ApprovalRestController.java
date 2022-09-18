package com.ja.cbh.staff.approval.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.staff.approval.service.staff_ApprovalRestService;
import com.ja.cbh.vo.StaffVO;

@RestController
@RequestMapping("/staff/restApproval/*")
public class staff_ApprovalRestController {

	@Autowired
	private staff_ApprovalRestService staff_ApprovalRestService;

	@RequestMapping("getApvList")
	public HashMap<String, Object> getApvList(String type,HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		StaffVO staffVo = (StaffVO)session.getAttribute("sessionUserInfo");
		if(type.equals("나의결재")) {
			map.put("ApvList", staff_ApprovalRestService.getApvList(staffVo.getStaff_id()));
		}else if(type.equals("전체")) {
			
		}else if(type.equals("진행중")) {
			
		}else if(type.equals("결재완료")) {
			
		}else if(type.equals("반려")) {
			
		}
		
		return map;
	}	
	
	@RequestMapping("getApv")
	public HashMap<String, Object> getApv(String APV_NO){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("Apv", staff_ApprovalRestService.getApv(APV_NO));
		
		return map;
	}
}
