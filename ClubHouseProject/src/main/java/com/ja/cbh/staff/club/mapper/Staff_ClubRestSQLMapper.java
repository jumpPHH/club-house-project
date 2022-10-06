package com.ja.cbh.staff.club.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.ja.cbh.vo.ClubStudVO;
import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.StudVO;

public interface Staff_ClubRestSQLMapper {
	
	public ArrayList<ClubVO> selectClubData();
	
	public ArrayList<ClubStudVO> selectClubStudByClubNo(int club_no);
	
	public StudVO selectStudByStudId(String stud_id);
	
	public ArrayList<ClubStudVO> selectAllClubStud();
	
	public ArrayList<HashMap<String, Object>> selectSearchClubStudByStudNameAndStudId(
			@Param(value = "stud_name")String stud_name , 
			@Param(value = "stud_id")String stud_id);
}
