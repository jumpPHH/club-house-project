package com.ja.cbh.vo;

import java.util.Date;

public class NoticeVO {
	
	private int noti_no; //공지번호
	private int noti_div_no; // 공지구분 번호
	private String staff_id; // 작성자 학번
	private String noti_title; // 공지 제목
	private String noti_content; // 공지 내용
	private int noti_readcount; // 공지 조회수
	private Date noti_date; // 공지 작성일
	
	public NoticeVO() {
		super();
	}

	public NoticeVO(int noti_no, int noti_div_no, String staff_id, String noti_title, String noti_content,
			int noti_readcount, Date noti_date) {
		super();
		this.noti_no = noti_no;
		this.noti_div_no = noti_div_no;
		this.staff_id = staff_id;
		this.noti_title = noti_title;
		this.noti_content = noti_content;
		this.noti_readcount = noti_readcount;
		this.noti_date = noti_date;
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

	public int getNoti_readcount() {
		return noti_readcount;
	}

	public void setNoti_readcount(int noti_readcount) {
		this.noti_readcount = noti_readcount;
	}

	public Date getNoti_date() {
		return noti_date;
	}

	public void setNoti_date(Date noti_date) {
		this.noti_date = noti_date;
	}
	

}
