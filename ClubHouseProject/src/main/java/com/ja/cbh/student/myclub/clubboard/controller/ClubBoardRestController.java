package com.ja.cbh.student.myclub.clubboard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.student.myclub.clubboard.service.ClubBoardServiceImpl;
import com.ja.cbh.vo.Club_BoardCommentVO;
import com.ja.cbh.vo.Club_StudVO;
import com.ja.cbh.vo.StudVO;

@RequestMapping("student/myclub/clubboard/restapi/*")
@RestController
public class ClubBoardRestController {

	@Autowired
	private ClubBoardServiceImpl clubBoardService;
	
	// 클럽 회원 정보 가져오기
	@RequestMapping("getClubStudByClubStudNo")
	public HashMap<String, Object> getClubStudByClubStudNo(String club_stud_no) {
		int clubStudNo = Integer.parseInt(club_stud_no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Club_StudVO clubStudVO = clubBoardService.getClubStudByClubStudNo(clubStudNo);
		
		map.put("result", "success");
		map.put("data", clubStudVO);
		
		return map;
	}
	
	@RequestMapping("inputClubBoardComment")
	public HashMap<String, Object> inputClubBoardComment(Club_BoardCommentVO clubBoardCommentVO) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		clubBoardService.inputClubBoardComment(clubBoardCommentVO);
		
		
		map.put("result", "success");
		
		return map;
	}
	
	//댓글 가져오기
	@RequestMapping("getClubBoardComment")
	public ArrayList<HashMap<String, Object>> getClubBoardComment(String club_board_no){
		int clubBoardNo= Integer.parseInt(club_board_no);
		ArrayList<HashMap<String, Object>> mapList = clubBoardService.getClubBoardCommentList_ByClubBoardNoAndClubNo(clubBoardNo);
	
		
		
		return mapList;
	}
	
	@RequestMapping("getSessionOfClubStudNoByStudId")
	public HashMap<String, Object> getClubStudByStudId(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		StudVO studVO = (StudVO)session.getAttribute("sessionUserInfo");
		int clubStudNo = clubBoardService.getClubStudNoByStudId(studVO.getStud_id());
		
		map.put("success", "result");
		map.put("data", clubStudNo);
		
		
		return map;
	}
	
	@RequestMapping("deleteClubBoardComment_By3No")
	public String deleteClubBoardComment_By3No(@Param(value="club_board_no") String club_board_no,@Param(value="club_board_comment_no") String club_board_comment_no) {
		System.out.println("delete 레스트 컨트롤러에 들어오긴 함.");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Club_BoardCommentVO clubBoardCommentVO = new Club_BoardCommentVO();
		
		clubBoardCommentVO.setClub_board_comment_no(Integer.parseInt(club_board_comment_no));
		clubBoardCommentVO.setClub_board_no(Integer.parseInt(club_board_no));
		clubBoardCommentVO.setClub_no(1);
		
		clubBoardService.deleteCommentBy3No(clubBoardCommentVO);
		
		return "../student_clubBoardContentPage?club_board_no="+clubBoardCommentVO.getClub_board_no()+"&club_no="+clubBoardCommentVO.getClub_no();
	}
	
	@RequestMapping("updateClubBoardCommentBy3No")
	public HashMap<String, Object> updateClubBoardCommentBy3No() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		return map;
	}
	
	@RequestMapping("getClubNo")
	public HashMap<String, Object> getClubNo(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		return map;
		
	}
}
 