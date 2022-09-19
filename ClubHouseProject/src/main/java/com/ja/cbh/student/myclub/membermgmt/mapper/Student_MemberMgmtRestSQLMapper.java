package com.ja.cbh.student.myclub.membermgmt.mapper;

import org.apache.ibatis.annotations.Param;

public interface Student_MemberMgmtRestSQLMapper {

	//동아리 회원 관리에서 직책 임명 변경시 실행되는 업데이트 쿼리 
	public void updateMemberChangePosition(
			@Param("club_stud_no") int club_stud_no , 
			@Param("club_stud_grade") String club_stud_grade);
	//동아리 회원 관리에서 강제탈퇴 할시 실행되는 딜리트 쿼리
	public void deleteMemberInfo(int club_stud_no);
	//동아리 회원 가입 신청자 -> 가입 승인 업데이트 쿼리.
	public void updateApprove(int club_stud_no);
	//동아리 회원 가입 신청자 -> 가입 거절 딜리트 쿼리.
	public void deleteApprove(int club_stud_no);
}
