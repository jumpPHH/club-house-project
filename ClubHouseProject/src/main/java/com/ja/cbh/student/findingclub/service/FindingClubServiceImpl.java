package com.ja.cbh.student.findingclub.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.findingclub.mapper.FindingClubSQLMapper;
import com.ja.cbh.vo.ClubStudVO;
import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_Dept_CategoryVO;
import com.ja.cbh.vo.Club_StudVO;
import com.ja.cbh.vo.StudVO;

@Service
public class FindingClubServiceImpl {


	@Autowired
	private FindingClubSQLMapper findingClubSQLMapper;
	
	// 어떤 클럽카테고리에 해당하는 클럽들 갖고오기. 
	public ArrayList<ClubVO> getAllClubsOfCategory(@Param("clubCategoryNo")int clubCategoryNo, @Param("searchWord")String searchWord){
		
		ArrayList<ClubVO> clubList = findingClubSQLMapper.selectAllClubsOfCategory(clubCategoryNo, searchWord);
		return clubList;
	}
	
	// 특정 클럽 카테고리의 정보 갖고오기.
	public Club_Dept_CategoryVO getClubCategoryByNo(int clubCategoryNo) {
		
		Club_Dept_CategoryVO categoryInfo = findingClubSQLMapper.selectClubCategoryByNo(clubCategoryNo);
		return categoryInfo;
	}
	
	// 특정 클럽no에 해당하는 클럽 정보 갖고오기
	public ClubVO getClubByNo(int clubNo) {
		ClubVO clubInfoByNo = findingClubSQLMapper.selectClubByNo(clubNo);
		
		return clubInfoByNo;
	}
	
	// 특정 클럽에 가입신청
	public void inputClubStud(Club_StudVO club_studVO) {
		findingClubSQLMapper.insertClubStud(club_studVO);
		
	}
	
	// 특정 아이디에 해당하는 사람 정보 갖고오기
	public StudVO getStudByStudId(String studId) {
		StudVO StudVO = findingClubSQLMapper.selectStudByStudId(studId);
		
		return StudVO;
	}
	
	public Club_StudVO getClubStudByStudId(String studId) {
		Club_StudVO club_StudVO = findingClubSQLMapper.selectClubStudByStudId(studId);
		
		return club_StudVO ;
	}
	
}
