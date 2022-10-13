package com.ja.cbh.staff.applyClub.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.applyClub.mapper.Staff_ApplyClubSQLMapper;
import com.ja.cbh.student.establishingclub.mapper.EstablishingClubSQLMapper;
import com.ja.cbh.student.signup.mapper.Student_SignUpSQLMapper;
import com.ja.cbh.vo.Club_ApplVO;
import com.ja.cbh.vo.StudVO;


@Service
public class Staff_ApplyClubService {

	@Autowired
	private Staff_ApplyClubSQLMapper staff_ApplyClubSQLMapper;
	
	@Autowired
	private EstablishingClubSQLMapper establishingClubSQLMapper;
	
	@Autowired
	private Student_SignUpSQLMapper student_SignUpSQLMapper;
	
	public ArrayList<HashMap<String, Object>> getAllClubAppl(String searchWord, int pageNum) {
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<Club_ApplVO> clubApplData = establishingClubSQLMapper.selectAllEstablishingRequestResult(searchWord, pageNum);
		
		for(Club_ApplVO club_ApplVO : clubApplData) {
			String studId = club_ApplVO.getStud_id();
			StudVO studVO = student_SignUpSQLMapper.selectByStudentId(studId);
		
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("studVO", studVO);
			map.put("club_ApplVO", club_ApplVO);
			dataList.add(map);
		}
		return dataList;
	}
	
//	public HashMap<String, Object> getNoticeData(int noticeNo){
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		
//		NoticeVO noticeVO = staff_StudentNoticeSQLMapper.selectByNo(noticeNo);
//		String staff_id = noticeVO.getStaff_id();
//		StaffVO staffVO = staff_SignUpSQLMapper.selectById(staff_id);
//		
//		
//		map.put("noticeVO", noticeVO);
//		map.put("staffVO", staffVO);
//		
//		return map;
//	}
	
	public HashMap<String, Object> getApplData(int club_appl_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Club_ApplVO applVO = establishingClubSQLMapper.selectRequestByNo(club_appl_no);
		String stud_id = applVO.getStud_id();
		StudVO studVO = student_SignUpSQLMapper.selectByStudentId(stud_id);
				
		map.put("applVO", applVO);
		map.put("studVO", studVO);
		
		return map;
	}
	
	public int getNoticeCount(String searchWord) {
		return staff_ApplyClubSQLMapper.selectCount(searchWord);
	}
	
	
	public void modifyClubApplyState(HashMap<String, Object> param) {
		
		staff_ApplyClubSQLMapper.updateClubApplyStateByNo(param);
		
	}

}
