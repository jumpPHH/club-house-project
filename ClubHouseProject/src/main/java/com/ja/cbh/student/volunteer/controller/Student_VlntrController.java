package com.ja.cbh.student.volunteer.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.cbh.staff.volunteer.service.Staff_VlntrService;
import com.ja.cbh.student.myclub.main.service.Student_MainService;
import com.ja.cbh.student.volunteer.service.Student_VlntrService;
import com.ja.cbh.vo.StudVO;
import com.ja.cbh.vo.VlntrNotiVO;

@Controller
@RequestMapping("/student/volunteer/*")
public class Student_VlntrController { 
	
	@Autowired
	private Student_VlntrService student_VlntrService;  
	@Autowired
	private Staff_VlntrService staff_VlntrService;
	
	@Autowired
	private Student_MainService mainService;
	
	@RequestMapping("stud_VlntrApplPage")
	public String stud_VlntrApplPage(HttpSession session, Model model,  String searchType , String searchWord , 
			@RequestParam(value = "pageNum" , defaultValue = "1") int pageNum) {
		
		StudVO sessionUserInfo = (StudVO)session.getAttribute("sessionUserInfo");
		String stud_id = sessionUserInfo.getStud_id();		
	
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
		
		model.addAttribute("MainData",mainService.student_MainData(stud_id));
		model.addAttribute("additionalParam", additionalParam);
		
		return "student/volunteer/stud_VlntrApplPage";
	}
	
	@RequestMapping("stud_DetailVlntrApplPage")
	public String stud_DetailVlntrApplPage(int vlntr_noti_no, Model model, HttpSession session) {
		
		StudVO studVo = (StudVO)session.getAttribute("sessionUserInfo");
		String stud_id = studVo.getStud_id();
		HashMap<String, Object> myApplExist = student_VlntrService.getMyVlntrAppleCount(vlntr_noti_no, stud_id);
		
		HashMap<String, Object> vlntrMap = student_VlntrService.getVlntrNoti(vlntr_noti_no);
		
		model.addAttribute("vlntrMap", vlntrMap);
		model.addAttribute("myApplExist", myApplExist);
		
		return "student/volunteer/stud_DetailVlntrApplPage";
	}
	
	@RequestMapping("stud_DetailVlntrApplProcess")
	public String stud_DetailVlntrApplProcess(VlntrNotiVO vlntrNotiVo, HttpSession session) {
		
		StudVO studVo = (StudVO)session.getAttribute("sessionUserInfo");
		String stud_id = studVo.getStud_id();
		int vlntr_noti_no = vlntrNotiVo.getVlntr_noti_no();
		
		//봉사신청테이블에 신청거 input
		student_VlntrService.inputVlntrAppl(vlntr_noti_no, stud_id);
		//
		student_VlntrService.modifyVlntrNoti(vlntrNotiVo);
		
		return "redirect:./stud_VlntrApplPage";
	}
	
	@RequestMapping("stud_VlntrApplDeleteProcess")
	public String stud_VlntrApplDeleteProcess(int vlntr_noti_no, HttpSession session) {
		
		StudVO studVo = (StudVO)session.getAttribute("sessionUserInfo");
		String stud_id = studVo.getStud_id();
		
		student_VlntrService.deleteMyVlntrAppl(vlntr_noti_no, stud_id);
		student_VlntrService.modifyVlntrNotiApplCount(vlntr_noti_no);
		
		
		return "redirect:./stud_VlntrApplPage";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}