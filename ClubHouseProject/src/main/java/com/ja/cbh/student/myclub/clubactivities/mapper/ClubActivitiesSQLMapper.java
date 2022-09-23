package com.ja.cbh.student.myclub.clubactivities.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ja.cbh.vo.Club_ActVO;

public interface ClubActivitiesSQLMapper {

	public ArrayList<Club_ActVO> selectClubActivitiesList(int clubNo);
	public Club_ActVO [] selectClubActivitiesListForContentPage(int clubActNo);
	public Club_ActVO selectClubActivityByClubActNoAndClubNo(@Param(value="clubActNo") int clubActNo, @Param(value="clubNo") int clubNo);
	
	public void updateClubActivityReadcountByClubActNo(int clubActNo); 
	
}
 