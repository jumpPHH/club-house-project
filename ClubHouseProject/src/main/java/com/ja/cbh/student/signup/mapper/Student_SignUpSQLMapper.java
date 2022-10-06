package com.ja.cbh.student.signup.mapper;

import java.util.ArrayList;

import com.ja.cbh.vo.StudVO;

public interface Student_SignUpSQLMapper {

	//회원가입 할때 쓰이는 등록 쿼리
	public void insertStudent(StudVO studVO);
	
	//학생조회에 필요한 정보
	public StudVO selectByStudentId(String studId);
	
	public ArrayList<StudVO> selectStudentAll();
	
	//학번으로 학생 수
	public int countStudentById(int no);
	
	//삭제
	public void deleteByStudentId(String stud_id);
	//수정
	public void updateByStudentId(StudVO studVO);
	
}
