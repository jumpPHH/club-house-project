package com.ja.cbh.student.myclub.clubactivities.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.student.findingclub.service.FindingClubServiceImpl;
import com.ja.cbh.student.myclub.clubactivities.service.ClubActivitesServiceImpl;
import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_ActVO;

@RestController
@RequestMapping("/student/myclub/clubactivities/restapi/*")
public class ClubActivitiesRestController {

	@Autowired
	private ClubActivitesServiceImpl clubActivitiesService;
	
	@Autowired
	private FindingClubServiceImpl findingClubService;
	
	@RequestMapping("getClubActList")
	public HashMap<String, Object> getClubActList(String club_no) {
		int clubNo = Integer.parseInt(club_no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<Club_ActVO> data = clubActivitiesService.getClubActivitiesList(clubNo); 
		
		map.put("result", "success");
		map.put("data", data);
		return map;
	}
	
	// 클럽 정보 가져오기.
	@RequestMapping("getClubData")
	public HashMap<String, Object> getClubData(@RequestParam(value="club_no") String club_no) {
		int clubNo = Integer.parseInt(club_no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ClubVO clubData = findingClubService.getClubByNo(clubNo);
		
		map.put("result","success");
		map.put("data", clubData);
		
		return map;
	}
}
