package com.ja.cbh.student.myclub.membermgmt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.myclub.membermgmt.mapper.Student_MemberMgmtRestSQLMapper;

@Service
public class Student_MemberMgmtRestService {
	
	@Autowired
	private Student_MemberMgmtRestSQLMapper memberMgmtRestSQLMapper;
	
	public void updateClubMemberChangePosition(int club_stud_no , String club_stud_grade) {
		
		memberMgmtRestSQLMapper.updateMemberChangePosition(club_stud_no , club_stud_grade);
	}
	
	public void deleteMemberInfo(int club_stud_no) {

		memberMgmtRestSQLMapper.deleteMemberInfo(club_stud_no);
	}
	
	public void updateApprove(int club_stud_no) {
		
		memberMgmtRestSQLMapper.updateApprove(club_stud_no);
	}
	
	public void deleteApprove(int club_stud_no) {
		
		memberMgmtRestSQLMapper.deleteApprove(club_stud_no);
	}

}
