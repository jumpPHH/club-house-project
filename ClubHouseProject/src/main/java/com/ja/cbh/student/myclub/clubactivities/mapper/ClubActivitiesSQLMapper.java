package com.ja.cbh.student.myclub.clubactivities.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.cbh.vo.Club_BoardCommentVO;
import com.ja.cbh.vo.Club_ActVO;

public interface ClubActivitiesSQLMapper {
	// 특정 클럽의 활동내역 전체 리스트 가져오기
	public ArrayList<Club_ActVO> selectClubActivitiesListByClubNo(@Param(value = "searchWord") String searchWord);
	// ajax에서 이전 글 다음 글 내용 쓰기 위한 메소드
	public Club_ActVO[] selectClubActivitiesListForContentPageByClubActNo();
	// 특정 클럽의 특정 글의 내용 가져오기 
	public Club_ActVO selectClubActivityByClubActNoAndClubNo(@Param(value = "clubActNo") int clubActNo);
	// 총 글 개수가 몇개인지 세기.. 페이징 위함
	public int selectClubActivitiesCountByClubNoAndSearchWord(@Param(value = "searchWord") String searchWord);
	// 작성하기
	public void insertClubActivityByClubActVO(@Param(value="clubActVO") Club_ActVO clubActVO);
	
	// 조회수 늘리기
	public void updateClubActivityReadcountByClubActNo(int clubActNo);
	// 수정하기
	public void updateClubActivityByClubNoAndClubActNo(@Param(value="clubActVO") Club_ActVO clubActVO);
	// 지우기
	public void deleteClubActivityByClubNoAndClubActNo(@Param(value="clubActVO") Club_ActVO clubActVO);

}
