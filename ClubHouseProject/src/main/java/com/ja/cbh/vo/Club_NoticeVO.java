package com.ja.cbh.vo;

import java.util.Date;

public class Club_NoticeVO {
	private int noti_no;
	private int noti_div_no;
	private String staff_id;
	private String noti_title;
	private String noti_content;
	private Date noti_date;
	private int noti_readcount;
	public Club_NoticeVO() {
		super();
	}
	public Club_NoticeVO(int noti_no, int noti_div_no, String staff_id, String noti_title, String noti_content,
			Date noti_date, int noti_readcount) {
		super();
		this.noti_no = noti_no;
		this.noti_div_no = noti_div_no;
		this.staff_id = staff_id;
		this.noti_title = noti_title;
		this.noti_content = noti_content;
		this.noti_date = noti_date;
		this.noti_readcount = noti_readcount;
	}
	public int getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(int noti_no) {
		this.noti_no = noti_no;
	}
	public int getNoti_div_no() {
		return noti_div_no;
	}
	public void setNoti_div_no(int noti_div_no) {
		this.noti_div_no = noti_div_no;
	}
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}
	public String getNoti_content() {
		return noti_content;
	}
	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}
	public Date getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(Date noti_date) {
		this.noti_date = noti_date;
	}
	public int getNoti_readcount() {
		return noti_readcount;
	}
	public void setNoti_readcount(int noti_readcount) {
		this.noti_readcount = noti_readcount;
	}
	
	
}
