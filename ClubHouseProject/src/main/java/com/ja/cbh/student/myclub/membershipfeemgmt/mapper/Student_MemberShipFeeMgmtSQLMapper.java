package com.ja.cbh.student.myclub.membershipfeemgmt.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ja.cbh.vo.Club_BossAndAccountingMemberVO;
import com.ja.cbh.vo.Club_Fee;

public interface Student_MemberShipFeeMgmtSQLMapper {

	
	public Club_BossAndAccountingMemberVO selectClubBossAndAccountingMemberIs(String stud_id);
	
	public ArrayList<Club_Fee> selectCLubFeeAllData(
			@Param("club_no")int club_no ,
			@Param("searchType")String searchType , 
			@Param("searchWord")String searchWord ,
			@Param("pageNum")int pageNum);
	
	public int selectMemberShipFeeSelectCount(
			@Param("club_no")int club_no ,
			@Param("searchType")String searchType , 
			@Param("searchWord")String searchWord);
}
