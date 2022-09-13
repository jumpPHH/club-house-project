package com.ja.cbh.student.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.login.mapper.Student_LoginSQLMapper;
import com.ja.cbh.vo.StudVO;

@Service
public class Student_LoginService {
	 
	@Autowired
	private Student_LoginSQLMapper loginSQLMapper;
	
	//로그인 할때 ID,PW를 확인 하는 서비스 로직.
	public StudVO student_LoginProcess(StudVO studVO) {
		
		return loginSQLMapper.selectByIdAndPw(studVO);
	}
}
