package com.ja.cbh.student.myclubactivity.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.myclubactivity.mapper.Student_MyClubActivitySQLMapper;
import com.ja.cbh.vo.Club_ActVO;



@Service
public class Student_MyClubActivityServiceImpl {

	@Autowired
	private Student_MyClubActivitySQLMapper student_MyClubActivitySQLMapper;
	
	
	
	public void student_MyClubActivityWritePage(Club_ActVO club_ActVO) {
		student_MyClubActivitySQLMapper.insertMyClubActivity(club_ActVO);
	}
	
	public ArrayList<HashMap<String, Object>> getMyClubActivityDataList() {
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<Club_ActVO> myClubActivityList = student_MyClubActivitySQLMapper.selectAll();
		
		for (Club_ActVO club_ActVO : myClubActivityList) {
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("club_ActVO", club_ActVO);
			
			
			
			dataList.add(map);
		}
		
		return dataList;
	}
	
	
	public HashMap<String, Object> getMyClubActivityData(int actNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Club_ActVO club_ActVO = student_MyClubActivitySQLMapper.selectMyClubActivityByNo(actNo);
		String stud_id = club_ActVO.getStud_id();
		
		map.put("club_ActVO", club_ActVO);
		
		
		return map;
	}
	
	
	
	public void increaseReadCount(int actNo) {
		student_MyClubActivitySQLMapper.increaseReadCount(actNo);
	}
	
	public void deleteMyClubActivityByNo(int actNo) {
		student_MyClubActivitySQLMapper.deleteMyClubActivityByNo(actNo);
	}
	
	public void updateMyClubActivityTitleAndContent(Club_ActVO club_ActVO) {
		student_MyClubActivitySQLMapper.updateMyClubActivityTitleAndContent(club_ActVO);
	}
	
	
	
	
	
	
}
