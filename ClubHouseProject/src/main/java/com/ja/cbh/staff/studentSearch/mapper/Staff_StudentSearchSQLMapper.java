package com.ja.cbh.staff.studentSearch.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.ja.cbh.vo.StudVO;

public interface Staff_StudentSearchSQLMapper {
	
	//학생조회에 필요한 정보
	public ArrayList<HashMap<String, Object>> selectByStudentId(StudVO StudVo);
	
}
