package com.ja.cbh.student.index.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.student.index.service.Student_IndexServiceImpl;
import com.ja.cbh.vo.StudVO;

@RestController
@RequestMapping("student/index/restapi/*")
public class Student_IndexRestController {

	@Autowired
	private Student_IndexServiceImpl student_IndexService;
	
	@RequestMapping("getClubNo")
	public HashMap<String, Object> getClubNo(HttpSession session, HttpServletResponse response){
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		
		StudVO studVO = (StudVO)session.getAttribute("sessionUserInfo");
		
		int clubNo = student_IndexService.getClubNo(studVO.getStud_id(), response);
		
		map.put("result", "success");
		map.put("clubNo", clubNo);
		
		return map;
	}
	
}
