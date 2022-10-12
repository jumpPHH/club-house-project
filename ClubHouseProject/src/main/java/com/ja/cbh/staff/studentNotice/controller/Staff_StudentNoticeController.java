package com.ja.cbh.staff.studentNotice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.cbh.staff.studentNotice.service.Staff_StudentNoticeService;
import com.ja.cbh.vo.NoticeVO;
import com.ja.cbh.vo.StaffVO;


@Controller
@RequestMapping("/staff/studentNotice/*")
public class Staff_StudentNoticeController {
	
	@Autowired
	private Staff_StudentNoticeService staff_StudentNoticeService;
	
	//공지 메인페이지
	@RequestMapping("staff_StudentNoticePage")
	public String staff_StudentNoticePage(Model model, @RequestParam (value="noti_div_no", defaultValue="1")int noti_div_no, String searchWord, @RequestParam(value ="pageNum",defaultValue="1")int pageNum){
		
		ArrayList<HashMap<String, Object>> noticeDataList = staff_StudentNoticeService.getNoticeDataList(noti_div_no, searchWord, pageNum);
		
		model.addAttribute("noticeDataList", noticeDataList);
		
		int noticeCount = staff_StudentNoticeService.getNoticeCount(noti_div_no, searchWord);
		int totalPageCount = (int)Math.ceil(noticeCount/15.0);
		int startPage = ((pageNum-1)/5)*5+1;
		int endPage = ((pageNum-1)/5+1)*5; 
		
		if(endPage >= totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("totalPageCount" , totalPageCount);
		model.addAttribute("startPage" , startPage);
		model.addAttribute("endPage" , endPage);
		model.addAttribute("currentPageNum" , pageNum);
		
		String additionalParam = "";
		if((noti_div_no == 1 || noti_div_no == 2) && searchWord != null) {
		additionalParam += "&notiDiv=" + noti_div_no;
		additionalParam += "&searchWord=" + searchWord;
		
		}else if((noti_div_no != 1 && noti_div_no != 2) || searchWord == null) {
			additionalParam += "&notiDiv"; 
			additionalParam += "&searchWord";	
		}
		model.addAttribute("additionalParam" , additionalParam);

		return "staff/studentNotice/staff_StudentNoticePage";
	}
	
	//공지 작성 페이지
	@RequestMapping("writeNoticePage")
	public String writeNoticePage() {
		
		return "staff/studentNotice/writeNoticePage";
	}
	
	@RequestMapping("writeNoticeProcess")
	public String writeNoticeProcess(NoticeVO param, HttpSession session) {
		
		StaffVO sessionUser = (StaffVO)session.getAttribute("sessionUserInfo");
		String staff_id = sessionUser.getStaff_id();
		
		param.setStaff_id(staff_id);
		
		staff_StudentNoticeService.writeNotice(param);
		//System.out.println(sessionUser.getStaff_id());
		
		return "redirect:./staff_StudentNoticePage";
	}
	
	//공지 상세페이지
	@RequestMapping("readNoticePage")
	public String readNoticePage(Model model, int noticeNo) {
		
		staff_StudentNoticeService.increaseCount(noticeNo);
		HashMap<String, Object> notiData = staff_StudentNoticeService.getNoticeData(noticeNo);
		
		NoticeVO noticeVO = (NoticeVO)notiData.get("noticeVO");
		String content = noticeVO.getNoti_content();
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll(" ", "&nbsp");
		content = content.replaceAll("\n", "<br>");
		noticeVO.setNoti_content(content);
		
		model.addAttribute("notiData", notiData);
		
		return "staff/studentNotice/readNoticePage";
	}
	
	//공지상세 페이지 내에서 삭제
	@RequestMapping("deleteNoticeProcess")  //-> ajax로 버튼도 추가 할까함 시간없음 말구
	public String deleteNoticeProcess(int notice_no) {
		staff_StudentNoticeService.deleteByNo(notice_no);
		return "redirect:./staff_StudentNoticePage";
	}
	
	//공지 수정
	@RequestMapping("updateContentPage")
	public String updateContentPage(Model model , int notice_no) {
		HashMap<String, Object> data = staff_StudentNoticeService.getNoticeData(notice_no);
		
		model.addAttribute("data", data);
		return "staff/studentNotice/updateContentPage";
	}
	
	@RequestMapping("updateContentProcess")
	public String updateContentProcess(NoticeVO noticeVO) {
		staff_StudentNoticeService.updateDivTilteAndContent(noticeVO);
		return "redirect:./staff_StudentNoticePage";
	}
	
	@RequestMapping("noticeSearchProcess")
	public String noticeSearchProcess(int noti_div_no, String searchWord) {
		
		return "staff/studentNotice/staff_StudentNoticePage";
	}
}
