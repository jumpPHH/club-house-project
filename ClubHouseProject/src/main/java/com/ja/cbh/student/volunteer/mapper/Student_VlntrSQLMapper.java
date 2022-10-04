package com.ja.cbh.student.volunteer.mapper;

import org.apache.ibatis.annotations.Param;

import com.ja.cbh.vo.VlntrDivVO;
import com.ja.cbh.vo.VlntrNotiVO;

public interface Student_VlntrSQLMapper {


	public VlntrNotiVO selectVlntrNotiByVlntrNo(int vlntr_noti_no);
	
	public VlntrDivVO selectVlntrDivNameByVlntrDivNo(int vlntr_div_no);
	
	public void updateVlntrNotiByVlntr(VlntrNotiVO vlntrNotiVo);
	
	public void insertVlntrAppleByVlntrNotiNoAndStudId(@Param("vlntr_noti_no")int vlntr_noti_no, @Param("stud_id")String stud_id);
	
	public int selectVlntrApplStudIdByVlntrDivNo(@Param("vlntr_noti_no")int vlntr_noti_no, @Param("stud_id")String stud_id);
	
	public void deleteVlntrApplByVlntrNotiNoAndStudId(@Param("vlntr_noti_no")int vlntr_noti_no, @Param("stud_id")String stud_id);
	
	public void updateVlntrNotiApplCount(int vlntr_noti_no);
}
