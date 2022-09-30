package com.ja.cbh.student.myclub.applicationexpenses.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.cbh.student.myclub.applicationexpenses.service.Student_ApplicationExpensesService;
import com.ja.cbh.student.myclub.main.service.Student_MainService;
import com.ja.cbh.vo.Club_ExpnsApplyVO;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("/student/myclub/applicationexpenses/*")
public class Student_ApplicationExpensesController {
	
	@Autowired
	private Student_MainService mainService;
	
	@Autowired
	private Student_ApplicationExpensesService applicationExpensesService;
	
	@RequestMapping("student_ApplicationExpensesPage")
	public String student_ApplicationExpensesPage(HttpSession session , Model model) {
		
		StudVO sessionUserInfo = (StudVO)session.getAttribute("sessionUserInfo");
		String stud_id = sessionUserInfo.getStud_id();	
		
		model.addAttribute("ClubBossInfo",mainService.student_MainData(stud_id));		
		
		return "/student/myclub/applicationexpenses/student_ApplicationExpensesPage";
	}
	
	@RequestMapping("student_ApplicationExpensesRegistrationProcess")
	public String student_ApplicationExpensesRegistrationProcess(Club_ExpnsApplyVO clubExpnsApplyVO,int club_no) {
		clubExpnsApplyVO.setClub_no(club_no);
		
		applicationExpensesService.insertClubExpnsApplyRegistration(clubExpnsApplyVO);
		
		return "redirect:/student/myclub/applicationexpenses/student_ApplicationExpensesListPage";
	}
	
	@RequestMapping("student_ApplicationExpensesListPage")
	public String student_ApplicationExpensesListPage(HttpSession session , Model model,
			  String searchType , String searchWord,
			  @RequestParam(value = "pageNum" , defaultValue = "1") int pageNum) {
		
		StudVO sessionUserInfo = (StudVO)session.getAttribute("sessionUserInfo");
		String stud_id = sessionUserInfo.getStud_id();	
		
		model.addAttribute("ClubExpnsApplyVO", applicationExpensesService.getApplicationExpensesDataList(stud_id,searchType,searchWord,pageNum));
		
		int expnsApplySelectCount = applicationExpensesService.getExpnsApplySelectCount(stud_id,searchType,searchWord);
		
		model.addAttribute("ExpnsApplySelectCount",expnsApplySelectCount);
		
		int totalPageCount = (int)Math.ceil(expnsApplySelectCount /10.0);
		
		int startPage = ((pageNum - 1) / 5) * 5 + 1;
		int endPage = ((pageNum - 1) / 5 + 1) * 5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("currentPageNum",pageNum); 
		model.addAttribute("totalPageCount",totalPageCount);
		
		return "/student/myclub/applicationexpenses/student_ApplicationExpensesListPage";
	}
}
