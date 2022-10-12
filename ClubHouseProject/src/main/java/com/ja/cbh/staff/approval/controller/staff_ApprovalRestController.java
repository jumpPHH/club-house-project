package com.ja.cbh.staff.approval.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.cbh.staff.approval.service.staff_ApprovalRestService;
import com.ja.cbh.vo.StaffVO;

@RestController
@RequestMapping("/staff/restApproval/*")
public class staff_ApprovalRestController {

	@Autowired
	private staff_ApprovalRestService staff_ApprovalRestService;

	@RequestMapping("getMyApvList")
	public HashMap<String, Object> getApvList(String type,HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		StaffVO staffVO = (StaffVO)session.getAttribute("sessionUserInfo");
		param.put("TYPE", type);
		param.put("STAFF_ID", staffVO.getStaff_id());
		
		map.put("ApvList", staff_ApprovalRestService.getMyApvList(param));
			
		
		return map;
	}	
	
	@RequestMapping("getApv")
	public HashMap<String, Object> getApv(String APV_NO, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		StaffVO staffVO = (StaffVO)session.getAttribute("sessionUserInfo");
		
		map.put("Apv", staff_ApprovalRestService.getApv(APV_NO));
		map.put("staffVO", staffVO);
		return map;
	}
	
	@RequestMapping("getRequestedApvList")
	public HashMap<String, Object> getRequestedApvList(String type, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		StaffVO staffVO = (StaffVO)session.getAttribute("sessionUserInfo");
		param.put("TYPE", type);
		param.put("STAFF_ID", staffVO.getStaff_id());
		
		map.put("staffVO", staffVO);
		map.put("ApvList", staff_ApprovalRestService.getRequestedApvList(param));
		
		return map;
	}
	
	@RequestMapping("rejectProcess")
	public HashMap<String, Object> rejectProcess (String APV_NO, String CONTENT, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> param = new HashMap<String, Object>();
		StaffVO staffVO = (StaffVO)session.getAttribute("sessionUserInfo");
		
		param.put("APV_NO", APV_NO);
		param.put("CONTENT", CONTENT);
	
		staff_ApprovalRestService.modifyApvRejectRsnAndRejectDate(param);
		
		map.put("Apv", staff_ApprovalRestService.getApv(APV_NO));
		map.put("staffVO", staffVO);
		return map;
	}
	
	@RequestMapping("approvalProcess")
	public HashMap<String, Object> approvalProcess (String APV_NO, String division,HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> param = new HashMap<String, Object>();
		StaffVO staffVO = (StaffVO)session.getAttribute("sessionUserInfo");
		
		param.put("APV_NO", APV_NO);

		if(division.equals("FNL")) {
			staff_ApprovalRestService.modifyApvFnlDate(param);
		}else if(division.equals("MID")) {
			staff_ApprovalRestService.modifyApvMidDate(param);
		}
		
		map.put("Apv", staff_ApprovalRestService.getApv(APV_NO));
		map.put("staffVO", staffVO);
		return map;
	}
	@RequestMapping("getApvForm")
	public HashMap<String, Object> getApvForm(int NO){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("ApvDivForm", staff_ApprovalRestService.getApvDivForm(NO));
		return map;
	}
}
