package com.ja.cbh.student.myclub.clubboard.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PatchMapping;

import com.ja.cbh.vo.Club_BoardCommentVO;
import com.ja.cbh.vo.Club_BoardImageVO;
import com.ja.cbh.vo.Club_BoardVO;
import com.ja.cbh.vo.Club_StudVO;
import com.ja.cbh.vo.StudVO;

public interface ClubBoardSQLMapper {
	// 특정 클럽의 자유게시판 전체 리스트 가져오기
		public ArrayList<Club_BoardVO> selectClubBoardListByClubNo(@Param(value = "searchWord") String searchWord);
		// 특정 클럽의 특정 게시글의 내용 가져오기 
		public Club_BoardVO selectClubBoardByClubBoardNoAndClubNo(@Param(value = "clubBoardNo") int clubBoardNo);
		// ajax에서 이전 글 다음 글 내용 쓰기 위한 메소드
		public Club_BoardVO[] selectClubBoardListForContentPageByClubNo();
		// 총 글 개수가 몇개인지 세기.. 페이징 위함
		public int selectClubBoardCountByClubNoAndSearchWord(@Param(value = "searchWord") String searchWord);
		// 조회수 늘리기
		public void updateClubBoardReadcountByClubBoardNo(int clubBoardNo);
		// 작성하기
		public void insertClubBoardByClubBoardVO(@Param(value="clubBoardVO") Club_BoardVO clubBoardVO);
		// 수정하기
		public void updateClubBoardByClubNoAndClubBoardNo(@Param(value="clubBoardVO") Club_BoardVO clubBoardVO);
		// 지우기
		public void deleteClubBoardByClubNoAndClubBoardNo(@Param(value="clubBoardVO") Club_BoardVO clubBoardVO);
		
		// ClubStudNo 따오기용
		public int selectClubStudNoByStudId(String studId);
		// 동아리 회원 정보 가져오기
		public Club_StudVO selectClubStudByClubStudNo(int clubStudNo);
		// 학생정보 가져오기
		public StudVO selectStudByStudId(String studId); 
		// board_no 생성
		public int createClubBoardNo();
		// 게시판 이미지 데이터 넣어주기
		public void insertClubBoardImage(@Param(value="clubBoardImageVO") Club_BoardImageVO clubBoardImageVO);
		// 게시판 이미지 갖고오기
		public ArrayList<Club_BoardImageVO> selectClubBoardImageByClubBoardNoAndClubNo(@Param(value="clubBoardNo") int clubBoardNo);
		// 게시판 이미지 삭제
		public void deleteClubBoardimage(int clubBoardNo);
		
		// 댓글 작성
		public void insertClubBoardComment(@Param(value="clubBoardCommentVO") Club_BoardCommentVO clubBoardCommentVO);
		// 댓글 리스트 가져오기
		public ArrayList<Club_BoardCommentVO> selectClubBoardCommentList_ByClubNoAndClubBoardNo(@Param(value="clubBoardNo")int clubBoardNo); 
		// 댓글 삭제																						 
		public void deleteClubBoardCommentBy3No(@Param(value="clubBoardCommentVO") Club_BoardCommentVO clubBoardCommentVO);
		// 댓글 수정
		public void updateClubBoardCommentBy3No(@Param(value="clubBoardCommentVO") Club_BoardCommentVO clubBoardCommentVO);
		
}
