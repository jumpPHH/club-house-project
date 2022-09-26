package com.ja.cbh.student.myclub.membershipfeemgmt.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.myclub.membershipfeemgmt.mapper.Student_MemberShipFeeMgmtRestSQLMapper;

@Service
public class Student_MemberShipFeeMgmtRestService {
	
	@Autowired
	private Student_MemberShipFeeMgmtRestSQLMapper memberShipFeeMgmtRestSQLMapper;
	
	public void inputMemberShipFeeMgmt(HashMap<String, Object> pram) {
		if(pram.get("TABLE").equals("회비내역관리")) {
			memberShipFeeMgmtRestSQLMapper.inputMemberShipFeeMgmt(pram);
		}
	}
	
	public ArrayList<HashMap<String, Object>> getMemberShipFeeMgmtList(String table){
			
			if(table.equals("회비내역관리")) {
				return memberShipFeeMgmtRestSQLMapper.selectMemberShipFeeMgmtList();
			}
			return null;
	}	
}
