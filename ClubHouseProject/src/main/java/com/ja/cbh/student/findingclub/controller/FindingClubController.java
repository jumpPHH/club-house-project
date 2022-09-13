package com.ja.cbh.student.findingclub.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.student.findingclub.service.FindingClubServiceImpl;
import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_Dept_CategoryVO;

@Controller
@RequestMapping("student/findingclub/*")
public class FindingClubController {

	@Autowired
	private FindingClubServiceImpl findingClubService;
	
	
	
	@RequestMapping("mainPage")
	public String mainPage(Model model) {
		
		return "student/findingclub/mainPage";
	}
	
	@RequestMapping("club_Of_CategoryPage")
	public String club_Of_CategoryPage(Model model, String club_category_no) {
		int clubCategoryNo = Integer.parseInt(club_category_no);
		
		Club_Dept_CategoryVO clubCategoryInfo = findingClubService.getClubCategoryByNo(clubCategoryNo);
		ArrayList<ClubVO> clubList = findingClubService.getAllClubsOfCertainCategory(clubCategoryNo);
		
		
		model.addAttribute("clubList", clubList);
		model.addAttribute("clubCategoryInfo", clubCategoryInfo);
		model.addAttribute("clubCategoryNo", clubCategoryNo);
		
		
		
		return "student/findingclub/club_Of_CategoryPage";
	
	
	
	}
}
