package com.ja.cbh.staff.club.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.club.mapper.Staff_ClubRestSQLMapper;
import com.ja.cbh.vo.ClubStudVO;
import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.StudVO;

@Service
public class Staff_ClubRestService {

	@Autowired
	private Staff_ClubRestSQLMapper staff_ClubRestSQLMapper;
	
	public ArrayList<ClubVO> getClubData() {
		
		return staff_ClubRestSQLMapper.selectClubData();
	}

	public ArrayList<HashMap<String, Object>> getStudData(int club_no) {
		
		ArrayList<HashMap<String, Object>> studList = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<ClubStudVO> clubStudList = staff_ClubRestSQLMapper.selectClubStudByClubNo(club_no);
		
		for(ClubStudVO clubStudVo : clubStudList) {
			 
			String stud_id = clubStudVo.getStud_id();
			StudVO studVo = staff_ClubRestSQLMapper.selectStudByStudId(stud_id);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("clubStudVo", clubStudVo);
			map.put("studVo", studVo);
			studList.add(map);
		}
		
		return studList;
	}
	
	public ArrayList<HashMap<String, Object>> getAllStudData() {
		
		ArrayList<HashMap<String, Object>> allStudList = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<ClubStudVO> clubStudList = staff_ClubRestSQLMapper.selectAllClubStud();
		
		for(ClubStudVO clubStudVo : clubStudList) {
			String stud_id = clubStudVo.getStud_id();
			StudVO studVo = staff_ClubRestSQLMapper.selectStudByStudId(stud_id);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("clubStudVo", clubStudVo);
			map.put("studVo", studVo);
			allStudList.add(map);
		}
		
		return allStudList;
	}
	
	public ArrayList<HashMap<String, Object>> getSearchStudData(String stud_name, String stud_id){
		
		ArrayList<HashMap<String, Object>> searchStudList = staff_ClubRestSQLMapper.selectSearchClubStudByStudNameAndStudId(stud_name, stud_id);
		
		return searchStudList;
	}
}
