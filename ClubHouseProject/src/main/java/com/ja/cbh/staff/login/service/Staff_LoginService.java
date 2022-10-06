package com.ja.cbh.staff.login.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.login.mapper.Staff_LoginSQLMapper;
import com.ja.cbh.vo.StaffVO;

@Service
public class Staff_LoginService {
	
	@Autowired
	private Staff_LoginSQLMapper loginSQLMapper;
	
	//로그인 할때 ID,PW를 확인 하는 서비스 로직.
	public StaffVO staff_LoginProcess(StaffVO staffVO) {
		
		return loginSQLMapper.selectByIdAndPw(staffVO);
	}
	
	
}
