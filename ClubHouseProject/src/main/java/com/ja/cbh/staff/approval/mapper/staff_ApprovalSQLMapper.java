package com.ja.cbh.staff.approval.mapper;

import java.util.ArrayList;
import java.util.HashMap;

public interface staff_ApprovalSQLMapper {

	public ArrayList<HashMap<String, Object>> selectApvDivByApvDivState();
	
	public ArrayList<HashMap<String, Object>> selectStaffByStaffState();
	
	public void insertApv(HashMap<String, Object> param);
	
	public void insertApvAttachFile(HashMap<String, Object> param);
	
	public String createApvPk();
	
	

}