package com.ja.cbh.staff.signup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.signup.mapper.Staff_SignUpSQLMapper;
import com.ja.cbh.vo.StaffVO;

@Service
public class Staff_SignUpService {
	
	@Autowired
	private Staff_SignUpSQLMapper signUpSQLMapper;
	
	//회원가입 로직 처리 
	public void staff_SignUpRegister(StaffVO staffVO) {
		
		signUpSQLMapper.insertStaff(staffVO);
		

	}
}
