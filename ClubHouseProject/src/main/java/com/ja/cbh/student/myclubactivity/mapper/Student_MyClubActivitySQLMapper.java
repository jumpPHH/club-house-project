package com.ja.cbh.student.myclubactivity.mapper;

import java.util.ArrayList;

import com.ja.cbh.vo.Club_ActVO;



public interface Student_MyClubActivitySQLMapper {

	public void insertMyClubActivity(Club_ActVO club_ActVO);
	
	public 	ArrayList<Club_ActVO> selectAll();
	
	public Club_ActVO selectMyClubActivityByNo(int actNo);
	
	public void increaseReadCount(int actNo);
	
	public void deleteMyClubActivityByNo(int actNo);
	
	public void updateMyClubActivityTitleAndContent(Club_ActVO club_ActVO);
	
	
}
