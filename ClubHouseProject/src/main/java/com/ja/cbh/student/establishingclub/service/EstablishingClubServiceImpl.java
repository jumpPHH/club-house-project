package com.ja.cbh.student.establishingclub.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.establishingclub.mapper.EstablishingClubSQLMapper;
import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_ApplVO;
import com.ja.cbh.vo.Club_StudVO;
import com.ja.cbh.vo.StudVO;

@Service
public class EstablishingClubServiceImpl {

	@Autowired
	private EstablishingClubSQLMapper establishingClubSQLMapper;
	
	public void inputClubAppl(@Param(value="clubApplVo") Club_ApplVO clubApplVO) {
		establishingClubSQLMapper.insertClubAppl(clubApplVO);
		
	}
	//stud_id에 해당하는 사람의 동아리 신청 내역 가져오기.
	public ArrayList<Club_ApplVO> getAllClubApplByStudId(String stud_id) {
		ArrayList<Club_ApplVO> clubApplData = establishingClubSQLMapper.selectAllEstablishingRequestResultByStudId(stud_id);
		
		return clubApplData;
	}
	
	//승인 난 club_appl 데이터 갖고오기
	public Club_ApplVO getApprovedClubApplByStudId(String stud_id) {
		Club_ApplVO clubApplData = establishingClubSQLMapper.selectApprovedClubApplByStudId(stud_id);
		
		return clubApplData;
	}
	
	//클럽 정보 넣기
	public void inputClub(@Param(value="clubVO") ClubVO clubVO, @Param(value="applNo") int applNo) {
		establishingClubSQLMapper.insertClub(clubVO);
		establishingClubSQLMapper.updateClubApplStateByApplNo(applNo);
	}
	
	// 특정 아이디가 신청한 클럽이 있는지 확인용
	public Club_ApplVO getClubApplByStudId(String studId) {
		Club_ApplVO clubApplVO = establishingClubSQLMapper.selectRequestByStudId(studId);
		
		return clubApplVO;
	}
	
	// 동아리 회원정보 갖고오기 - 동아리 가입되어있는지 안되어있는지 확인용
	public Club_StudVO getClubStudByStudId(String studId) {
		Club_StudVO clubStudData = establishingClubSQLMapper.selectClubStudByStudId(studId);
		
		return clubStudData;
	}
	
	//동아리 회장도 동아리 회원으로 등록하기
	public void inputClubStudByStud(Club_StudVO clubStudVO) {
		establishingClubSQLMapper.insertClubStudByStud(clubStudVO);
		
	}
	
	//클럽 pk생성
	public int createClubPk() {
		int clubNo  = establishingClubSQLMapper.createClubPk();
		return clubNo;
	}
	

	
}
