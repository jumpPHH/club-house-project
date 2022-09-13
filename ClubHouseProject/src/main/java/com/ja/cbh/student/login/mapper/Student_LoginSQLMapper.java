package com.ja.cbh.student.login.mapper;

import com.ja.cbh.vo.StudVO;

public interface Student_LoginSQLMapper {

	//ID,PW를 찾는 쿼리
	public StudVO selectByIdAndPw(StudVO studVO);
	
}
