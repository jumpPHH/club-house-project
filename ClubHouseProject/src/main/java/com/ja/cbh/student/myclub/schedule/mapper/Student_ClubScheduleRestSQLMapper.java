package com.ja.cbh.student.myclub.schedule.mapper;

import java.util.ArrayList;

import com.ja.cbh.vo.Club_ScheduleVO;

public interface Student_ClubScheduleRestSQLMapper {
	
		public ArrayList<Club_ScheduleVO> showSchedule ();
		
		public void addSchedule(Club_ScheduleVO club_ScheduleVO);

}
