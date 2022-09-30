package com.ja.cbh.vo;

import java.util.Date;

public class Club_NotiVO {
	
	// 필드 (클래스 필드부분)
	private int noti_no; // 공지사항 번호
	private int noti_div_no; // 공지사항 구분넘버
	private String staff_id; // 행정직원 아이디
	private String noti_title; // 공지사항 제목
	private String noti_content; // 공지사항 내용
	private Date noti_date; // 공지사항 작성일
	private int noti_readcount; // 공지사항 조회수
	
	public Club_NotiVO() {
		super();
	}

	public Club_NotiVO(int noti_no, int noti_div_no, String staff_id, String noti_title, String noti_content,
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
