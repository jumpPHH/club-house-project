package com.ja.cbh.staff.volunteer.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ja.cbh.staff.volunteer.service.Staff_VlntrService;
import com.ja.cbh.student.volunteer.service.Student_VlntrService;
import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.VlntrNotiVO;

@Controller
@RequestMapping("/staff/volunteer/*")
public class Staff_VlntrController {

	@Autowired
	private Student_VlntrService student_VlntrService;
	@Autowired
	private Staff_VlntrService staff_VlntrService;
	
	@RequestMapping("staff_VlntrNotiPage")
	public String staff_VlntrNotiPage(Model model,  String searchType , String searchWord , 
			@RequestParam(value = "pageNum" , defaultValue = "1") int pageNum) {
		
		ArrayList<HashMap<String, Object>> vlntrNotiList = staff_VlntrService.getVlntrNoti(searchType, searchWord, pageNum);
		model.addAttribute("vlntrNotiList", vlntrNotiList);
		
		int notiCount = staff_VlntrService.getvlntrNotiCount(searchType, searchWord);
		
		int totalPageCount = (int)Math.ceil(notiCount/10.0);
		
		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPageNum", pageNum);
		model.addAttribute("totalPageCount", totalPageCount);
		
		String additionalParam = "";
		if(searchType != null && searchWord != null) {
			additionalParam += "&searchType=" + searchType;
			additionalParam += "&searchWord=" + searchWord;
		}
		
		model.addAttribute("additionalParam", additionalParam);
		
		return "staff/volunteer/staff_VlntrNotiPage";
	}
	
	@RequestMapping("staff_VlntrNotiProcess")
	public String staff_VlntrNotiProcess(VlntrNotiVO param, MultipartFile file) {
		String rootFilePath = "/uploadFiles/ClubHouseProject/student";
		
		String originalFilename = file.getOriginalFilename();
		
		String randomName = UUID.randomUUID().toString();
		randomName += "_" + System.currentTimeMillis();

		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		randomName += ext; 
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
		String todayFolderName = sdf.format(today);
		
		File todayFolder = new File(rootFilePath + todayFolderName);
		if(!todayFolder.exists()) {
			todayFolder.mkdirs();
		}
		
		try {
			file.transferTo(new File(rootFilePath + todayFolderName + randomName));
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		param.setVlntr_image_link(todayFolderName + randomName);
		
		staff_VlntrService.inputVltrNoti(param);
		
		return "redirect:./staff_VlntrNotiPage";
	}
	
	@RequestMapping("staff_DetailVlntrNotiPage")
	public String staff_DetailVlntrNotiPage(int vlntr_noti_no, Model model, HttpSession session) {
		
		HashMap<String, Object> vlntrMap = student_VlntrService.getVlntrNoti(vlntr_noti_no);
		
		model.addAttribute("vlntrMap", vlntrMap);
		
		return "staff/volunteer/staff_DetailVlntrNotiPage";
	}
	
	@RequestMapping("staff_VlntrNotiModifyProcess")
	public String staff_VlntrNotiModifyProcess(VlntrNotiVO param, MultipartFile file, HttpServletRequest request) {
		
		String rootFilePath = "/Users/kimchanwoo/Documents/uploadFiles/";
		
		String originalFilename = file.getOriginalFilename();
		
		String randomName = UUID.randomUUID().toString();
		randomName += "_" + System.currentTimeMillis();

		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		randomName += ext; 
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
		String todayFolderName = sdf.format(today);
		
		File todayFolder = new File(rootFilePath + todayFolderName);
		if(!todayFolder.exists()) {
			todayFolder.mkdirs();
		}
		
		try {
			file.transferTo(new File(rootFilePath + todayFolderName + randomName));
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		param.setVlntr_image_link(todayFolderName + randomName);
		
		staff_VlntrService.modifyVlntrNoti(param);
		String referer = request.getHeader("Referer");
		
		return "redirect:"+referer;
	}
	
	
	@RequestMapping("staff_VlntrNotiDeleteProcess")
	public String staff_VlntrNotiDeleteProcess(int vlntr_noti_no) {
		
		staff_VlntrService.deleteVlntrNoti(vlntr_noti_no);
		
		return "redirect:./staff_VlntrNotiPage";
	}
	
	@RequestMapping("staff_VlntrNotiCloseProcess")
	public String staff_VlntrNotiCloseProcess(int vlntr_noti_no, HttpServletRequest request) {
		
		staff_VlntrService.modifyVlntrNotiState(vlntr_noti_no);
		
		String referer = request.getHeader("Referer");
		
		return "redirect:"+referer;
	}
	
	@RequestMapping("staff_VlntrControlPage")
	public String staff_VlntrControlPage(Model model, @RequestParam(value = "club_no", defaultValue = "0" )String club_no , 
			@RequestParam(value = "stud_name", defaultValue = "" )String stud_name , @RequestParam(value = "stud_id", defaultValue = "" )String stud_id, 
			@RequestParam(value = "pageNum" , defaultValue = "1") int pageNum) {
		ArrayList<ClubVO> clubList = staff_VlntrService.getClubList();
		ArrayList<HashMap<String, Object>> clubStudList = staff_VlntrService.getClubStudInfo(club_no, stud_name,stud_id, pageNum);
		
		model.addAttribute("clubStudList", clubStudList);
		model.addAttribute("clubList", clubList);
		int notiCount = staff_VlntrService.getClubStudCount(club_no, stud_name, stud_id);
		
		int totalPageCount = (int)Math.ceil(notiCount/10.0);
		
		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPageNum", pageNum);
		model.addAttribute("totalPageCount", totalPageCount);
		
		String additionalParam = "";
		
		if(club_no != null && stud_name != null && stud_id != null) {
			additionalParam += "&club_no=" + club_no;
			additionalParam += "&stud_name=" + stud_name;
			additionalParam += "&stud_id=" + stud_id;
		}
		
		model.addAttribute("additionalParam", additionalParam);
		
		return "staff/volunteer/staff_VlntrControlPage";
	}
	
	@RequestMapping("staff_VlntrControlProcess")
	public String staff_VlntrControlProcess(String stud_id, int vlntrActivityTime) {
		
		staff_VlntrService.modifyStudVlntrTime(stud_id, vlntrActivityTime);
		
		return "redirect:./staff_VlntrControlPage";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
