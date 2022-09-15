package com.ja.cbh.staff.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/staff/approval/*")
public class staff_ApprovalController {

	@RequestMapping("staff_WriteDraftPage")
	public String writeDraftPage () {
		return "/staff/approval/staff_WriteDraftPage";
	}
}
