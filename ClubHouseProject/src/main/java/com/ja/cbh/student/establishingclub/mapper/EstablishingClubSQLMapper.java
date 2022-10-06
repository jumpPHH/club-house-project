package com.ja.cbh.student.establishingclub.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_ApplVO;
import com.ja.cbh.vo.Club_StudVO;

public interface EstablishingClubSQLMapper {
	

	public void insertClubAppl(@Param(value="clubApplVO") Club_ApplVO clubApplVo);


	//stud_id에 해당하는 사람의 동아리 신청 내역 가져오기.
	public ArrayList<Club_ApplVO> selectAllEstablishingRequestResultByStudId(String stud_id);
	//stud_id에 해당하고 개설 승인된 클럽 개설 신청 데이터 가져오기
	public Club_ApplVO selectApprovedClubApplByStudId(String stud_id);
	//클럽 정보 넣기
	public void insertClub(@Param(value="clubVO")ClubVO clubVO);
	
	// 동아리 회원 정보 갖고오기  - 동아리에 가입되어있는지 안되어있는지 확인용 
	public Club_StudVO selectClubStudByStudId(String studId);
	
	//개설 결과 가져오기
	public ArrayList<Club_ApplVO> selectAllEstablishingRequestResult();
	// 특정 아이디가 동아리 개설 신청한게 있는지 확인하는용
	public Club_ApplVO selectRequestByStudId(String studId);
	public Club_ApplVO selectRequestByNo(int applNo);
	// 동아리 승인될 시 더이상 동아리 상세정보 입력 버튼 이용못하게 만들기용
	public void updateClubApplBy(int applNo);
	
	
}
