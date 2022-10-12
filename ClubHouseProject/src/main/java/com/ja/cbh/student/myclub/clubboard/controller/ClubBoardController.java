package com.ja.cbh.student.myclub.clubboard.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ja.cbh.student.myclub.clubboard.service.ClubBoardServiceImpl;
import com.ja.cbh.student.myclub.main.service.Student_MainService;
import com.ja.cbh.vo.Club_BoardImageVO;
import com.ja.cbh.vo.Club_BoardVO;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("student/myclub/clubboard/*")
public class ClubBoardController {

	@Autowired
	private ClubBoardServiceImpl clubBoardService;
	
	@Autowired
	private Student_MainService mainService;

	// 동아리 활동내역 메인페이지. 동아리 활동 내역이 보이는 페이지임.
	// 나중에 추가해야할 기능. 해당 동아리가 아닌 사람이 파라미터만 수정해서 데이터를
	@RequestMapping("student_indexPage")
	public String student_indexPage(Model model,HttpSession session,String searchWord,@RequestParam(value = "pageNum",defaultValue = "1") int pageNum) {
		StudVO sessionUserInfo = (StudVO)session.getAttribute("sessionUserInfo");
	   String stud_id = sessionUserInfo.getStud_id();
		
		
		
		model.addAttribute("MainData",mainService.student_MainData(stud_id));


		ArrayList<HashMap<String, Object>> clubBoardList = clubBoardService.getClubBoardList(searchWord);
		
		int clubBoardCount = clubBoardService.getClubBoardCountByClubNoAndSearchWord(searchWord);
		
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

		return "student/myclub/clubboard/student_indexPage";
	}

	// 특정 글 상세보기 페이지
	@RequestMapping("student_clubBoardContentPage")
	public String student_clubBoardContentPage(Model model, String club_board_no,	HttpSession session) {
		int clubBoardNo = Integer.parseInt(club_board_no);

		StudVO sessionUserInfo = (StudVO) session.getAttribute("sessionUserInfo");
		if(sessionUserInfo == null) {
			return "student/login/student_LoginPage";
		}
		int sessionClubStudNo = clubBoardService.getClubStudNoByStudId(sessionUserInfo.getStud_id());

		HashMap<String, Object> map = clubBoardService.getClubBoardByClubBoardNoAndClubNo(clubBoardNo);
		model.addAttribute("map", map);
		model.addAttribute("sessionUserInfo", sessionUserInfo);
		model.addAttribute("sessionClubStudNo", sessionClubStudNo);

		return "student/myclub/clubboard/student_clubBoardContentPage";
	}
	
	//작성 페이지
	@RequestMapping("student_writeClubBoardPage")
	public String student_writeClubBoardPage(Model model, HttpSession session) {
		
		StudVO studVO = (StudVO)session.getAttribute("sessionUserInfo");
		String writerName = studVO.getStud_name();
		
		
		model.addAttribute("writerName",writerName);
		
		return "student/myclub/clubboard/student_writeClubBoardPage";
	}
	
	@RequestMapping("student_writeClubBoardProcess")
	public String student_writeClubBoardProcess(Club_BoardVO clubBoardVO, HttpSession session, MultipartFile []club_board_image) {
		
		int clubBoardNo = clubBoardService.getClubBoardNo();
		clubBoardVO.setClub_no(1);
		
		//ClubVO에 클럽 회장, 동아리 이름 , 동아리 신청 회원수, 동아리 신청일자 넣기
		if(club_board_image[0] != null) {
			for(MultipartFile file : club_board_image) {
			String rootFilePath = "C:/uploadFiles/ClubHouseProject\student";
			String originalFilename = file.getOriginalFilename();
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			randomName += ext;
			
			// 폴더 생성
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayFolderName = sdf.format(today);
			
			//todayFolder = "C:/uploadFiles/" + todayFolderName;
			
			File todayFolder = new File(rootFilePath + todayFolderName);
			if(!todayFolder.exists()) {
				//하위폴더까지 만듬.
				todayFolder.mkdirs();
			}
			
			try {
				file.transferTo(new File(rootFilePath +todayFolderName + randomName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			Club_BoardImageVO clubBoardImageVO = new Club_BoardImageVO();
			clubBoardImageVO.setClub_board_image_link(todayFolder + randomName);
			clubBoardImageVO.setClub_board_no(clubBoardNo);
			clubBoardImageVO.setClub_no(1);
			clubBoardService.inputClubBoardImage(clubBoardImageVO);
			}
		}
		
		
		StudVO studVO = (StudVO)session.getAttribute("sessionUserInfo");
		int clubStudNo = clubBoardService.getClubStudNoByStudId(studVO.getStud_id());
		clubBoardVO.setClub_stud_no(clubStudNo);
		clubBoardVO.setClub_board_no(clubBoardNo);
		
		clubBoardService.inputClubBoardByClubBoardVO(clubBoardVO);
		
		
		return "redirect:./student_indexPage";
	}

	//수정 페이지
	@RequestMapping("student_modifyClubBoardPage")
	public String student_modifyClubBoardPage(Model model, String club_board_no,String club_no) {
		int clubNo = Integer.parseInt(club_no);
		int clubBoardNo = Integer.parseInt(club_board_no);
		Club_BoardVO clubBoardData = clubBoardService.getClubBoardByClubBoardNoAndClubNoForJustDataUse(clubBoardNo);
		
		model.addAttribute("clubBoardNo", clubBoardNo);
		model.addAttribute("clubBoardData", clubBoardData);
		model.addAttribute("clubNo", clubNo);
		return "student/myclub/clubboard/student_modifyClubBoardPage";
	}
	
	// 수정 프로세스
	@RequestMapping("student_modifyClubBoardProcess")
	public String student_modifyClubBoardProcess(Club_BoardVO NewClubBoardVO) {
		int clubBoardNo = NewClubBoardVO.getClub_board_no();
	
		
		Club_BoardVO originClubBoardVO = clubBoardService.getClubBoardByClubBoardNoAndClubNoForJustDataUse(clubBoardNo);
		originClubBoardVO.setClub_board_title(NewClubBoardVO.getClub_board_title());
		originClubBoardVO.setClub_board_content(NewClubBoardVO.getClub_board_content());
		
		clubBoardService.modifyClubBoard(originClubBoardVO);
		
		return "redirect:./student_indexPage";
	}
	// 게시글 삭제 및 게시글 이미지 삭제.... 댓글 삭제도 넣어야함.
	@RequestMapping("student_deleteClubBoardProcess")
	public String student_deleteClubBoardProcess(String club_board_no) {
		int clubBoardNo = Integer.parseInt(club_board_no);
		
		Club_BoardVO clubBoardVO = new Club_BoardVO();
		clubBoardVO.setClub_no(1);
		clubBoardVO.setClub_board_no(clubBoardNo);
		
		clubBoardService.deleteClubBoardByClubNoAndClubBoardNo(clubBoardVO);
		clubBoardService.deleteClubBoardImageByBoardNo(clubBoardNo);
		
		return "redirect:./student_indexPage";
	}
}
