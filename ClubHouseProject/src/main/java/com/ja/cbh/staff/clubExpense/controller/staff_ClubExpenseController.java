package com.ja.cbh.staff.clubExpense.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.staff.clubExpense.service.staff_ClubExpenseService;

@Controller
@RequestMapping("/staff/clubExpense/*")
public class staff_ClubExpenseController {

	@Autowired
	private staff_ClubExpenseService staff_ClubExpenseService;
	
	@RequestMapping("staff_ClubExpenseApplyListPage")
	public String clubExpenseApplyListPage(Model model) {
	
		model.addAttribute("data", staff_ClubExpenseService.getClubExpenseApplyList());
		return "/staff/clubExpense/staff_ClubExpenseApplyListPage";
	}
	
	
}
