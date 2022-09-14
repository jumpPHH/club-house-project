package com.ja.cbh.staff.studentSearch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.studentSearch.mapper.Staff_StudentSearchSQLMapper;

@Service
public class Staff_StudentSearchRestService {
	
	@Autowired
	private Staff_StudentSearchSQLMapper staff_StudentSearchSQLMapper;
}
