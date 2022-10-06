package com.ja.cbh.staff.login.mapper;


import com.ja.cbh.vo.StaffVO;

public interface Staff_LoginSQLMapper {

	//ID,PW를 찾는 쿼리
	public StaffVO selectByIdAndPw(StaffVO staffVO);
	
}
