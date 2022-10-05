package com.ja.cbh.student.notice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.student.notice.service.student_NoticeServiceImpl;
import com.ja.cbh.vo.NoticeVO;

@Controller
@RequestMapping("/student/notice/*")
public class student_NoticeContoller {
	
	@Autowired
	private student_NoticeServiceImpl noticeService;
	
	@RequestMapping("student_NoticeListPage")
	public String student_NoticeListPage(Model model , HttpSession session) {
		
		model.addAttribute("NoticeDataList", noticeService.getNoticeDataList());
		
		
		return "student/notice/student_NoticeListPage";
		
	}
	
	@RequestMapping("student_NoticeReadPage")
	public String student_NoticeReadPage(String noti_no, Model model) {
		int notiNo = Integer.parseInt(noti_no);
		NoticeVO noticeData = noticeService.getNoticeDataByNotiNo(notiNo);
		model.addAttribute("noticeData", noticeData);
		
		return "student/notice/student_NoticeReadPage";
	}
	
	
	
	
	
}
