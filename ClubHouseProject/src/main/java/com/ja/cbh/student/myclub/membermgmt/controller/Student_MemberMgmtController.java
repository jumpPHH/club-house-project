package com.ja.cbh.student.myclub.membermgmt.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.cbh.student.myclub.main.service.Student_MainService;
import com.ja.cbh.student.myclub.membermgmt.service.Student_MemberMgmtService;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("/student/myclub/membermgmt/*")
public class Student_MemberMgmtController {
	
	@Autowired
	private Student_MemberMgmtService memberMgmtService;
	
	@Autowired
	private Student_MainService mainService;
	
	@RequestMapping("student_MemberMgmtPage")
	public String student_MemberMgmtPage(HttpSession session , Model model , 
									  String searchType , String searchWord,
			@RequestParam(value = "pageNum" , defaultValue = "1") int pageNum) {
		
		StudVO sessionUserInfo = (StudVO)session.getAttribute("sessionUserInfo");
		String stud_id = sessionUserInfo.getStud_id();
		
		model.addAttribute("MainData",mainService.student_MainData(stud_id));
		
		ArrayList<HashMap<String, Object>> activeMemberDataList = memberMgmtService.getActiveMemberData(stud_id,searchType,searchWord,pageNum);
		
		model.addAttribute("ActiveMemberDataList", activeMemberDataList);
		
		int activeMemberCount = memberMgmtService.getActiveMemberCount(stud_id);
		
		model.addAttribute("ActiveMemberCount",activeMemberCount);
		
		int activeMemberSelectCount = memberMgmtService.getActiveMemberSelectCount(stud_id,searchType,searchWord);
		
		model.addAttribute("ActiveMemberSelectCount",activeMemberSelectCount);
		
		int totalPageCount = (int)Math.ceil(activeMemberSelectCount /10.0);
		
		int startPage = ((pageNum - 1) / 5) * 5 + 1;
		int endPage = ((pageNum - 1) / 5 + 1) * 5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("currentPageNum",pageNum); 
		model.addAttribute("totalPageCount",totalPageCount);
		
		return "student/myclub/membermgmt/student_MemberMgmtPage";
	}
	
	
	@RequestMapping("student_MemberJoinMgmtPage")
	public String student_MemberJoinMgmtPage(HttpSession session , Model model , 			  
			@RequestParam(value = "pageNum" , defaultValue = "1") int pageNum) {
		
		StudVO sessionUserInfo = (StudVO)session.getAttribute("sessionUserInfo");
		String stud_id = sessionUserInfo.getStud_id();
		
		ArrayList<HashMap<String, Object>> applicantMemberDataList = memberMgmtService.getApplicantMemberData(stud_id,pageNum);
		
		model.addAttribute("ApplicantMemberDataList", applicantMemberDataList);
		
		int applicantMemberCount = memberMgmtService.getApplicantMemberCount(stud_id);
		
		model.addAttribute("ApplicantMemberCount",applicantMemberCount);
		
		int totalPageCount = (int)Math.ceil(applicantMemberCount /10.0);
		
		int startPage = ((pageNum - 1) / 5) * 5 + 1;
		int endPage = ((pageNum - 1) / 5 + 1) * 5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("currentPageNum",pageNum); 
		model.addAttribute("totalPageCount",totalPageCount);
		
		return "student/myclub/membermgmt/student_MemberJoinMgmtPage";
	}
	
}
