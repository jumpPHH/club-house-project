package com.ja.cbh.student.findingclub.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.findingclub.mapper.FindingClubSQLMapper;
import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_Dept_CategoryVO;

@Service
public class FindingClubServiceImpl {


	@Autowired
	private FindingClubSQLMapper findingClubSQLMapper;
	
	// 어떤 클럽카테고리에 해당하는 클럽들 갖고오기. 
	public ArrayList<ClubVO> getAllClubsOfCertainCategory(int clubCategoryNo){
		
		ArrayList<ClubVO> clubList = findingClubSQLMapper.selectAllClubOfCategory(clubCategoryNo);
		return clubList;
	}
	
	// 특정 클럽 카테고리의 정보 갖고오기.
	public Club_Dept_CategoryVO getClubCategoryByNo(int clubCategoryNo) {
		
		Club_Dept_CategoryVO categoryInfo = findingClubSQLMapper.selectClubCategoryByNo(clubCategoryNo);
		return categoryInfo;
	}
}
