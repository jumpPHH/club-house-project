package com.ja.cbh.staff.approval.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ja.cbh.staff.approval.service.staff_ApprovalService;
import com.ja.cbh.vo.StaffVO;

@Controller
@RequestMapping("/staff/approval/*")
public class staff_ApprovalController {

	@Autowired
	private staff_ApprovalService staff_ApprovalService;
	
	@RequestMapping("staff_WriteDraftPage")
	public String writeDraftPage (Model model, HttpSession session) {
		StaffVO staffVO = (StaffVO)session.getAttribute("sessionUserInfo");
		model.addAttribute("staffVO", staffVO);
		model.addAttribute("ApvDiv", staff_ApprovalService.getApvDivList());
		model.addAttribute("Staff", staff_ApprovalService.getStaffList());
		
		return "/staff/approval/staff_WriteDraftPage";
	}
	
	@RequestMapping("staff_DraftManagementPage")
	public String staff_DraftManagementPage() {
		return "/staff/approval/staff_DraftManagementPage";
	}
	
	@RequestMapping("WriteDtaftProcess")
	public String WriteDtaftProcess(
			int APV_DIV_NO,
			String APV_TITLE,
			String APV_CONTENT,
			String STAFF_MID_ID,
			String STAFF_FNL_ID,
			MultipartFile [] FILES, 
			HttpSession session) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		HashMap<String, Object> fileParam = new HashMap<String, Object>();
		
		StaffVO staffVO = (StaffVO)session.getAttribute("sessionUserInfo");
		String APV_NO = staff_ApprovalService.createApvPk();
		param.put("APV_NO", APV_NO);
		param.put("APV_DIV_NO", APV_DIV_NO);
		param.put("STAFF_ID", staffVO.getStaff_id());
		param.put("APV_TITLE", APV_TITLE);
		param.put("APV_CONTENT", APV_CONTENT);
		param.put("STAFF_MID_ID", STAFF_MID_ID);
		param.put("STAFF_FNL_ID", STAFF_FNL_ID);
		staff_ApprovalService.inputApv(param);

			for(MultipartFile file : FILES) {
			if(file.isEmpty()) {
					continue;
			}
			String rootFilePath = "C:/uploadFiles/";
			String getOriginalFilename= file.getOriginalFilename();
			
			//저장할때 파일명을 중복배제 해야된다.
			//랜덤네임 + 시간 = 파일명 만듦.
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			
			String ext = getOriginalFilename.substring(getOriginalFilename.lastIndexOf("."));
			randomName += ext;
			
			//오늘 날짜 기준으로 폴더 생성
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayFolderName = sdf.format(today);
			
			
			File todayFolder = new File(rootFilePath+ todayFolderName);
			if(!todayFolder.exists()) {
				todayFolder.mkdirs();
			}
			
			try {
				//실질적 저장 API
				file.transferTo(new File(rootFilePath + todayFolderName + randomName));
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			fileParam.put("APV_NO", APV_NO);
			fileParam.put("APV_ATTACH_FILE_NAME", getOriginalFilename);
			fileParam.put("APV_ATTACH_FILE_LINK", todayFolderName + randomName);
			
			staff_ApprovalService.inputApvAttachFile(fileParam);
			}
		
		
		return "redirect: ./staff_WriteDraftPage";
	}
	

}
