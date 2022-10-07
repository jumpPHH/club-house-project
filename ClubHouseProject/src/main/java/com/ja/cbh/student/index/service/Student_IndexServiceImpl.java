package com.ja.cbh.student.index.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.index.mapper.Student_IndexSQLMapper;

@Service
public class Student_IndexServiceImpl {

	@Autowired
	private Student_IndexSQLMapper student_IndexSQLMapper;
	
	// 로그인 한 사람이 가입되어 있는 클럽 가져오기.
	public int getClubNo(String studId, HttpServletResponse response) {
		String msg;
		if (student_IndexSQLMapper.selectClubStudByStudId(studId) == null) {
			 try {
					response.setContentType("text/html; charset=utf-8");
					PrintWriter w = response.getWriter();
					msg = "가입되어있는 동아리가 없습니다.";
					w.write("<script>alert('"+msg+"');location.href='"+"/cbh/student/index/student_IndexPage'"+";</script>");
					w.flush();
					w.close();
		     }catch(Exception e) {
					e.printStackTrace();
		     }
		}
		
		
		
		int clubNo = student_IndexSQLMapper.getClubNo(studId);
		
		return clubNo;
	}
}
