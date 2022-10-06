package com.ja.cbh.staff.studentSearch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.studentSearch.mapper.Staff_StudentSearchSQLMapper;
import com.ja.cbh.student.signup.mapper.Student_SignUpSQLMapper;
import com.ja.cbh.vo.StudVO;

@Service
public class Staff_StudentSearchRestService {
	
	@Autowired
	private Staff_StudentSearchSQLMapper staff_StudentSearchSQLMapper;
	
	@Autowired
	private Student_SignUpSQLMapper student_SignUpSQLMapper;
	
	
	//학생 수 구하기
		public int getStudentCount(int no) {
			return student_SignUpSQLMapper.countStudentById(no);
		}
		
		public void deleteData(String stud_id) {
			student_SignUpSQLMapper.deleteByStudentId(stud_id);
		}
		
		public void updateData(StudVO studVO) {
			student_SignUpSQLMapper.updateByStudentId(studVO);
		}
	
}
