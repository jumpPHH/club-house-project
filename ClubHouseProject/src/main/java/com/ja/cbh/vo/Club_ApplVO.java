package com.ja.cbh.vo;

import java.util.Date;

public class Club_ApplVO {
	
	private int club_appl_no; //동아리 신청 (기본키)
	private String stud_id; //동아리 신청자 (외부키)
	private String club_name; //동아리 이름
	private int club_appl_people_count; //동아리 신청 회원수
	private String club_purpose; //동아리 설립 및 목적
	private Date club_appl_date; //동아리 신청일자
	private String club_appl_state;
	private int club_category_no;
	public Club_ApplVO() {
		super();
	}
	public Club_ApplVO(int club_appl_no, String stud_id, String club_name, int club_appl_people_count,
			String club_purpose, Date club_appl_date, String club_appl_state, int club_category_no) {
		super();
		this.club_appl_no = club_appl_no;
		this.stud_id = stud_id;
		this.club_name = club_name;
		this.club_appl_people_count = club_appl_people_count;
		this.club_purpose = club_purpose;
		this.club_appl_date = club_appl_date;
		this.club_appl_state = club_appl_state;
		this.club_category_no = club_category_no;
	}
	public int getClub_appl_no() {
		return club_appl_no;
	}
	public void setClub_appl_no(int club_appl_no) {
		this.club_appl_no = club_appl_no;
	}
	public String getStud_id() {
		return stud_id;
	}
	public void setStud_id(String stud_id) {
		this.stud_id = stud_id;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public int getClub_appl_people_count() {
		return club_appl_people_count;
	}
	public void setClub_appl_people_count(int club_appl_people_count) {
		this.club_appl_people_count = club_appl_people_count;
	}
	public String getClub_purpose() {
		return club_purpose;
	}
	public void setClub_purpose(String club_purpose) {
		this.club_purpose = club_purpose;
	}
	public Date getClub_appl_date() {
		return club_appl_date;
	}
	public void setClub_appl_date(Date club_appl_date) {
		this.club_appl_date = club_appl_date;
	}
	public String getClub_appl_state() {
		return club_appl_state;
	}
	public void setClub_appl_state(String club_appl_state) {
		this.club_appl_state = club_appl_state;
	}
	public int getClub_category_no() {
		return club_category_no;
	}
	public void setClub_category_no(int club_category_no) {
		this.club_category_no = club_category_no;
	}

	
	
	}
