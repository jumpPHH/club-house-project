package com.ja.cbh.staff.index.mapper;

import java.util.ArrayList;
import java.util.HashMap;

public interface Staff_IndexSQLMapper {

	public ArrayList<HashMap<String, Object>> selectClubAppl();
	
	public ArrayList<HashMap<String, Object>> selectClubExpnsApply();
	
	public ArrayList<HashMap<String, Object>> selectNoti();
	
	public ArrayList<HashMap<String, Object>> selectVlntrAppl();
	
	public ArrayList<HashMap<String, Object>> selectMyProcessApvByStaffId(String STAFF_ID);
	
	public int selectCountMyProcessApvByStaffId(String STAFF_ID);
	
	public ArrayList<HashMap<String, Object>> selectMyCompleteApvByStaffId(String STAFF_ID);
	
	public int selectCountMyCompleteApvByStaffId(String STAFF_ID);
	
	public ArrayList<HashMap<String, Object>> selectMyRejectApvByStaffId(String STAFF_ID);
	
	public int selectCountMyRejectApvByStaffId(String STAFF_ID);
	
	public int selectCountRequestApvByStaffId(String STAFF_ID);
}
