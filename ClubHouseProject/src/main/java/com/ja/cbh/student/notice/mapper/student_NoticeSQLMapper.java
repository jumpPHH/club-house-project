package com.ja.cbh.student.notice.mapper;

import java.util.ArrayList;

import com.ja.cbh.vo.Club_NoticeVO;
import com.ja.cbh.vo.StaffVO;

public interface student_NoticeSQLMapper {

	public ArrayList<Club_NoticeVO> selectAll();
	public StaffVO selectMemberInfo(String staff_id);
	
}
