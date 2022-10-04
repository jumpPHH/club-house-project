package com.ja.cbh.staff.clubExpense.mapper;

import java.util.ArrayList;
import java.util.HashMap;

public interface staff_ClubExpenseRestSQLMapper {

	public ArrayList<HashMap<String, Object>> selectClubExpnsApplyList(HashMap<String, Object> param);
	
	public HashMap<String, Object> selectClubExpnsApplyByClubExpnsApplyNo(int NO);
	
	public void updateClubExpnsApplyStateByClubExpnsApplyNo(HashMap<String, Object> param);

}
