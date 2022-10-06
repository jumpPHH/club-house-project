package com.ja.cbh.student.volunteer.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.volunteer.mapper.Student_VlntrSQLMapper;
import com.ja.cbh.vo.VlntrDivVO;
import com.ja.cbh.vo.VlntrNotiVO;

@Service
public class Student_VlntrService {
	
	@Autowired
	private Student_VlntrSQLMapper student_VlntrSQLMapper;
	
	public HashMap<String, Object> getVlntrNoti(int vlntr_noti_no) {
	
		HashMap<String, Object> vlntrMap = new HashMap<String, Object>();
		
		VlntrNotiVO vlntrNotiVo = student_VlntrSQLMapper.selectVlntrNotiByVlntrNo(vlntr_noti_no);
		int vlntr_div_no = vlntrNotiVo.getVlntr_div_no();
		
		VlntrDivVO vlntrDivVo = student_VlntrSQLMapper.selectVlntrDivNameByVlntrDivNo(vlntr_div_no);
		vlntrMap.put("vlntrDivVo", vlntrDivVo);
		vlntrMap.put("vlntrNotiVo", vlntrNotiVo);
		
		return vlntrMap; 
	}
	
	public void modifyVlntrNoti(VlntrNotiVO vlntrNotiVo) {
		
		student_VlntrSQLMapper.updateVlntrNotiByVlntr(vlntrNotiVo);
	}
	
	public void inputVlntrAppl(int vlntr_noti_no, String stud_id) {
		
		student_VlntrSQLMapper.insertVlntrAppleByVlntrNotiNoAndStudId(vlntr_noti_no, stud_id);
	}
	
	public HashMap<String, Object> getMyVlntrAppleCount(int vlntr_noti_no, String stud_id) {
		
		HashMap<String, Object> myApplExist = new HashMap<String, Object>(); 
		int myVlntrAppleCount = student_VlntrSQLMapper.selectVlntrApplStudIdByVlntrDivNo(vlntr_noti_no, stud_id);
		
		myApplExist.put("myVlntrAppleCount", myVlntrAppleCount);
		
		return myApplExist;
	}

	public void deleteMyVlntrAppl(int vlntr_noti_no, String stud_id) {
		
		student_VlntrSQLMapper.deleteVlntrApplByVlntrNotiNoAndStudId(vlntr_noti_no, stud_id);
	}

	public void modifyVlntrNotiApplCount(int vlntr_noti_no) {
		student_VlntrSQLMapper.updateVlntrNotiApplCount(vlntr_noti_no);
		
	}
	
}
