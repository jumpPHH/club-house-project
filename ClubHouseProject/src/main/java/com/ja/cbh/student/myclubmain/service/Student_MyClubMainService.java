package com.ja.cbh.student.myclubmain.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.myclubmain.mapper.Student_MyClubMainSQLMapper;
import com.ja.cbh.vo.StudVO;

@Service
public class Student_MyClubMainService {
	
	@Autowired
	private Student_MyClubMainSQLMapper student_MyClubMainSQLMapper;
	
	public HashMap<String, Object> student_MyCLubMainData(StudVO studVO){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//세션에서 추출한 'stud_id'
		String stud_id = studVO.getStud_id();
		
		//동아리 장 정보를 가져오는 로직
		map.put("GetClubBoss", student_MyClubMainSQLMapper.selectGetClubBoss(stud_id));
		//동아리 장이 설립한 동아리에 대한 정보를 가져오는 로직
		map.put("GetClubBossClubInfo", student_MyClubMainSQLMapper.selectGetClubBossClubInfo(stud_id));
		
		return map;
	}
	
}
