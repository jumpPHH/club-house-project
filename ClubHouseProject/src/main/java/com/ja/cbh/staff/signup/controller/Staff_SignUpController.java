package com.ja.cbh.staff.signup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.staff.signup.service.Staff_SignUpService;
import com.ja.cbh.vo.StaffVO;

@Controller
@RequestMapping("/staff/signup/*")
public class Staff_SignUpController {

	@Autowired
	private Staff_SignUpService sigUpService;

	@RequestMapping("staff_SignUpPage")
	public String staff_SignUpPage() {
		
		return "staff/signup/staff_SignUpPage";
	}
	
	//회원가입할때 등록 세부 로직처리 
		@RequestMapping("staff_SignUpProcess")
		public String staff_SignUpProcess(StaffVO staffVO) {
					
			sigUpService.staff_SignUpRegister(staffVO);
			
			return "staff/signup/staff_SignUpCompletePage";
		} 
}
