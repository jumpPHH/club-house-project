package com.ja.cbh.staff.clubExpense.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.clubExpense.mapper.staff_ClubExpenseRestSQLMapper;

@Service
public class staff_ClubExpenseRestService {

	@Autowired
	private staff_ClubExpenseRestSQLMapper staff_ClubExpenseRestSQLMapper;
	
	
	public ArrayList<HashMap<String, Object>> getClubExpenseApplyList(HashMap<String, Object> param){
		
		return staff_ClubExpenseRestSQLMapper.selectClubExpnsApplyList(param);
	}
	
	
	public HashMap<String, Object> getClubExpenseApplyByClubExpnsApplyNo(int No){
		
		return staff_ClubExpenseRestSQLMapper.selectClubExpnsApplyByClubExpnsApplyNo(No);
	}

	public void modifyClubExpnsApplyStateByClubExpnsApplyNo(HashMap<String, Object> param) {
		staff_ClubExpenseRestSQLMapper.updateClubExpnsApplyStateByClubExpnsApplyNo(param);
	}
}
