package com.ja.cbh.staff.volunteer.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ja.cbh.staff.volunteer.mapper.Staff_VlntrSQLMapper;
import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.VlntrNotiVO;

@Service
public class Staff_VlntrService {

	@Autowired
	private Staff_VlntrSQLMapper staff_VlntrSQLMapper;
	
	public void inputVltrNoti(VlntrNotiVO param) {
		
		staff_VlntrSQLMapper.insertVltrNotiByVo(param);
	}
	
	public ArrayList<HashMap<String, Object>> getVlntrNoti(String searchType, String searchWord,int pageNum){
		
		ArrayList<HashMap<String, Object>> vlntrNotiList = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<VlntrNotiVO> VlntrNotiList = 
				staff_VlntrSQLMapper.selectVlntrNotiByStSwPn(searchType, searchWord, pageNum);
		
		for(VlntrNotiVO vlntrNotiVO : VlntrNotiList) {
			
			Date now = new Date();
			
			if(vlntrNotiVO.getVlntr_appl_count() == vlntrNotiVO.getVlntr_fixed_people() || now.after(vlntrNotiVO.getVlntr_end_date())) {
				int vlntr_noti_no = vlntrNotiVO.getVlntr_noti_no();
				staff_VlntrSQLMapper.updateVlntrNotiByVlntrNotiNo(vlntr_noti_no);
			}
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("vlntrNotiVO", vlntrNotiVO);
			vlntrNotiList.add(map);
				
			}
	
		return vlntrNotiList;
	}
	
	public int getvlntrNotiCount(String searchType, String searchWord) {
		
		return staff_VlntrSQLMapper.selectVlntrNotiCountByStSw(searchType, searchWord);
	}
	
	public void modifyVlntrNoti(VlntrNotiVO param) {
		
		staff_VlntrSQLMapper.updateVlntrNotiByVlntrNotiVo(param);
	}
	
	public void deleteVlntrNoti(int vlntr_noti_no) {
		
		staff_VlntrSQLMapper.deleteVlntrNotiByVlntrNotiNo(vlntr_noti_no);
	}
	
	public void modifyVlntrNotiState(int vlntr_noti_no) {
		
		staff_VlntrSQLMapper.updateVlntrNotiByVlntrNotiNo(vlntr_noti_no);
	}
	
	public ArrayList<HashMap<String, Object>> getClubStudInfo(String club_no , String stud_name , String stud_id, int pageNum){
		
		ArrayList<HashMap<String, Object>> clubStudList = staff_VlntrSQLMapper.selectClubStudInfoByStSwPn(club_no, stud_name, stud_id, pageNum);
	
		return clubStudList;
	}
	
	public int getClubStudCount(String club_no , String stud_name , String stud_id) {
		
		return staff_VlntrSQLMapper.selectClubStudCountByCnSnSi(club_no, stud_name, stud_id);
	}
	
	public ArrayList<ClubVO> getClubList(){
		
		ArrayList<ClubVO> clubList = staff_VlntrSQLMapper.selectClubList();
		
		return clubList;
	}
	
	public void modifyStudVlntrTime(String stud_id, int vlntrActivityTime) {
		
		staff_VlntrSQLMapper.updateStudVlntrTimeByStudIdAndVAT(stud_id, vlntrActivityTime);
	}
	
	
	
}
