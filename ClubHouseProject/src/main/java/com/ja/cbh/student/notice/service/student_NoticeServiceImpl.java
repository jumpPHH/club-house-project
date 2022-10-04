package com.ja.cbh.student.notice.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.notice.mapper.student_NoticeSQLMapper;
import com.ja.cbh.vo.Club_NoticeVO;
import com.ja.cbh.vo.NoticeVO;
import com.ja.cbh.vo.StaffVO;

@Service
public class student_NoticeServiceImpl {

	
		@Autowired
		private student_NoticeSQLMapper noticeSQLMapper;
		
		public ArrayList<HashMap<String, Object>> getNoticeDataList() {
			ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
			
			ArrayList<Club_NoticeVO> noticeList = noticeSQLMapper.selectAll();
			
			for (Club_NoticeVO club_NoticeVO : noticeList) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("club_NoticeVO", club_NoticeVO);
				
				String staff_id = club_NoticeVO.getStaff_id();
				
				StaffVO staffVO = noticeSQLMapper.selectMemberInfo(staff_id);
				map.put("staffVO", staffVO);
				
				dataList.add(map);
			}
			
			return dataList;
		}
		
		
		public NoticeVO getNoticeDataByNotiNo(int notiNo) {
			NoticeVO clubNoticeVO = noticeSQLMapper.selectNoticeByNotiNo(notiNo);
			
			return clubNoticeVO;
		}
		
		
		
}
