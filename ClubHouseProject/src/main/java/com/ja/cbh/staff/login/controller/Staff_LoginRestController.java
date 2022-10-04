package com.ja.cbh.staff.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.staff.login.service.Staff_LoginRestService;
import com.ja.cbh.vo.StaffVO;

@RestController
@RequestMapping("/staff/restLogin/*")
public class Staff_LoginRestController {

	@Autowired
	private Staff_LoginRestService staff_LoginRestService;
	
	@RequestMapping("getStaffInfo")
	public HashMap<String, Object> getStaffInfo(HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		StaffVO staffVO = (StaffVO)session.getAttribute("sessionUserInfo");
		
		
		
		
		map.put("session", staff_LoginRestService.getStaffByStaffId(staffVO.getStaff_id()));
		
		
		return map;
	}
}
