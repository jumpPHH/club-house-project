package com.ja.cbh.staff.approval.mapper;

import java.util.ArrayList;
import java.util.HashMap;

public interface staff_ApprovalRestSQLMapper {

	public ArrayList<HashMap<String, Object>> selectApvBystaffId(String STAFF_ID);
	
	public HashMap<String, Object> selectApvByApvNo(String APV_NO);
}
