package com.ja.cbh.student.myclub.membershipfeemgmt.mapper;

import java.util.ArrayList;
import java.util.HashMap;

public interface Student_MemberShipFeeMgmtRestSQLMapper {
	
	
//회비내역
	//회비내역 등록
	public void inputMemberShipFeeMgmt(HashMap<String, Object> pram);
	//회비내역 수정 
	public void updateMemberShipFeeMgmt(HashMap<String, Object> pram);
	//회비내역 삭제
	public void deleteMemberShipFeeMgmt(HashMap<String, Object> pram);
	//회비내역 리스트 호출
	public ArrayList<HashMap<String, Object>> selectMemberShipFeeMgmtList();
}
