package com.ja.cbh.staff.login.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.login.mapper.Staff_LoginRestSQLMapper;

@Service
public class Staff_LoginRestService {

	@Autowired
	private Staff_LoginRestSQLMapper staff_LoginRestSQLMapper;
	
	public HashMap<String, Object> getStaffByStaffId(String STAFF_ID){
		
		return staff_LoginRestSQLMapper.selectStaffByStaffId(STAFF_ID);
	}
	
}
