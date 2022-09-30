package com.ja.cbh.student.establishingclub.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.establishingclub.mapper.EstablishingClubSQLMapper;
import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_ApplVO;

@Service
public class EstablishingClubServiceImpl {

	@Autowired
	private EstablishingClubSQLMapper establishingClubSQLMapper;
	
	public void inputClubAppl(Club_ApplVO clubApplVo) {
		establishingClubSQLMapper.insertClubAppl(clubApplVo);
		
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
	public void inputClub(ClubVO club_vo) {
		establishingClubSQLMapper.insertClub(club_vo);
	}
}
