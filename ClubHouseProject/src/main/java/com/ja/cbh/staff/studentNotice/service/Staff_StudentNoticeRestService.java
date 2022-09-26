package com.ja.cbh.staff.studentNotice.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.ja.cbh.staff.studentNotice.mapper.Staff_StudentNoticeRestSQLMapper;
import com.ja.cbh.vo.NoticeVO;

public class Staff_StudentNoticeRestService {

	@Autowired
	private Staff_StudentNoticeRestSQLMapper staff_StudentNoticeRestSQLMapper;

	
//	public NoticeVO delNotice(int noticeNo) {
//		return staff_StudentNoticeRestSQLMapper.delNotiByNo(noticeNo);
//	}
}
