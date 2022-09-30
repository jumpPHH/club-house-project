package com.ja.cbh.staff.division.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.division.mapper.Staff_DivisionSQLMapper;

@Service
public class staff_DivisionService {

	@Autowired
	private Staff_DivisionSQLMapper staff_DivisionSQLMapper;
	
	public ArrayList<HashMap<String, Object>> getNotiDivList(){
		
		
		return staff_DivisionSQLMapper.selectNotiDiv();
	}
	
	
	
	
	
	
	
	
	

	
}
