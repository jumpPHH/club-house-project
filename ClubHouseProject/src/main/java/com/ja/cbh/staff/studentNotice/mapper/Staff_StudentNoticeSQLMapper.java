package com.ja.cbh.staff.studentNotice.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ja.cbh.vo.NoticeVO;


public interface Staff_StudentNoticeSQLMapper {

	public int createNoticePk();
	public void insertNotice(NoticeVO noticeVO);
	//조회, 페이징
	public ArrayList<NoticeVO> selectAll(			
			@Param("noti_div_no")int noti_div_no,
			@Param("searchWord")String searchWord,			
			@Param("pageNum") int pageNum
			);
	public int noticeCount(
			@Param("noti_div_no") int noti_div_no,
			@Param("searchWord") String searchWord			
			);
	public void countNoticeNum(int noticeNo); //공지 분류별 개수(추가)
	
	public NoticeVO selectByNo(int noticeNo);
	
	public void increaseReadCount(int noticeNo);
	public void deleteByNo(int noticeNo);
	public void updateDivTilteAndContent(NoticeVO noticeVO);
}
