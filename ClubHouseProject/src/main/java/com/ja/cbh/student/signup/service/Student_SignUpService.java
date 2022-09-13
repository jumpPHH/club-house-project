package com.ja.cbh.student.signup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.signup.mapper.Student_SignUpSQLMapper;
import com.ja.cbh.vo.StudVO;

@Service
public class Student_SignUpService {
	
	@Autowired
	private Student_SignUpSQLMapper signUpSQLMapper;
	
	
	//회원가입 로직 처리 
	public void student_SignUpRegister(StudVO studVO) {
		
		//세팅된 멤버 넘버로 회원가입.
		signUpSQLMapper.insertStudent(studVO);

	}
}
