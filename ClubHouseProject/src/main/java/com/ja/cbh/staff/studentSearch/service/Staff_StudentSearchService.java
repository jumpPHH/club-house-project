package com.ja.cbh.staff.studentSearch.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.studentSearch.mapper.Staff_StudentSearchSQLMapper;
import com.ja.cbh.vo.StudVO;

@Service
public class Staff_StudentSearchService {
	
	@Autowired
	private Staff_StudentSearchSQLMapper staff_StudentSearchSQLMapper;
	
	//학생조회 Hashmap
//	public ArrayList<HashMap<String, Object>> getStudentData(StudVO StudVo) {
//		
//		return staff_StudentSearchSQLMapper.selectByStudentId(StudVo);
//	}
	
}
