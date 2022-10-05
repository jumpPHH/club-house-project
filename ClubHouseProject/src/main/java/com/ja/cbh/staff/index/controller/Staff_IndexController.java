package com.ja.cbh.staff.index.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ja.cbh.staff.index.service.Staff_IndexServiece;
import com.ja.cbh.vo.StaffVO;

@Controller
@RequestMapping("/staff/index/*")
public class Staff_IndexController {

	@Autowired
	private Staff_IndexServiece staff_IndexServiece;
	
	@RequestMapping("staff_IndexPage")
	public String staff_IndexPage(Model model, HttpSession session) {
		
	StaffVO staffVO = (StaffVO)session.getAttribute("sessionUserInfo");
	String STAFF_ID = staffVO.getStaff_id();
	
	model.addAttribute("data", staff_IndexServiece.getIndexData(STAFF_ID));
		return "staff/index/staff_IndexPage";
	}
	

}
