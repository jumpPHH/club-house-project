package com.ja.cbh.student.signup.mapper;

import com.ja.cbh.vo.StudVO;

public interface Student_SignUpSQLMapper {

	//회원가입 할때 쓰이는 등록 쿼리
	public void insertStudent(StudVO studVO);
}
