package com.ja.cbh.student.myclub.membershipfeemgmt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.cbh.student.myclub.membershipfeemgmt.service.Student_MemberShipFeeMgmtService;
import com.ja.cbh.vo.StudVO;

@Controller
@RequestMapping("/student/myclub/membershipfeemgmt/*")
public class Student_MemberShipFeeMgmtController {
	
	@Autowired
	private Student_MemberShipFeeMgmtService memberShipFeeMgmtService; 
	
	@RequestMapping("student_MemberShipFeeMgmtPage")
	public String student_MemberShipFeeMgmtPage(HttpSession session , Model model) {
		
		StudVO sessionUserInfo = (StudVO)session.getAttribute("sessionUserInfo");
		String stud_id = sessionUserInfo.getStud_id();
	
		model.addAttribute("ClubBossAndAccountingMemberIs",memberShipFeeMgmtService.clubBossAndAccountingMemberIs(stud_id));
		
		return "student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtPage";
	}
	
	@RequestMapping("student_MemberShipFeeMgmtListPage")
	public String student_MemberShipFeeMgmtListPage(
			HttpSession session , Model model ,
			String searchType , String searchWord ,
			@RequestParam(value = "pageNum" , defaultValue = "1") int pageNum) {
		
		StudVO sessionUserInfo = (StudVO)session.getAttribute("sessionUserInfo");
		String stud_id = sessionUserInfo.getStud_id();

		model.addAttribute("CLubFeeAllData", memberShipFeeMgmtService.getCLubFeeAllData(
				stud_id,searchType,searchWord,pageNum));
		
		int memberShipFeeSelectCount = memberShipFeeMgmtService.getMemberShipFeeSelectCount(stud_id,searchType,searchWord);
		
		model.addAttribute("MemberShipFeeSelectCount",memberShipFeeSelectCount);
		
		int totalPageCount = (int)Math.ceil(memberShipFeeSelectCount /10.0);
		
		int startPage = ((pageNum - 1) / 5) * 5 + 1;
		int endPage = ((pageNum - 1) / 5 + 1) * 5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("currentPageNum",pageNum); 
		model.addAttribute("totalPageCount",totalPageCount);	
		model.addAttribute("AmountTotalResult",memberShipFeeMgmtService.getAmountTotal(stud_id, searchType, searchWord, pageNum));
		
		
		return "student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage";
	}
	

}
