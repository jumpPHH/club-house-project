package com.ja.cbh.student.myclubactivity.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.cbh.student.myclubactivity.service.Student_MyClubActivityServiceImpl;
import com.ja.cbh.vo.Club_ActVO;
import com.ja.cbh.vo.Club_StudVO;



@Controller
@RequestMapping("/student/myclubactivity/*")
public class Student_MyClubActivityController {
	
	@Autowired
	private Student_MyClubActivityServiceImpl student_MyClubActivityService;
	
	
	
	@RequestMapping("student_MyClubActivityWritePage")
	public String student_MyClubActivityWritePage() {
		
		return "student/myclubactivity/student_MyClubActivityWritePage";
	}

	@RequestMapping("student_MyClubActivityWritePageProcess")
	public String student_MyClubActivityWritePageProcess(Club_ActVO param , HttpSession session) {
		
		
		Club_StudVO sessionUser = (Club_StudVO)session.getAttribute("sessionUserInfo");
		int clubStudNo = sessionUser.getClub_stud_no();
		
		param.setClub_no(clubStudNo);
		
		student_MyClubActivityService.student_MyClubActivityWritePage(param);
		
		return "redirect:./student_MyClubActivityListPage";
	}
	
	
	
	@RequestMapping("student_MyClubActivityListPage")
	public String student_MyClubActivityListPage() {
		
		return "student/myclubactivity/student_MyClubActivityListPage";
	}
	
	@RequestMapping("student_MyClubActivityReadPage")
	public String student_MyClubActivityReadPage(int club_act_no ) {
		
		student_MyClubActivityService.increaseReadCount(club_act_no);
		HashMap<String, Object> data = student_MyClubActivityService.getMyClubActivityData(club_act_no);
		
		// HTML escape .. 특수문자 처리 <br> &nbsp;
				Club_ActVO club_ActVO = (Club_ActVO)data.get("club_ActVO");
				String content = club_ActVO.getClub_act_content();
				content = StringEscapeUtils.escapeHtml4(content);
				content = content.replaceAll(" ", "&nbsp;"); 
				content = content.replaceAll("\n", "<br>");
				club_ActVO.setClub_act_content(content);
		
		return "student/myclubactivity/student_MyClubActivityReadPage";
	}
	
	@RequestMapping("student_deleteMyClubActivityProcess")
	public String student_deleteMyClubActivityProcess(int club_act_no) {
		
		student_MyClubActivityService.deleteMyClubActivityByNo(club_act_no);
		
		return "redirect:student/myclubactivity/student_MyClubActivityListPage";
	}
	
	
	
}
