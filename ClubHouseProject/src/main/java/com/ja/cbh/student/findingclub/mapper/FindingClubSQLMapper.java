package com.ja.cbh.student.findingclub.mapper;

import java.util.ArrayList;

import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_Dept_CategoryVO;

public interface FindingClubSQLMapper {
	
	public ArrayList<Club_Dept_CategoryVO> selectAllClubCategory();
	public Club_Dept_CategoryVO selectClubCategoryByNo(int clubCategoryNo);
	public ArrayList<ClubVO> selectAllClubOfCategory(int clubCategoryNo);
}
