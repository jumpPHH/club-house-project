package com.ja.cbh.student.myclub.membershipfeemgmt.mapper;

import java.util.HashMap;

import com.ja.cbh.vo.Club_Fee;

public interface Student_MemberShipFeeMgmtRestSQLMapper {
	
	
//회비내역
	//회비내역 등록
	public void inputMemberShipFeeMgmt(HashMap<String, Object> pram);
	//회비내역 수정 
	public void updateMemberShipFeeMgmtSave(HashMap<String, Object> pram);
	//회비내역 삭제
	public void deleteMemberShipFeeMgmtDelete(int club_fee_no);
	
	public Club_Fee selectMemberShipFeeMgmtDetail(int club_fee_no);

}
