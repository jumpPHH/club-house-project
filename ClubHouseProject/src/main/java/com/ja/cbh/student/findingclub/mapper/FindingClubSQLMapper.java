package com.ja.cbh.student.findingclub.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_Dept_CategoryVO;
import com.ja.cbh.vo.Club_StudVO;
import com.ja.cbh.vo.StudVO;

public interface FindingClubSQLMapper {
	// 모든 클럽카테고리 가져오기
	public ArrayList<Club_Dept_CategoryVO> selectAllClubCategory();
	// 클럽카테고리no에 해당하는 카테고리의 정보 갖고오기.
	public Club_Dept_CategoryVO selectClubCategoryByNo(int clubCategoryNo);
	// 특정 카테고리의 클럽들 가져오기
	public ArrayList<ClubVO> selectAllClubsOfCategory(@Param("clubCategoryNo")int clubCategoryNo, @Param("searchWord")String searchWord);
	// 특정 클럽no에 해당하는 클럽 정보 갖고오기
	public ClubVO selectClubByNo(int clubNo);
	// 일반회원이 특정 클럽 가입신청시 insert
	public void insertClubStud(Club_StudVO clubStudVO);
	// 아이디에 해당하는 사람 정보 갖고오기
	public StudVO selectStudByStudId(String studId);
	public Club_StudVO selectClubStudByStudId(String studId);
}
