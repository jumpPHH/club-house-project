package com.ja.cbh.student.myclub.applicationexpenses.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ja.cbh.vo.Club_ExpnsApplyVO;

public interface Student_ApplicationExpensesSQLMapper {
	
	public int selectExpnsApplySelectCount(	
			@Param("club_no")int club_no ,
			@Param("searchType")String searchType , 
			@Param("searchWord")String searchWord);
	
	public ArrayList<Club_ExpnsApplyVO> selectClubExpnsApplyList(
			@Param("club_no")int club_no ,
			@Param("searchType")String searchType , 
			@Param("searchWord")String searchWord ,
			@Param("pageNum")int pageNum);
	
	public void insertClubExpnsApplyRegistration(Club_ExpnsApplyVO clubExpnsApplyVO);
}
