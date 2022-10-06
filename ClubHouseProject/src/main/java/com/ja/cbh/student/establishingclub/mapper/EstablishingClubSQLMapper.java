package com.ja.cbh.student.establishingclub.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_ApplVO;

public interface EstablishingClubSQLMapper {
	
	public void insertClubAppl(@Param(value="clubApplVo") Club_ApplVO clubApplVo);
	//stud_id에 해당하는 사람의 동아리 신청 내역 가져오기.
	public ArrayList<Club_ApplVO> selectAllEstablishingRequestResultByStudId(String stud_id);
	//stud_id에 해당하고 개설 승인된 클럽 개설 신청 데이터 가져오기
	public Club_ApplVO selectApprovedClubApplByStudId(String stud_id);
	//클럽 정보 넣기
	public void insertClub(@Param(value="club_vo")ClubVO clubVO);
	
	
	
	//
	public ArrayList<Club_ApplVO> selectAllEstablishingRequestResult(
			@Param("searchWord") String searchWord, 
			@Param("pageNum") int pageNum);
	
	public Club_ApplVO selectRequestByNo(int club_appl_no);
	
	public int selectCount(@Param("club_appl_no")int club_appl_no,
			@Param("searchWord") String searchWord);
	
	
}
