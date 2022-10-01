package com.ja.cbh.staff.applyClub.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.cbh.staff.applyClub.service.Staff_ApplyClubService;
import com.ja.cbh.student.establishingclub.service.EstablishingClubServiceImpl;
import com.ja.cbh.vo.Club_ApplVO;

@Controller
@RequestMapping("/staff/applyClub/*")
public class Staff_ApplyClubController {
	
	@Autowired
	private Staff_ApplyClubService staff_ApplyClubService;
	
	
	@RequestMapping("staff_applyClubPage")
	public String applyClubPage(Model model, @RequestParam(value="applNo", defaultValue="1")int applNo) {
		ArrayList<HashMap<String, Object>> clubApplDataList = staff_ApplyClubService.getAllClubAppl();
		model.addAttribute("clubApplDataList", clubApplDataList);
		
		HashMap<String, Object> applData = staff_ApplyClubService.getApplData(applNo);
		
		Club_ApplVO applVO = (Club_ApplVO)applData.get("applVO");
		String content = applVO.getClub_purpose();
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll(" ", "&nbsp");
		content = content.replaceAll("\n", "<br>");
		applVO.setClub_purpose(content);
		
		model.addAttribute("applData", applData);
		
		return "staff/applyClub/staff_applyClubPage";
	}
	
	@RequestMapping("staff_readClubRequestPage")
	public String readClubRequest(Model model) {

		return "staff/applyClub/staff_readClubRequestPage";
	}
	
}
