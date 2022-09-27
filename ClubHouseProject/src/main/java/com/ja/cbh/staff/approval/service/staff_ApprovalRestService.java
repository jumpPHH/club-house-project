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
		
		for(HashMap<String, Object> map : MyApvList) {
			
			if(map.get("APV_CONTENT") != null) {
			Clob Content = (Clob)map.get("APV_CONTENT");
			try {
				String parsingContent = clobToString(Content);
				map.put("APV_CONTENT", parsingContent);
			} catch (Exception e) {
				System.out.println(e);
			}
	
			}
		}
		
		
		
		return MyApvList;
	}
	
	public ArrayList<HashMap<String, Object>> getRequestedApvList(HashMap<String, Object> param){
		ArrayList<HashMap<String, Object>> RequestedApvList = staff_ApprovalRestSQLMapper.selectApvByStaffMidIdAndStaffFnlId(param);
		for(HashMap<String, Object> map : RequestedApvList) {
			
			if(map.get("APV_CONTENT") != null) {
			Clob Content = (Clob)map.get("APV_CONTENT");
			try {
				String parsingContent = clobToString(Content);
				map.put("APV_CONTENT", parsingContent);
			} catch (Exception e) {
				System.out.println(e);
			}
			}
			
		}
		
		
		
		return RequestedApvList;
	}
	
	public HashMap<String, Object> getApv(String APV_NO){
		HashMap<String, Object> Apv = staff_ApprovalRestSQLMapper.selectApvByApvNo(APV_NO);
		
		if(Apv.get("APV_CONTENT") !=null) {
		Clob Content = (Clob)Apv.get("APV_CONTENT");
		try {
			String parsingContent = clobToString(Content);
			Apv.put("APV_CONTENT", parsingContent);
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
	
	public String getApvDivForm(String NAME){
		String ApvDivForm = new String(); 
		HashMap<String, Object> FormMap = staff_ApprovalRestSQLMapper.selectApvDivFormByApvDivName(NAME);
		
		if(FormMap.get("APV_DIV_FORM") != null) {
		Clob Form = (Clob)FormMap.get("APV_DIV_FORM");
		try {
			ApvDivForm = clobToString(Form);
		} catch (Exception e) {
			System.out.println(e);
		}
		}
		return ApvDivForm;
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
