package com.ja.cbh.student.clubboard.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.student.clubboard.service.ClubBoardServiceImpl;
import com.ja.cbh.vo.Club_StudVO;

@RequestMapping("student/clubboard/restapi/*")
@RestController
public class ClubBoardRestController {

	@Autowired
	private ClubBoardServiceImpl clubBoardService;
	
	@RequestMapping("getClubStudByClubStudNo")
	public HashMap<String, Object> getClubStudByClubStudNo(String club_stud_no) {
		int clubStudNo = Integer.parseInt(club_stud_no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Club_StudVO clubStudVO = clubBoardService.getClubStudByClubStudNo(clubStudNo);
		
		map.put("result", "success");
		map.put("data", clubStudVO);
		
		return map;
	}
}
