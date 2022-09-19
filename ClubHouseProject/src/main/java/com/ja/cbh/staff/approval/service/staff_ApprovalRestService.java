package com.ja.cbh.staff.approval.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.approval.mapper.staff_ApprovalRestSQLMapper;

@Service
public class staff_ApprovalRestService {

	@Autowired
	private staff_ApprovalRestSQLMapper staff_ApprovalRestSQLMapper;
	
	public ArrayList<HashMap<String, Object>> getApvList(String STAFF_ID){
		return staff_ApprovalRestSQLMapper.selectApvBystaffId(STAFF_ID);
	}
	
	public HashMap<String, Object> getApv(String APV_NO){
		
		return staff_ApprovalRestSQLMapper.selectApvByApvNo(APV_NO);
	}
}
