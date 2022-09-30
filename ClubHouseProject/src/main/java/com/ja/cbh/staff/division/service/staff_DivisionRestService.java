package com.ja.cbh.staff.division.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.division.mapper.Staff_DivisionSQLRestMapper;

@Service
public class staff_DivisionRestService {

	@Autowired
	private Staff_DivisionSQLRestMapper staff_DivisionSQLRestMapper;
	
	public void inputDivision(HashMap<String, Object> pram) {
		if(pram.get("TABLE").equals("공지")) {
			staff_DivisionSQLRestMapper.insertNotiDiv(pram);
		}else if(pram.get("TABLE").equals("봉사")) {
			staff_DivisionSQLRestMapper.insertVlntrDiv(pram);
		}else if(pram.get("TABLE").equals("직책")) {
			staff_DivisionSQLRestMapper.insertPstnDiv(pram);
		}else if(pram.get("TABLE").equals("결재")) {
			staff_DivisionSQLRestMapper.insertApvDiv(pram);
		}else if(pram.get("TABLE").equals("알람")) {
			staff_DivisionSQLRestMapper.insertAlarmDiv(pram);
		}else if(pram.get("TABLE").equals("동아리")) {
			staff_DivisionSQLRestMapper.insertClubDivision(pram);
		}else if(pram.get("TABLE").equals("동아리카테고리")) {
			staff_DivisionSQLRestMapper.insertClubDeptCategory(pram);
		}
		
	}

	public void modifyDivision(HashMap<String, Object> pram) {
	
		if(pram.get("TABLE").equals("공지")) {
			staff_DivisionSQLRestMapper.updateNotiDivByNotiDivNo(pram);
		}else if(pram.get("TABLE").equals("봉사")) {
			staff_DivisionSQLRestMapper.updateVlntrDivByVlntrDivNo(pram);
		}else if(pram.get("TABLE").equals("직책")) {
			staff_DivisionSQLRestMapper.updatePstnDivByPstnDivNo(pram);
		}else if(pram.get("TABLE").equals("결재")) {
			staff_DivisionSQLRestMapper.updateApvDivByApvDivNo(pram);
		}else if(pram.get("TABLE").equals("알람")) {
			staff_DivisionSQLRestMapper.updateAlarmDivByAlarmDivNo(pram);
		}else if(pram.get("TABLE").equals("동아리")) {
			staff_DivisionSQLRestMapper.updateClubDivisionByClubDivisionNo(pram);
		}else if(pram.get("TABLE").equals("동아리카테고리")) {
			staff_DivisionSQLRestMapper.updateClubDeptCategoryByClubDeptCategoryNo(pram);
		}
	}

	
	
	public void deleteDivision(HashMap<String, Object> pram) {
		
		if(pram.get("TABLE").equals("공지")) {
			staff_DivisionSQLRestMapper.updateNotiDivStateByNotiDivNo(pram);
		}else if(pram.get("TABLE").equals("봉사")) {
			staff_DivisionSQLRestMapper.updateVlntrDivStateByVlntrDivNo(pram);
		}else if(pram.get("TABLE").equals("직책")) {
			staff_DivisionSQLRestMapper.updatePstnDivStateByPstnDivNo(pram);
		}else if(pram.get("TABLE").equals("결재")) {
			staff_DivisionSQLRestMapper.updateApvDivStateByApvDivNo(pram);
		}else if(pram.get("TABLE").equals("알람")) {
			staff_DivisionSQLRestMapper.updateAlarmDivStateByAlarmDivNo(pram);
		}else if(pram.get("TABLE").equals("동아리")) {
			staff_DivisionSQLRestMapper.updateClubDivisionStateByClubDivisionNo(pram);
		}else if(pram.get("TABLE").equals("동아리카테고리")) {
			staff_DivisionSQLRestMapper.updateClubDeptCategoryStateByClubDeptCategoryNo(pram);
		}
		
	}

	public ArrayList<HashMap<String, Object>> getDivisionList(String table){
		
		if(table.equals("공지")) {
			return staff_DivisionSQLRestMapper.selectNotiDivList();
		}else if(table.equals("봉사")) {
			return staff_DivisionSQLRestMapper.selectVlntrDivList();
		}else if(table.equals("직책")) {
			return staff_DivisionSQLRestMapper.selectPstnDivList();
		}else if(table.equals("결재")) {
			return staff_DivisionSQLRestMapper.selectApvDivList();
		}else if(table.equals("알람")) {
			return staff_DivisionSQLRestMapper.selectAlarmDivList();
		}else if(table.equals("동아리")) {
			return staff_DivisionSQLRestMapper.selectClubDivisionList();
		}else if(table.equals("동아리카테고리")) {
			return staff_DivisionSQLRestMapper.selectClubDeptCategoryList();
		}
		return staff_DivisionSQLRestMapper.selectClubDeptCategoryList();
	}
	
	public int getCountDivision(String table) {
		if(table.equals("공지")) {
			return staff_DivisionSQLRestMapper.selectCountNotiDiv();
		}else if(table.equals("봉사")) {
			return staff_DivisionSQLRestMapper.selectCountVlntrDiv();
		}else if(table.equals("직책")) {
			return staff_DivisionSQLRestMapper.selectCountPstnDiv();
		}else if(table.equals("결재")) {
			return staff_DivisionSQLRestMapper.selectCountApvDiv();
		}else if(table.equals("알람")) {
			return staff_DivisionSQLRestMapper.selectCountAlarmDiv();
		}else if(table.equals("동아리")) {
			return staff_DivisionSQLRestMapper.selectCountClubDivision();
		}else if(table.equals("동아리카테고리")) {
			return staff_DivisionSQLRestMapper.selectCountDeptCategory();
		}
		return 0;
	}

	public String getApvForm(String No){
		Object ApvForm = staff_DivisionSQLRestMapper.selectApvDivFormByApvDivNo(No);
		String parsingContent = new String();
			
		if((Clob)ApvForm != null) {
			try {
				parsingContent = clobToString((Clob)ApvForm);
			} catch (Exception e) {
				System.out.println(e);
			}
			}
		return parsingContent;
	}

	public void modifyApvForm(HashMap<String, Object> param) {
		staff_DivisionSQLRestMapper.updateApvDivFormByApvDivNo(param);
	}
	
	private static String clobToString(Clob clob) throws IOException, SQLException{
	    String result = new String();
	    if (clob.length() != 0){
	        StringBuffer strBuffer = new StringBuffer();
	        BufferedReader reader = new BufferedReader(clob.getCharacterStream());
	        while ((result = reader.readLine()) != null){
	            strBuffer.append(result);
	        }
	        result = strBuffer.toString();
	    }
	    return result;
	}
}