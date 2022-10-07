package com.ja.cbh.staff.studentSearch.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.studentSearch.mapper.Staff_StudentSearchSQLMapper;
import com.ja.cbh.student.signup.mapper.Student_SignUpSQLMapper;
import com.ja.cbh.vo.StudVO;

@Service
public class Staff_StudentSearchService {
	
	@Autowired
	private Staff_StudentSearchSQLMapper staff_StudentSearchSQLMapper;
	
	@Autowired
	private Student_SignUpSQLMapper student_SignUpSQLMapper;
	
	
	public ArrayList<StudVO> getStudentDataList(){
	
		return student_SignUpSQLMapper.selectStudentAll();
	}
	
	public HashMap<String, Object> getStudentData(String stud_id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		StudVO studVO = student_SignUpSQLMapper.selectByStudentId(stud_id);
		
		map.put("studVO", studVO);
		
		return map;
	}
	
	
}
