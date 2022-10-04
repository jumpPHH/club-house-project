package com.ja.cbh.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class VlntrApplVO {

	private int vlntr_appl_no;
	private String stud_id;
	private int vlntr_noti_no;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date vlntr_appl_date;
	public VlntrApplVO() {
		super();
	}
	public VlntrApplVO(int vlntr_appl_no, String stud_id, int vlntr_noti_no, Date vlntr_appl_date) {
		super();
		this.vlntr_appl_no = vlntr_appl_no;
		this.stud_id = stud_id;
		this.vlntr_noti_no = vlntr_noti_no;
		this.vlntr_appl_date = vlntr_appl_date;
	}
	public int getVlntr_appl_no() {
		return vlntr_appl_no;
	}
	public void setVlntr_appl_no(int vlntr_appl_no) {
		this.vlntr_appl_no = vlntr_appl_no;
	}
	public String getStud_id() {
		return stud_id;
	}
	public void setStud_id(String stud_id) {
		this.stud_id = stud_id;
	}
	public int getVlntr_noti_no() {
		return vlntr_noti_no;
	}
	public void setVlntr_noti_no(int vlntr_noti_no) {
		this.vlntr_noti_no = vlntr_noti_no;
	}
	public Date getVlntr_appl_date() {
		return vlntr_appl_date;
	}
	public void setVlntr_appl_date(Date vlntr_appl_date) {
		this.vlntr_appl_date = vlntr_appl_date;
	}
	
	
}
