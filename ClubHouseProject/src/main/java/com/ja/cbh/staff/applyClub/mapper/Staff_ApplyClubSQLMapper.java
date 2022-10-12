package com.ja.cbh.staff.applyClub.mapper;

import java.util.HashMap;

public interface Staff_ApplyClubSQLMapper {
	
	public void updateClubApplyStateByNo(HashMap<String, Object> param); 
	
	public int selectCount(String searchWord);
}
