package com.ja.cbh.staff.approval.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.approval.mapper.staff_ApprovalSQLMapper;

@Service
public class staff_ApprovalService {
	
	@Autowired
	private staff_ApprovalSQLMapper staff_ApprovalSQLMapper;
	
	public ArrayList<HashMap<String, Object>> getApvDivList(){
		
		return staff_ApprovalSQLMapper.selectApvDivByApvDivState();
	}
	
	public ArrayList<HashMap<String, Object>> getStaffList(){
		
		return staff_ApprovalSQLMapper.selectStaffByStaffState();
	}
	
	public void inputApv(HashMap<String, Object> param) {
		staff_ApprovalSQLMapper.insertApv(param);
	}
	
	public void inputApvAttachFile(HashMap<String, Object> param) {
		staff_ApprovalSQLMapper.insertApvAttachFile(param);
	}
	
	public String createApvPk() {
		return staff_ApprovalSQLMapper.createApvPk();
	}
	

}
