package com.ja.cbh.student.establishingclub.controller;

import java.io.File;
import java.io.PrintWriter;
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
import com.ja.cbh.student.myclub.clubboard.mapper.ClubBoardSQLMapper;
import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_ApplVO;
import com.ja.cbh.vo.Club_StudVO;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("student/establishingclub/*")

public class EstablishingClubController {
	
	@Autowired
	private EstablishingClubServiceImpl establishingClubService; 
	
	
	@RequestMapping("student_indexPage")
	public String student_indexPage(HttpSession session,Model model) {
		
		return "student/establishingclub/student_indexPage";
	}
	
	@RequestMapping("student_requestEstablishClubProcess")
	public String student_requestEstablishClubProcess(Club_ApplVO clubApplVO, HttpSession session, HttpServletResponse response) {
		String msg = "";
			
		StudVO studInfo = (StudVO)session.getAttribute("sessionUserInfo");
		clubApplVO.setStud_id(studInfo.getStud_id()); 
		Club_ApplVO sessionApplData = establishingClubService.getClubApplByStudId(studInfo.getStud_id());
		
		Club_StudVO clubStudData = establishingClubService.getClubStudByStudId(studInfo.getStud_id());
		if(clubStudData != null) {
			 try {
					response.setContentType("text/html; charset=utf-8");
					PrintWriter w = response.getWriter();
					msg = "이미 동아리에 가입되어 있습니다.";
					w.write("<script>alert('"+msg+"');location.href='"+"/cbh/student/index/student_IndexPage'"+";</script>");
					w.flush();
					w.close();
		     }catch(Exception e) {
					e.printStackTrace();
		     }
		}
		
		if(sessionApplData == null) {
			establishingClubService.inputClubAppl(clubApplVO);
			return "student/establishingclub/student_establishingRequestSuccessPage";
		}
		
		if(sessionApplData.getClub_appl_state() == "2") {
			 try {
					response.setContentType("text/html; charset=utf-8");
					PrintWriter w = response.getWriter();
					msg = "개설 심사중인 동아리가 존재합니다.";
					w.write("<script>alert('"+msg+"');location.href='"+"/cbh/student/index/student_IndexPage'"+";</script>");
					w.flush();
					w.close();
		     }catch(Exception e) {
					e.printStackTrace();
		     }
		}
		
		
		
		
		return "student/establishingclub/student_establishingRequestSuccessPage";
	}
	
	@RequestMapping("student_establishingRequestSuccessPage")
	public String student_establishingRequestSuccessPage() {
		
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
		int clubNo = establishingClubService.createClubPk();
		
		//ClubVO에 클럽 회장, 동아리 이름 , 동아리 신청 회원수, 동아리 신청일자 넣기
		{
		String rootFilePath = "C:/uploadFiles/ClubHouseProject/student/";
		
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
		Club_StudVO clubStudVO = new Club_StudVO();
		
		Club_ApplVO clubApplData = establishingClubService.getApprovedClubApplByStudId(studData.getStud_id());
		
		int applNo = clubApplData.getClub_appl_no();
		
		clubVO.setClub_no(clubNo);
		clubVO.setClub_category_no(1);
		clubVO.setClub_appl_dt(clubApplData.getClub_appl_date());
		clubVO.setClub_people_count(clubApplData.getClub_appl_people_count());
		clubVO.setClub_name(clubApplData.getClub_name());
		clubVO.setClub_boss(studData.getStud_id());
		clubVO.setClub_appl_no(applNo);
		
		clubStudVO.setStud_id(studData.getStud_id());
		clubStudVO.setClub_no(clubNo);
		
		
		
		
		establishingClubService.inputClubStudByStud(clubStudVO);
		establishingClubService.inputClub(clubVO,applNo);
		
		return"student/establishingclub/student_insertClubInfoSuccessPage";
	}
	
	
	

}
