package com.ja.cbh.staff.signup.mapper;

import com.ja.cbh.vo.StaffVO;

public interface Staff_SignUpSQLMapper {

	
	//회원가입 할때 쓰이는 등록 쿼리
	public void insertStaff(StaffVO staffVO);

	public StaffVO selectById(String staffId);
}
