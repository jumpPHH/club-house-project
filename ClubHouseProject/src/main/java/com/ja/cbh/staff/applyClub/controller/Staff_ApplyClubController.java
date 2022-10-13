package com.ja.cbh.staff.applyClub.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.cbh.staff.applyClub.service.Staff_ApplyClubService;
import com.ja.cbh.student.establishingclub.service.EstablishingClubServiceImpl;
import com.ja.cbh.vo.Club_ApplVO;

@Controller
@RequestMapping("/staff/applyClub/*")
public class Staff_ApplyClubController {
	
	@Autowired
	private Staff_ApplyClubService staff_ApplyClubService;
	
	
	@RequestMapping("staff_applyClubPage")
	public String applyClubPage(Model model, @RequestParam(value="searchWord", defaultValue="")String searchWord, @RequestParam(value="pageNum", defaultValue="1")int pageNum) {
		ArrayList<HashMap<String, Object>> clubApplDataList = staff_ApplyClubService.getAllClubAppl(searchWord, pageNum);
		model.addAttribute("clubApplDataList", clubApplDataList);
		

		
		int noticeCount = staff_ApplyClubService.getNoticeCount(searchWord);
		int totalPageCount = (int)Math.ceil(noticeCount/10.0);
		int startPage = ((pageNum-1)/5)*5+1;
		int endPage = ((pageNum-1)/5+1)*5; 
		
		if(endPage >= totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("totalPageCount" , totalPageCount);
		model.addAttribute("startPage" , startPage);
		model.addAttribute("endPage" , endPage);
		model.addAttribute("currentPageNum" , pageNum);
		
		String additionalParam = "";
		if(searchWord != null) {
		additionalParam += "&searchWord=" + searchWord;
		
		}else if(searchWord == null) {
			additionalParam += "&searchWord";	
		}
		model.addAttribute("additionalParam" , additionalParam);
		
		return "staff/applyClub/staff_applyClubPage";
	}
	
	@RequestMapping("staff_readClubRequestPage")
	public String readClubRequest(Model model) {

		return "staff/applyClub/staff_readClubRequestPage";
	}
	
}
