package com.ja.cbh.student.myclub.membermgmt.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.student.myclub.membermgmt.service.Student_MemberMgmtRestService;

@RestController
@RequestMapping("/student/myclub/membermgmt/*")
public class Student_MemberMgmtRestController {

	
	@Autowired
	private Student_MemberMgmtRestService memberMgmtRestService;
	
	@RequestMapping("updateClubMemberChangePosition")
	public HashMap<String, Object> updateClubMemberChangePosition(int club_stud_no , String club_stud_grade){
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		memberMgmtRestService.updateClubMemberChangePosition(club_stud_no ,club_stud_grade);
		
		return map;
	}
	
	@RequestMapping("deleteMemberInfo")
	public HashMap<String, Object> deleteMemberInfo(int club_stud_no){
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		memberMgmtRestService.deleteMemberInfo(club_stud_no);
		
		return map;
	}
	
	@RequestMapping("updateApprove")
	public HashMap<String, Object> updateApprove(int club_stud_no){
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		memberMgmtRestService.updateApprove(club_stud_no);
		
		return map;
	}
	
	@RequestMapping("deleteApprove")
	public HashMap<String, Object> deleteApprove(int club_stud_no){
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		memberMgmtRestService.deleteApprove(club_stud_no);
		
		return map;
	}
	
	
	
	
}
