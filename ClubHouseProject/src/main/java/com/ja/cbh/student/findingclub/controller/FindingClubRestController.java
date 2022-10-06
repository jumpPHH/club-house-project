package com.ja.cbh.student.findingclub.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.student.findingclub.service.FindingClubServiceImpl;
import com.ja.cbh.vo.ClubVO;

@RestController
@RequestMapping("student/findingclub/*")
public class FindingClubRestController {

	@Autowired
	private FindingClubServiceImpl findingClubService;
	
	@RequestMapping("getCategoryOfClubsAll")
	public HashMap<String, Object> getCategoryOfClubsAll(String club_category_no, String searchWord){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int clubCategoryNo = Integer.parseInt(club_category_no);
		ArrayList<ClubVO> clubList = findingClubService.getAllClubsOfCategory(clubCategoryNo, searchWord);
		
		map.put("data", clubList);
		map.put("result", "success");
		
		return map;
	}
	
	
}
