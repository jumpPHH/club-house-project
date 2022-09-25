package com.ja.cbh.student.myclub.membershipfeemgmt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.myclub.membershipfeemgmt.mapper.Student_MemberShipFeeMgmtSQLMapper;
import com.ja.cbh.vo.Club_BossAndAccountingMemberVO;

@Service
public class Student_MemberShipFeeMgmtService {

	@Autowired
	private Student_MemberShipFeeMgmtSQLMapper memberShipFeeMgmtSQLMapper;
	
	public Club_BossAndAccountingMemberVO clubBossAndAccountingMemberIs(String stud_id) {
			
		return memberShipFeeMgmtSQLMapper.selectClubBossAndAccountingMemberIs(stud_id);
	}
	
	
}
