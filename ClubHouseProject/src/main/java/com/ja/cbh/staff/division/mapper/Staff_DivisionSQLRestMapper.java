package com.ja.cbh.staff.division.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public interface Staff_DivisionSQLRestMapper {

//공지구분	
	//공지구분 등록
	public void insertNotiDiv(HashMap<String, Object> pram);
	//공지구분 수정(전체)
	public void updateNotiDivByNotiDivNo(HashMap<String, Object> pram);
	//공지구분 사용여부 수정(삭제)
	public void updateNotiDivStateByNotiDivNo(HashMap<String, Object> pram);
	//공지구분리스트 호출
	public ArrayList<HashMap<String, Object>> selectNotiDivList();
	//공지구분리스트 개수 호출
	public int selectCountNotiDiv();

	
//봉사구분	
	//봉사구분 등록
	public void insertVlntrDiv(HashMap<String, Object> pram);
	//봉사구분 수정(전체)
	public void updateVlntrDivByVlntrDivNo(HashMap<String, Object> pram);
	//봉사구분 사용여부 수정(삭제)
	public void updateVlntrDivStateByVlntrDivNo(HashMap<String, Object> pram);
	//봉사구분리스트 호출
	public ArrayList<HashMap<String, Object>> selectVlntrDivList();
	//봉사구분리스트 개수 호출
	public int selectCountVlntrDiv();

	
//직책구분	
	//직책구분 등록
	public void insertPstnDiv(HashMap<String, Object> pram);
	//직책구분 수정(전체)
	public void updatePstnDivByPstnDivNo(HashMap<String, Object> pram);
	//직책구분 사용여부 수정(삭제)
	public void updatePstnDivStateByPstnDivNo(HashMap<String, Object> pram);
	//직책구분리스트 호출
	public ArrayList<HashMap<String, Object>> selectPstnDivList();
	//직책구분리스트 개수 호출
	public int selectCountPstnDiv();
	

//결재구분	
	//결재구분 등록
	public void insertApvDiv(HashMap<String, Object> pram);
	//결재구분 수정(전체)
	public void updateApvDivByApvDivNo(HashMap<String, Object> pram);
	//결재구분 사용여부 수정(삭제)
	public void updateApvDivStateByApvDivNo(HashMap<String, Object> pram);
	//결재구분리스트 호출
	public ArrayList<HashMap<String, Object>> selectApvDivList();
	//결재구분리스트 개수 호출
	public int selectCountApvDiv();
	//결재양식 호출
	public Object selectApvDivFormByApvDivNo(String NO);
	//결재양식 등록
	public void updateApvDivFormByApvDivNo(HashMap<String, Object> pram);
//알람구분
	//알람구분 등록
	public void insertAlarmDiv(HashMap<String, Object> pram);
	//알람구분 수정(전체)
	public void updateAlarmDivByAlarmDivNo(HashMap<String, Object> pram);
	//알람구분 사용여부 수정(삭제)
	public void updateAlarmDivStateByAlarmDivNo(HashMap<String, Object> pram);
	//알람구분리스트 호출
	public ArrayList<HashMap<String, Object>> selectAlarmDivList();
	//알람구분리스트 개수 호출
	public int selectCountAlarmDiv();

	
//동아리구분	
	//동아리구분 등록
	public void insertClubDivision(HashMap<String, Object> pram);
	//동아리구분 수정(전체)
	public void updateClubDivisionByClubDivisionNo(HashMap<String, Object> pram);
	//동아리구분 사용여부 수정(삭제)
	public void updateClubDivisionStateByClubDivisionNo(HashMap<String, Object> pram);
	//동아리구분리스트 호출
	public ArrayList<HashMap<String, Object>> selectClubDivisionList();
	//동아리구분리스트 개수 호출
	public int selectCountClubDivision();

	
//동아리카테고리구분	
	//동아리카테고리구분 등록
	public void insertClubDeptCategory(HashMap<String, Object> pram);
	//동아리카테고리구분 수정(전체)
	public void updateClubDeptCategoryByClubDeptCategoryNo(HashMap<String, Object> pram);
	//동아리카테고리구분 사용여부 수정(삭제)
	public void updateClubDeptCategoryStateByClubDeptCategoryNo(HashMap<String, Object> pram);
	//동아리카테리고리구분 호출
	public ArrayList<HashMap<String, Object>> selectClubDeptCategoryList();
	//동아리카테고리구분 개수 호출
	public int selectCountDeptCategory();
}
