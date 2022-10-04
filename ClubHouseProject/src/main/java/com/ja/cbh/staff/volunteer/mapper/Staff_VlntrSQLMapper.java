package com.ja.cbh.staff.volunteer.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.VlntrNotiVO;

public interface Staff_VlntrSQLMapper {

	public void insertVltrNotiByVo(VlntrNotiVO param);
	
	public ArrayList<VlntrNotiVO> selectVlntrNotiByStSwPn(
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord,
			@Param("pageNum") int pageNum);
	
	public int selectVlntrNotiCountByStSw(
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord);
	
	public void updateVlntrNotiByVlntrNotiNo(int vlntr_noti_no);
	
	public void updateVlntrNotiByVlntrNotiVo(VlntrNotiVO param);
	
	public void deleteVlntrNotiByVlntrNotiNo(int vlntr_noti_no);
	
	public ArrayList<HashMap<String, Object>> selectClubStudInfoByStSwPn(
			@Param("club_no") String club_no, 
			@Param("stud_name") String stud_name,
			@Param("stud_id") String stud_id,
			@Param("pageNum") int pageNum);
	
	public int selectClubStudCountByCnSnSi(
			@Param("club_no") String club_no, 
			@Param("stud_name") String stud_name,
			@Param("stud_id") String stud_id
			);
	
	public ArrayList<ClubVO> selectClubList();
	
	public void updateStudVlntrTimeByStudIdAndVAT(
			@Param("stud_id") String stud_id,
			@Param("vlntrActivityTime") int vlntrActivityTime
			);
	
//	public StudVO selectStudInfoByStudId(String studId);
//	
//	public ClubVO selectClubInfoByStudId(String studId);
}
