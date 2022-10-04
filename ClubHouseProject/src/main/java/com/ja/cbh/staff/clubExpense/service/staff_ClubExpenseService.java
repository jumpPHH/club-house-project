package com.ja.cbh.staff.clubExpense.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.clubExpense.mapper.staff_ClubExpenseSQLMapper;

@Service
public class staff_ClubExpenseService {

	@Autowired
	private staff_ClubExpenseSQLMapper staff_ClubExpenseSQLMapper;

	
	public ArrayList<HashMap<String, Object>> getClubExpenseApplyList(){
		
		return staff_ClubExpenseSQLMapper.selectClubExpnsApplyList();
	}


}
