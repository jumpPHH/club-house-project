package com.ja.cbh.staff.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/staff/approval/*")
public class staff_ApprovalController {

	@RequestMapping("staff_WriteDraftPage")
	public String writeDraftPage () {
		return "/staff/approval/staff_WriteDraftPage";
	}
	
	@RequestMapping("test")
	public String test(String test, MultipartFile asdas) {
		System.out.println(test);
		System.out.println(asdas);
		return "redirect: ./staff_WriteDraftPage";
	}
}
