package com.ja.cbh.staff.approval.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.staff.approval.mapper.staff_ApprovalRestSQLMapper;

@Service
public class staff_ApprovalRestService {

	@Autowired
	private staff_ApprovalRestSQLMapper staff_ApprovalRestSQLMapper;
	
	public ArrayList<HashMap<String, Object>> getMyApvList(HashMap<String, Object> param){
		ArrayList<HashMap<String, Object>> MyApvList = staff_ApprovalRestSQLMapper.selectApvBystaffId(param);
		return MyApvList;
	}
	
	public ArrayList<HashMap<String, Object>> getRequestedApvList(HashMap<String, Object> param){
		ArrayList<HashMap<String, Object>> RequestedApvList = staff_ApprovalRestSQLMapper.selectApvByStaffMidIdAndStaffFnlId(param);
		return RequestedApvList;
	}
	
	public HashMap<String, Object> getApv(String APV_NO){
		HashMap<String, Object> Apv = staff_ApprovalRestSQLMapper.selectApvByApvNo(APV_NO);
		String ApvContent = new String();
		
		if((Clob)Apv.get("APV_CONTENT") != null) {
			try {
				ApvContent = clobToString((Clob)Apv.get("APV_CONTENT"));
				Apv.replace("APV_CONTENT", ApvContent);
			} catch (Exception e) {
				System.out.println(e);
			}
			}
		
		return Apv;
	}
	
	public void modifyApvRejectRsnAndRejectDate (HashMap<String, Object> param) {
		staff_ApprovalRestSQLMapper.updateApvRejectRsnAndApvRejectDateByApvNo(param);
	}
	
	public void modifyApvMidDate (HashMap<String, Object> param) {
		staff_ApprovalRestSQLMapper.updateApvMidDateByApvNo(param);
	}
	
	public void modifyApvFnlDate(HashMap<String, Object> param) {
		staff_ApprovalRestSQLMapper.updateApvFnlDateByApvNo(param);
	}
	
	public String getApvDivForm(int NO){
		String ApvDivForm = new String(); 
		Object ApvFormObj = staff_ApprovalRestSQLMapper.selectApvDivFormByApvDivName(NO);
		
		if((Clob)ApvFormObj != null) {
			try {
				ApvDivForm = clobToString((Clob)ApvFormObj);
			} catch (Exception e) {
				System.out.println(e);
			}
			}
		return ApvDivForm;
	}
	
	
	private static String clobToString(Clob clob) throws IOException, SQLException{
	    String result = new String();
	    System.out.println("여기");
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
