package com.ja.cbh.staff.index.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.index.mapper.Staff_IndexSQLMapper;

@Service
public class Staff_IndexServiece {

	@Autowired
	private Staff_IndexSQLMapper staff_IndexSQLMapper;
	
	public HashMap<String, Object> getIndexData(String STAFF_ID){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("ClubApplList", staff_IndexSQLMapper.selectClubAppl());
		map.put("ClubExpnsApplyList", staff_IndexSQLMapper.selectClubExpnsApply());
		map.put("CountMyCompleteApv", staff_IndexSQLMapper.selectCountMyCompleteApvByStaffId(STAFF_ID));
		map.put("CountMyProcessApv", staff_IndexSQLMapper.selectCountMyProcessApvByStaffId(STAFF_ID));
		map.put("CountMyRejectApv", staff_IndexSQLMapper.selectCountMyRejectApvByStaffId(STAFF_ID));
		map.put("CountRequestApv", staff_IndexSQLMapper.selectCountRequestApvByStaffId(STAFF_ID));
		map.put("MyCompleteApvList", staff_IndexSQLMapper.selectMyCompleteApvByStaffId(STAFF_ID));
		map.put("MyProcessApvList", staff_IndexSQLMapper.selectMyProcessApvByStaffId(STAFF_ID));
		map.put("MyRejectApvList", staff_IndexSQLMapper.selectMyRejectApvByStaffId(STAFF_ID));
		map.put("NotiList", staff_IndexSQLMapper.selectNoti());
		map.put("VlntrApplList", staff_IndexSQLMapper.selectVlntrAppl());
		
		
		return map;
	}
	
}
