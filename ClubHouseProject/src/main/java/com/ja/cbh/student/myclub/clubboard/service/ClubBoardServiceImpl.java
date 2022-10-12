package com.ja.cbh.student.myclub.clubboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.myclub.clubboard.mapper.ClubBoardSQLMapper;
import com.ja.cbh.vo.Club_BoardCommentVO;
import com.ja.cbh.vo.Club_BoardImageVO;
import com.ja.cbh.vo.Club_BoardVO;
import com.ja.cbh.vo.Club_StudVO;
import com.ja.cbh.vo.StudVO;

@Service
public class ClubBoardServiceImpl {
	@Autowired
	private ClubBoardSQLMapper clubBoardSQLMapper;
	
	// 특정 동아리의 모든 게시글 가져오기 
	public ArrayList<HashMap<String, Object>> getClubBoardList(String searchWord){
		ArrayList<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
		
		
		ArrayList<Club_BoardVO> clubBoardList = clubBoardSQLMapper.selectClubBoardListByClubNo(searchWord);
		
		for(Club_BoardVO boardData : clubBoardList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			int clubStudNo = boardData.getClub_stud_no();
			System.out.println(clubStudNo);
			Club_StudVO clubStudData = clubBoardSQLMapper.selectClubStudByClubStudNo(clubStudNo);
		
			StudVO studData = clubBoardSQLMapper.selectStudByStudId(clubStudData.getStud_id());
			String writerName = studData.getStud_name();
			
			map.put("writerName", writerName);
			map.put("boardData", boardData);
			
			mapList.add(map);
		}
		
		
		return mapList;
	}
	
	// 특정 글의 내용 페이지
	public HashMap<String, Object> getClubBoardByClubBoardNoAndClubNo(@Param(value="clubBoardNo") int clubBoardNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Club_BoardVO clubBoardData = clubBoardSQLMapper.selectClubBoardByClubBoardNoAndClubNo(clubBoardNo);
		ArrayList<Club_BoardImageVO> clubBoardImageList = clubBoardSQLMapper.selectClubBoardImageByClubBoardNoAndClubNo(clubBoardNo);
		
		Club_BoardVO[] forPreviousAndNextPost = clubBoardSQLMapper.selectClubBoardListForContentPageByClubNo();
		// 이전 글 다음 글 제목과 club_Board_no를 따기 위한 코드
		
		Club_StudVO clubStudVO = clubBoardSQLMapper.selectClubStudByClubStudNo(clubBoardNo);
		 StudVO studVO = clubBoardSQLMapper.selectStudByStudId(clubStudVO.getStud_id());
		 map.put("studVO", studVO);
		
		for(int i = 0 ; i < forPreviousAndNextPost.length ; i++) {
			if(forPreviousAndNextPost[i].getClub_board_no() == clubBoardNo) {
				
				//배열 길이가 1이면 이전 글 다음글은 없으므로 break
				if(forPreviousAndNextPost.length == 1 ) {
					break;
				}
				//다음 글만 존재하는 경우 다음 글의 데이터만 해시맵에 넣어주자.
				if(i == 0 && forPreviousAndNextPost.length > 1) {
					String NextPostTitle = forPreviousAndNextPost[i+1].getClub_board_title();
					int NextPostBoardNo = forPreviousAndNextPost[i+1].getClub_board_no();
					map.put("NextPostTitle", NextPostTitle);
					map.put("NextPostBoardNo", NextPostBoardNo);
					break;
				}
				
				//이전 글만 존재하는 경우 이전 글의 데이터만 해시맵에 넣어주자
				if(i > 0 && forPreviousAndNextPost.length - 1 == i) {
					String PreviousPostTitle = forPreviousAndNextPost[i-1].getClub_board_title();
					int PreviousPostBoardNo = forPreviousAndNextPost[i-1].getClub_board_no();
					map.put("PreviousPostTitle", PreviousPostTitle);
					map.put("PreviousPostBoardNo", PreviousPostBoardNo);
					break;
				}
				
				//이전 글 , 다음 글 둘다 존재할 경우 둘의 데이터 해시맵에 다 넣어주기.
				if(0 < i && i < forPreviousAndNextPost.length - 1) {
					String PreviousPostTitle = forPreviousAndNextPost[i-1].getClub_board_title();
					int PreviousPostBoardNo = forPreviousAndNextPost[i-1].getClub_board_no();
					map.put("PreviousPostTitle", PreviousPostTitle);
					map.put("PreviousPostBoardNo", PreviousPostBoardNo);
					
					String NextPostTitle = forPreviousAndNextPost[i+1].getClub_board_title();
					int NextPostBoardNo = forPreviousAndNextPost[i+1].getClub_board_no();
					map.put("NextPostTitle", NextPostTitle);
					map.put("NextPostBoardNo", NextPostBoardNo);
					break;
				}
			}
				
		}
		
		//HTML escape 특수문자 처리.. <br> &npsp;
		String content = clubBoardData.getClub_board_content();
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll(" ", "&nbsp;");
		content = content.replaceAll("\n", "<br>");
		clubBoardData.setClub_board_content(content);
		
		map.put("clubBoardData", clubBoardData);
		map.put("clubBoardImageList", clubBoardImageList);
		clubBoardSQLMapper.updateClubBoardReadcountByClubBoardNo(clubBoardNo);			
		
		
		
		return map; 
	}
	
	// 단순하게 특정 클럽게시판 데이터만 가져오기.
	public Club_BoardVO getClubBoardByClubBoardNoAndClubNoForJustDataUse(int clubBoardNo) {
		
		Club_BoardVO clubBoardData = clubBoardSQLMapper.selectClubBoardByClubBoardNoAndClubNo(clubBoardNo); 
	
		return clubBoardData;
	}
	
	// 어떤 클럽의 클럽 활동내역의 개수가 몇개인지 가져오기
	public int getClubBoardCountByClubNoAndSearchWord(String searchWord) {
		int clubBoardCount = clubBoardSQLMapper.selectClubBoardCountByClubNoAndSearchWord(searchWord);
		
		return clubBoardCount; 
	}
	
	// 동아리 자유게시판글 입력
	public void inputClubBoardByClubBoardVO(Club_BoardVO clubBoardVO) {
		clubBoardSQLMapper.insertClubBoardByClubBoardVO(clubBoardVO);
	}
	
	// 자유게시판글 수정하기
	public void modifyClubBoard(Club_BoardVO clubBoardVO) {
		clubBoardSQLMapper.updateClubBoardByClubNoAndClubBoardNo(clubBoardVO);
	}
	
	
	//자유게시판글 삭제하기
	public void deleteClubBoardByClubNoAndClubBoardNo(Club_BoardVO clubBoardVO) {
		
		clubBoardSQLMapper.deleteClubBoardByClubNoAndClubBoardNo(clubBoardVO);
		
	}
	// 클럽 게시판 이미지 삭제하기
	public void deleteClubBoardImageByBoardNo(int clubBoardNo) {
		clubBoardSQLMapper.deleteClubBoardimage(clubBoardNo);
	}
	
	//clubStudNo 따오기
	public int getClubStudNoByStudId(String studId) {
		int clubStudNo = clubBoardSQLMapper.selectClubStudNoByStudId(studId);
		
		return clubStudNo;
	}
	
	// clubStud데이터 가져오기.
	public Club_StudVO getClubStudByClubStudNo(int clubStudNo) {
		Club_StudVO clubStudVO = clubBoardSQLMapper.selectClubStudByClubStudNo(clubStudNo);
		
		return clubStudVO;
	}
	//clubBoardNo 생성 코드
	public int getClubBoardNo() {
		int clubBoardNo = clubBoardSQLMapper.createClubBoardNo();
		return clubBoardNo;
	}
	
	// 이미지 데이터 입력
	public void inputClubBoardImage(Club_BoardImageVO clubBoardImageVO) {
		clubBoardSQLMapper.insertClubBoardImage(clubBoardImageVO);
	}
	
	// 댓글 입력
	public void inputClubBoardComment(Club_BoardCommentVO clubBoardCommentVO) {
		clubBoardSQLMapper.insertClubBoardComment(clubBoardCommentVO);
	}
	
	// 댓글 가져오기
	public ArrayList<HashMap<String, Object>> getClubBoardCommentList_ByClubBoardNoAndClubNo(@Param(value="clubBoardNo")int clubBoardNo){
		ArrayList<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<Club_BoardCommentVO> commentList = clubBoardSQLMapper.selectClubBoardCommentList_ByClubNoAndClubBoardNo(clubBoardNo);
		
		for(Club_BoardCommentVO comment : commentList ) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			Club_StudVO clubStudVO = clubBoardSQLMapper.selectClubStudByClubStudNo(comment.getClub_stud_no());
			StudVO studVO = clubBoardSQLMapper.selectStudByStudId(clubStudVO.getStud_id());
			
			
			map.put("commentWriterInfo", studVO);
			map.put("comment", comment);
			
			mapList.add(map);
			
		}
		
		return mapList;
	}
	
	//댓글 지우기
	public void deleteCommentBy3No(Club_BoardCommentVO clubBoardCommentVO) {
		clubBoardSQLMapper.deleteClubBoardCommentBy3No(clubBoardCommentVO);
	}
	
	//댓글 수정하기
	public void updateCommentBy3No(Club_BoardCommentVO clubBoardCommentVO) {
		clubBoardSQLMapper.updateClubBoardCommentBy3No(clubBoardCommentVO);
	}
}
