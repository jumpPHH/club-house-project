package com.ja.cbh.student.myclub.schedule.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.student.myclub.schedule.service.Student_ClubScheduleRestService;
import com.ja.cbh.vo.Club_ScheduleVO;

@RestController
@RequestMapping("/student/myclub/schedule/*")
public class Student_ClubScheduleRestController {
	
	@Autowired
	private Student_ClubScheduleRestService clubScheduleRestService;
	
	@RequestMapping("addSchedule")
	public HashMap<String, Object> addSchedule(Club_ScheduleVO club_ScheduleVO){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		clubScheduleRestService.addSchedule(club_ScheduleVO);
		
		map.put("succes", "등록성공");
		
		return map; 
	}
	
}
