package com.ja.cbh.student.myclub.schedule.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.myclub.schedule.mapper.Student_ClubScheduleRestSQLMapper;
import com.ja.cbh.vo.Club_ScheduleVO;

@Service
public class Student_ClubScheduleRestService {

	@Autowired
	private Student_ClubScheduleRestSQLMapper clubScheduleRestSQLMapper;
	
	public ArrayList<Club_ScheduleVO> showSchedule(){

		return clubScheduleRestSQLMapper.showSchedule();
	}
	
	public void addSchedule(Club_ScheduleVO club_ScheduleVO) {
		
		clubScheduleRestSQLMapper.addSchedule(club_ScheduleVO);
	}
}
