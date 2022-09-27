package com.ja.cbh.staff.studentNotice.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.signup.mapper.Staff_SignUpSQLMapper;
import com.ja.cbh.staff.studentNotice.mapper.Staff_StudentNoticeSQLMapper;
import com.ja.cbh.vo.NoticeVO;
import com.ja.cbh.vo.StaffVO;

@Service
public class Staff_StudentNoticeService {
	
	@Autowired
	private Staff_StudentNoticeSQLMapper staff_StudentNoticeSQLMapper;
	
	@Autowired
	private Staff_SignUpSQLMapper staff_SignUpSQLMapper;
	
	public void writeNotice(NoticeVO noticeVO) {
		int noticePk = staff_StudentNoticeSQLMapper.createNoticePk();
		noticeVO.setNoti_no(noticePk);
		staff_StudentNoticeSQLMapper.insertNotice(noticeVO);
	}
	
	
	public ArrayList<HashMap<String, Object>> getNoticeDataList(int noti_div_no, String searchWord, int pageNum) {
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<NoticeVO> noticeList = staff_StudentNoticeSQLMapper.selectAll(noti_div_no, searchWord, pageNum);
		
		for(NoticeVO noticeVO : noticeList) {
			String staffId = noticeVO.getStaff_id();
			StaffVO staffVO = staff_SignUpSQLMapper.selectById(staffId);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("staffVO", staffVO);
			map.put("noticeVO", noticeVO);
			dataList.add(map);
		}
		
		return dataList;
	}
	
	public HashMap<String, Object> getNoticeData(int noticeNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		NoticeVO noticeVO = staff_StudentNoticeSQLMapper.selectByNo(noticeNo);
		String staff_id = noticeVO.getStaff_id();
		StaffVO staffVO = staff_SignUpSQLMapper.selectById(staff_id);
		
		
		map.put("noticeVO", noticeVO);
		map.put("staffVO", staffVO);
		
		return map;
	}
	
	public void increaseCount(int noticeNo) {
		staff_StudentNoticeSQLMapper.increaseReadCount(noticeNo);
	}
	
	public void deleteByNo(int noticeNo) {
		staff_StudentNoticeSQLMapper.deleteByNo(noticeNo);
	}
	
	public void updateDivTilteAndContent(NoticeVO noticeVO) {
		staff_StudentNoticeSQLMapper.updateDivTilteAndContent(noticeVO);
	}
	
	public int getNoticeCount(int noti_div_no, String searchWord) {
		return staff_StudentNoticeSQLMapper.noticeCount(noti_div_no, searchWord);
	}
}
