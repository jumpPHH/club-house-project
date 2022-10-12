package com.ja.cbh.student.myclub.membershipfeemgmt.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.myclub.membershipfeemgmt.mapper.Student_MemberShipFeeMgmtRestSQLMapper;
import com.ja.cbh.vo.Club_Fee;

@Service
public class Student_MemberShipFeeMgmtRestService {
	
	@Autowired
	private Student_MemberShipFeeMgmtRestSQLMapper memberShipFeeMgmtRestSQLMapper;
	
	public void inputMemberShipFeeMgmt(HashMap<String, Object> pram) {
		if(pram.get("TABLE").equals("회비내역관리")) {
			memberShipFeeMgmtRestSQLMapper.inputMemberShipFeeMgmt(pram);
		}
	}
	
	public void updateMemberShipFeeMgmtSave(HashMap<String, Object> pram) {

			memberShipFeeMgmtRestSQLMapper.updateMemberShipFeeMgmtSave(pram);
		
	}
	 
	public void deleteMemberShipFeeMgmtDelete(int club_fee_no) {
		
			memberShipFeeMgmtRestSQLMapper.deleteMemberShipFeeMgmtDelete(club_fee_no);
		
	}

	public Club_Fee selectMemberShipFeeMgmtDetail(int club_fee_no){
		
		Club_Fee getClubFeeDetailData = memberShipFeeMgmtRestSQLMapper.selectMemberShipFeeMgmtDetail(club_fee_no);
		
		return  getClubFeeDetailData;
	}
	
}
