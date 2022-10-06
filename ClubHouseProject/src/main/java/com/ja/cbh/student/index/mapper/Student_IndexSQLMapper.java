package com.ja.cbh.student.index.mapper;

import com.ja.cbh.vo.Club_StudVO;

public interface Student_IndexSQLMapper {

	public int getClubNo(String studId); 
	public Club_StudVO selectClubStudByStudId(String studId);
}
