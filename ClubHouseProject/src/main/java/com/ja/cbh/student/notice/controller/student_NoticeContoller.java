package com.ja.cbh.student.notice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.student.notice.service.student_NoticeServiceImpl;

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
	public String student_NoticeReadPage() {
		
		return "student/notice/student_NoticeReadPage";
	}
	
	
	
	
	
}
