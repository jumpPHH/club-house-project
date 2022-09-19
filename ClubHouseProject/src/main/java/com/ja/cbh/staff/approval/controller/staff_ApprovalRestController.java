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
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		StaffVO staffVo = (StaffVO)session.getAttribute("sessionUserInfo");
		param.put("TYPE", type);
		param.put("STAFF_ID", staffVo.getStaff_id());
		map.put("ApvList", staff_ApprovalRestService.getApvList(param));
			
		
		return map;
	}	
	
	@RequestMapping("getApv")
	public HashMap<String, Object> getApv(String APV_NO){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("Apv", staff_ApprovalRestService.getApv(APV_NO));
		
		return map;
	}
}
