package com.ja.cbh.student.clubboard.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ja.cbh.vo.ClubBoardVO;
import com.ja.cbh.vo.Club_StudVO;
import com.ja.cbh.vo.StudVO;

public interface ClubBoardSQLMapper {
	// 특정 클럽의 자유게시판 전체 리스트 가져오기
		public ArrayList<ClubBoardVO> selectClubBoardListByClubNo(@Param(value = "clubNo") int clubNo,
				@Param(value = "searchWord") String searchWord);
		// 특정 클럽의 특정 게시글의 내용 가져오기 
		public ClubBoardVO selectClubBoardByClubBoardNoAndClubNo(@Param(value = "clubBoardNo") int clubBoardNo,
				@Param(value = "clubNo") int clubNo);
		// ajax에서 이전 글 다음 글 내용 쓰기 위한 메소드
		public ClubBoardVO[] selectClubBoardListForContentPageByClubNo(int clubNo);
		// 총 글 개수가 몇개인지 세기.. 페이징 위함
		public int selectClubBoardCountByClubNoAndSearchWord(@Param(value = "clubNo") int clubNo,
				@Param(value = "searchWord") String searchWord);
		// 조회수 늘리기
		public void updateClubBoardReadcountByClubBoardNo(int clubBoardNo);
		// 작성하기
		public void insertClubBoardByClubBoardVO(@Param(value="clubBoardVO") ClubBoardVO clubBoardVO);
		// 수정하기
		public void updateClubBoardByClubNoAndClubBoardNo(@Param(value="clubBoardVO") ClubBoardVO clubBoardVO);
		// 지우기
		public void deleteClubBoardByClubNoAndClubBoardNo(@Param(value="clubBoardVO") ClubBoardVO clubBoardVO);
		
		
		
		// ClubStudNo 따오기용
		public int selectClubStudNoByStudId(String studId);
		// 동아리 회원 정보 가져오기
		public Club_StudVO selectClubStudByClubStudNo(int clubStudNo);
		// 학생정보 가져오기
		public StudVO selectStudByStudId(String studId); 
		
}
