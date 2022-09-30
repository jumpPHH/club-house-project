package com.ja.cbh.staff.division.mapper;

import java.util.ArrayList;
import java.util.HashMap;

public interface Staff_DivisionSQLMapper {

	public ArrayList<HashMap<String, Object>> selectNotiDiv();
	
	public int selectCountNotiDiv();
}
