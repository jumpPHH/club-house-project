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
	
	public ArrayList<HashMap<String, Object>> getMyApvList(HashMap<String, Object> param){
		return staff_ApprovalRestSQLMapper.selectApvBystaffId(param);
	}
	
	public ArrayList<HashMap<String, Object>> getRequestedApvList(HashMap<String, Object> param){
		
		return staff_ApprovalRestSQLMapper.selectApvByStaffMidIdAndStaffFnlId(param);
	}
	
	public HashMap<String, Object> getApv(String APV_NO){
		
		return staff_ApprovalRestSQLMapper.selectApvByApvNo(APV_NO);
	}
	
	
}
