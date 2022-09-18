package com.ja.cbh.student.myclub.membermgmt.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ja.cbh.vo.Club_ApplicantMemberInfoVO;
import com.ja.cbh.vo.Club_MemberInfoDyVO;
import com.ja.cbh.vo.Club_StudVO;

public interface Student_MemberMgmtSQLMapper {
	
	//대표의 정보가 있으면 1 , 아니면 0 카운트.. 로직에서 구분자로 사용
	public int selectBossMemberCount(String stud_id);
	
	//'대표'의 정보가 있는가? 없는가? -> (지금 접속한 유저가 대표인지 알기 위한)
	public Club_StudVO selectBossMemberIs(String stud_id);
	
	//검색 조건에 따라 활동중인 동아리원의 정보를 가져오는 동적 쿼리
	//넘어온..파라미터 (검색 타입 : searchType), (검색 입력값 : searchWord)에 따라서
	//결과가 다르게 리스트 값으로 넘어오는 동적 쿼리 작성.. (회원의 정보 리스트의 내용)
	public ArrayList<Club_MemberInfoDyVO> selectDyClubMemberInfo(
			@Param("club_no")int club_no ,
			@Param("searchType")String searchType , 
			@Param("searchWord")String searchWord ,
			@Param("pageNum")int pageNum);
	
	//회원 정보의 총 갯수를 구하는 쿼리..
	public int selectTotalActiveMemberdCount(int club_no);
	
	//넘어온..파라미터 (검색 타입 : searchType), (검색 입력값 : searchWord)에 따라서
	//결과가 다르게 리스트 값으로 넘어오는 동적 쿼리 작성.. (회원의 정보의 갯수..)
	public int selectActiveMemberSelectCount(
			@Param("club_no")int club_no ,
			@Param("searchType")String searchType , 
			@Param("searchWord")String searchWord);
	
	public ArrayList<Club_ApplicantMemberInfoVO> selectApplicantMemberInfo(
			@Param("club_no")int club_no ,
			@Param("pageNum")int pageNum);
	
	public int selectApplicantMemberCount(int club_no);
	
}
