package com.ja.cbh.student.index.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.index.mapper.Student_IndexSQLMapper;

@Service
public class Student_IndexServiceImpl {

	@Autowired
	private Student_IndexSQLMapper student_IndexSQLMapper;
	
	// 로그인 한 사람이 가입되어 있는 클럽 가져오기.
	public int getClubNo(String studId) {
		int clubNo = student_IndexSQLMapper.getClubNo(studId);
		
		return clubNo;
	}
}
