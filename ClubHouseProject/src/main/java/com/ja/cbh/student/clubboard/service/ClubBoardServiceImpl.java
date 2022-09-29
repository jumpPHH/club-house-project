package com.ja.cbh.student.clubboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.clubboard.mapper.ClubBoardSQLMapper;
import com.ja.cbh.vo.ClubBoardVO;
import com.ja.cbh.vo.Club_StudVO;
import com.ja.cbh.vo.StudVO;

@Service
public class ClubBoardServiceImpl {
	@Autowired
	private ClubBoardSQLMapper clubBoardSQLMapper;
	
	// 특정 동아리의 모든 게시글 가져오기 
	public ArrayList<HashMap<String, Object>> getClubBoardList(int clubNo,String searchWord){
		ArrayList<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
		
		
		ArrayList<ClubBoardVO> clubBoardList = clubBoardSQLMapper.selectClubBoardListByClubNo(clubNo, searchWord);
		
		for(ClubBoardVO boardData : clubBoardList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			int clubStudNo = boardData.getClub_stud_no();
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
	public HashMap<String, Object> getClubBoardByClubBoardNoAndClubNo(@Param(value="clubBoardNo") int clubBoardNo, @Param(value="clubNo") int clubNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ClubBoardVO clubBoardData = clubBoardSQLMapper.selectClubBoardByClubBoardNoAndClubNo(clubBoardNo,clubNo);
		
		
		ClubBoardVO[] forPreviousAndNextPost = clubBoardSQLMapper.selectClubBoardListForContentPageByClubNo(clubNo);
		// 이전 글 다음 글 제목과 club_Board_no를 따기 위한 코드
		
		for(ClubBoardVO data : forPreviousAndNextPost) {
			System.out.println(data.getClub_board_title());
		}
		
		for(int i = 0 ; i < forPreviousAndNextPost.length ; i++) {
			if(forPreviousAndNextPost[i].getClub_board_no() == clubBoardNo) {
				
				//배열 길이가 1이면 이전 글 다음글은 없으므로 break
				if(forPreviousAndNextPost.length == 1 ) {
					break;
				}
				//다음 글만 존재하는 경우 다음 글의 데이터만 해시맵에 넣어주자.
				if(i == 0 && forPreviousAndNextPost.length > 1) {
					System.out.println("1번");
					String NextPostTitle = forPreviousAndNextPost[i+1].getClub_board_title();
					int NextPostBoardNo = forPreviousAndNextPost[i+1].getClub_board_no();
					map.put("NextPostTitle", NextPostTitle);
					map.put("NextPostBoardNo", NextPostBoardNo);
					break;
				}
				
				//이전 글만 존재하는 경우 이전 글의 데이터만 해시맵에 넣어주자
				if(i > 0 && forPreviousAndNextPost.length - 1 == i) {
					System.out.println("2번");
					String PreviousPostTitle = forPreviousAndNextPost[i-1].getClub_board_title();
					int PreviousPostBoardNo = forPreviousAndNextPost[i-1].getClub_board_no();
					map.put("PreviousPostTitle", PreviousPostTitle);
					map.put("PreviousPostBoardNo", PreviousPostBoardNo);
					break;
				}
				
				//이전 글 , 다음 글 둘다 존재할 경우 둘의 데이터 해시맵에 다 넣어주기.
				if(0 < i && i < forPreviousAndNextPost.length - 1) {
					System.out.println("3번");
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
		clubBoardSQLMapper.updateClubBoardReadcountByClubBoardNo(clubBoardNo);			
		
		
		
		return map; 
	}
	
	// 단순하게 특정 클럽게시판 데이터만 가져오기.
	public ClubBoardVO getClubBoardByClubBoardNoAndClubNoForJustDataUse(int clubBoardNo, int clubNo) {
		
		ClubBoardVO clubBoardData = clubBoardSQLMapper.selectClubBoardByClubBoardNoAndClubNo(clubBoardNo,clubNo); 
	
		return clubBoardData;
	}
	
	// 어떤 클럽의 클럽 활동내역의 개수가 몇개인지 가져오기
	public int getClubBoardCountByClubNoAndSearchWord(int clubNo, String searchWord) {
		int clubBoardCount = clubBoardSQLMapper.selectClubBoardCountByClubNoAndSearchWord(clubNo, searchWord);
		
		return clubBoardCount; 
	}
	
	// 클럽 활동내역 입력
	public void inputClubBoardByClubBoardVO(ClubBoardVO clubBoardVO) {
		clubBoardSQLMapper.insertClubBoardByClubBoardVO(clubBoardVO);
	}
	
	// 클럽 활동내역 수정하기
	public void modifyClubBoard(ClubBoardVO clubBoardVO) {
		clubBoardSQLMapper.updateClubBoardByClubNoAndClubBoardNo(clubBoardVO);
	}
	
	
	//클럽 활동내역 삭제하기
	public void deleteClubBoardByClubNoAndClubBoardNo(ClubBoardVO clubBoardVO) {
		
		clubBoardSQLMapper.deleteClubBoardByClubNoAndClubBoardNo(clubBoardVO);
	}
	
	//clubStudNo 따오기
	public int getClubStudNoByStudId(String studId) {
		int clubStudNo = clubBoardSQLMapper.selectClubStudNoByStudId(studId);
		
		return clubStudNo;
	}
	
	// 
	public Club_StudVO getClubStudByClubStudNo(int clubStudNo) {
		Club_StudVO clubStudVO = clubBoardSQLMapper.selectClubStudByClubStudNo(clubStudNo);
		
		return clubStudVO;
	}
}
