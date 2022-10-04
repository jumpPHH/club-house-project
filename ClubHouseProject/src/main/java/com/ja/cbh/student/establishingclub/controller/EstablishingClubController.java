package com.ja.cbh.student.establishingclub.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ja.cbh.student.establishingclub.service.EstablishingClubServiceImpl;
import com.ja.cbh.student.findingclub.service.FindingClubServiceImpl;
import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_ApplVO;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("student/establishingclub/*")

public class EstablishingClubController {
	
	@Autowired
	private EstablishingClubServiceImpl establishingClubService; 
	@Autowired
	private FindingClubServiceImpl findingService;
	
	@RequestMapping("student_indexPage")
	public String applicationFormPage() {
		
		return "student/establishingclub/student_indexPage";
	}
	
	@RequestMapping("student_requestEstablishClubProcess")
	public String student_requestEstablishClubProcess(Club_ApplVO clubAppl_vo, HttpSession session, HttpServletResponse response) {
		
			
		StudVO studInfo = (StudVO)session.getAttribute("sessionUserInfo");
		clubAppl_vo.setStud_id(studInfo.getStud_id()); 
		
		establishingClubService.inputClubAppl(clubAppl_vo);
		
		
		return "student/establishingclub/student_establishingRequestSuccessPage";
	}
	
	@RequestMapping("student_establishingClubResultPage")
	public String student_establishingClubResultPage(HttpSession session, Model model) {
		
		StudVO studInfo = (StudVO)session.getAttribute("sessionUserInfo");
		ArrayList<Club_ApplVO> clubApplDataList = establishingClubService.getAllClubApplByStudId(studInfo.getStud_id());
	
		model.addAttribute("clubApplDataList", clubApplDataList);
		
		return "student/establishingclub/student_establishingClubResultPage";
	}
	
	@RequestMapping("student_establishingClubRejectReasonPage")
	public String student_establishingClubRejectReasonPage() {
		
		//여기다가 반려사유 데이터 갖고와서 model로 쏴줘야함.
		
		
		return "student/establishingclub/student_establishingClubRejectReasonPage";
	}
	
	@RequestMapping("student_writeClubInfoPage")
	public String student_writeClubInfoPage() {
		
		
		
		return "student/establishingclub/student_writeClubInfoPage";
	}
	
	@RequestMapping("student_writeClubInfoProcess")
	public String student_writeClubInfoProcess(ClubVO clubVO, Model model, HttpSession session, @Param("title_image")MultipartFile title_image, @Param("club_dscrp_image")MultipartFile dscrp_image) {
		//ClubVO에 클럽 회장, 동아리 이름 , 동아리 신청 회원수, 동아리 신청일자 넣기
		{
		String rootFilePath = "C:/uploadFiles/";
		
		String originalFilename = title_image.getOriginalFilename();
		String randomName = UUID.randomUUID().toString();
		randomName += "_" + System.currentTimeMillis();
		
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		randomName += ext;
		
		// 폴더 생성
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
		String todayFolderName = sdf.format(today);
		
		//todayFolderName = "C:/uploadFiles/" + todayFolderName;
		
		File todayFolder = new File(rootFilePath + todayFolderName);
		if(!todayFolder.exists()) {
			//하위폴더까지 만듬.
			todayFolder.mkdirs();
		}
		
		try {
			title_image.transferTo(new File(rootFilePath +todayFolderName + randomName));
		}catch(Exception e) {
			e.printStackTrace();
		}
		clubVO.setClub_title_image(todayFolderName + randomName);
		}
		
		{
			String rootFilePath = "C:/uploadFiles/";
			
			String originalFilename = dscrp_image.getOriginalFilename();
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			randomName += ext;
			
			// 폴더 생성
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayFolderName = sdf.format(today);
			
			//todayFolderName = "C:/uploadFiles/" + todayFolderName;
			
			File todayFolder = new File(rootFilePath + todayFolderName);
			System.out.println(rootFilePath + todayFolderName);
			if(!todayFolder.exists()) {
				//하위폴더까지 만듬.
				todayFolder.mkdirs();
			}
			
			try {
				dscrp_image.transferTo(new File(rootFilePath + todayFolderName + randomName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			clubVO.setClub_dscrp_image(todayFolderName + randomName);
			}
		
		StudVO studData  = (StudVO)session.getAttribute("sessionUserInfo");
		
		Club_ApplVO clubApplData = establishingClubService.getApprovedClubApplByStudId(studData.getStud_id());
		
		
		
		
		clubVO.setClub_appl_dt(clubApplData.getClub_appl_date());
		clubVO.setClub_people_count(clubApplData.getClub_appl_people_count());
		clubVO.setClub_name(clubApplData.getClub_name());
		clubVO.setClub_boss(studData.getStud_id());
		
		
		
		
		establishingClubService.inputClub(clubVO);
		
		return"student/establishingclub/student_insertClubInfoSuccessPage";
	}
	
	

}
