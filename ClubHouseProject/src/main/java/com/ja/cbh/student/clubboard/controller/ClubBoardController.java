package com.ja.cbh.student.clubboard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.cbh.student.clubboard.service.ClubBoardServiceImpl;
import com.ja.cbh.vo.ClubBoardVO;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("student/clubboard/*")
public class ClubBoardController {

	@Autowired
	private ClubBoardServiceImpl clubBoardService;

	// 동아리 활동내역 메인페이지. 동아리 활동 내역이 보이는 페이지임.
	// 나중에 추가해야할 기능. 해당 동아리가 아닌 사람이 파라미터만 수정해서 데이터를
	@RequestMapping("student_indexPage")
	public String student_indexPage(Model model, @RequestParam(value="club_no") String club_no,String searchWord,@RequestParam(value = "pageNum",defaultValue = "1") int pageNum) {
		int clubNo = Integer.parseInt(club_no);

		ArrayList<HashMap<String, Object>> clubBoardList = clubBoardService.getClubBoardList(clubNo,searchWord);
		
		int clubBoardCount = clubBoardService.getClubBoardCountByClubNoAndSearchWord(clubNo, searchWord);
		
		int totalPageCount = (int)Math.ceil(clubBoardCount/10.0);
		//1 2 3 4 5	, 6 7 8 9 10 ....16 17 18 19 20
		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPageNum", pageNum);
		model.addAttribute("totalPageCount", totalPageCount);
		
		//링크 유지...
		String additionalParam = "";
		if(searchWord != null) {
			additionalParam += "&searchWord=" + searchWord;
		}
		
		model.addAttribute("additionalParam", additionalParam);

		model.addAttribute("clubBoardList", clubBoardList);
		model.addAttribute("clubNo", clubNo);

		return "student/clubboard/student_indexPage";
	}

	// 특정 글 상세보기 페이지
	@RequestMapping("student_clubBoardContentPage")
	public String student_clubBoardContentPage(Model model, String club_board_no, String club_no,
													HttpSession session) {
		int clubBoardNo = Integer.parseInt(club_board_no);
		int clubNo = Integer.parseInt(club_no);

		StudVO sessionUserInfo = (StudVO) session.getAttribute("sessionUserInfo");

		HashMap<String, Object> map = clubBoardService.getClubBoardByClubBoardNoAndClubNo(clubBoardNo, clubNo);
		model.addAttribute("map", map);
		model.addAttribute("sessionUserInfo", sessionUserInfo);

		return "student/clubboard/student_clubBoardContentPage";
	}
	
	//작성 페이지
	@RequestMapping("student_writeClubBoardPage")
	public String student_writeClubBoardPage(Model model, String club_no, HttpSession session) {
		int clubNo = Integer.parseInt(club_no);
		
		StudVO studVO = (StudVO)session.getAttribute("sessionUserInfo");
		String writerName = studVO.getStud_name();
		
		model.addAttribute("clubNo", clubNo);
		model.addAttribute("writerName",writerName);
		
		return "student/clubboard/student_writeClubBoardPage";
	}
	
	@RequestMapping("student_writeClubBoardProcess")
	public String student_writeClubBoardProcess(ClubBoardVO clubBoardVO, HttpSession session) {
		
		StudVO studVO = (StudVO)session.getAttribute("sessionUserInfo");
		int clubStudNo = clubBoardService.getClubStudNoByStudId(studVO.getStud_id());
		clubBoardVO.setClub_stud_no(clubStudNo);
		
		clubBoardService.inputClubBoardByClubBoardVO(clubBoardVO);
		
		return "redirect:./student_indexPage?club_no="+ clubBoardVO.getClub_no();
	}

	//수정 페이지
	@RequestMapping("student_modifyClubBoardPage")
	public String student_modifyClubBoardPage(Model model, String club_board_no, String club_no ) {
		
		int clubNo = Integer.parseInt(club_no);
		int clubBoardNo = Integer.parseInt(club_board_no);
		model.addAttribute("clubNo", clubNo);
		model.addAttribute("clubBoardNo", clubBoardNo);
		
		return "student/clubboard/student_modifyClubBoardPage";
	}
	
	// 수정 프로세스
	@RequestMapping("student_modifyClubBoardProcess")
	public String student_modifyClubBoardProcess(ClubBoardVO NewClubBoardVO) {
		int clubBoardNo = NewClubBoardVO.getClub_no();
		int clubNo = NewClubBoardVO.getClub_board_no();
		
		ClubBoardVO originClubBoardVO = clubBoardService.getClubBoardByClubBoardNoAndClubNoForJustDataUse(clubNo, clubBoardNo);
		originClubBoardVO.setClub_board_title(NewClubBoardVO.getClub_board_title());
		originClubBoardVO.setClub_board_content(NewClubBoardVO.getClub_board_content());
		
		clubBoardService.modifyClubBoard(originClubBoardVO);
		
		return "redirect:./student_indexPage?club_no=" + clubBoardNo;
	}

	@RequestMapping("student_deleteClubBoardProcess")
	public String student_deleteClubBoardProcess(String ClubBoard_no, String club_no) {
		int clubBoardNo = Integer.parseInt(ClubBoard_no);
		int clubNo = Integer.parseInt(club_no);
		
		ClubBoardVO clubBoardVO = new ClubBoardVO();
		clubBoardVO.setClub_no(clubNo);
		clubBoardVO.setClub_board_no(clubBoardNo);
		
		clubBoardService.deleteClubBoardByClubNoAndClubBoardNo(clubBoardVO);
		
		return "redirect:./student_indexPage?club_no=" + club_no;
	}
}
