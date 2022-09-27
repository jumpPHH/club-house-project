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
	
	
	public ArrayList<HashMap<String, Object>> getStudentDataList(String studId){
		ArrayList<HashMap<String, Object>> studentDataList = new ArrayList<HashMap<String,Object>>();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		StudVO studVO = student_SignUpSQLMapper.selectByStudentId(studId);
		map.put("data", studVO);
		studentDataList.add(map);
		//System.out.println(student_SignUpSQLMapper.selectStudentAll(stud_id));
		System.out.println(studVO.getStud_id());
		return studentDataList;
	}
	
	public HashMap<String, Object> getStudentData(String studId){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		StudVO studVO = student_SignUpSQLMapper.selectByStudentId(studId);
		
		map.put("studVO", studVO);
		
		return map;
	}
	
	
	
	//학생 수 구하기
	public int getStudentCount(String stud_id) {
		return student_SignUpSQLMapper.countStudentById(stud_id);
	}
	
}
