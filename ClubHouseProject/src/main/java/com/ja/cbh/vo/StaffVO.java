package com.ja.cbh.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class StaffVO {
	
	private String staff_id; //직원 아이디 (기본키)
	private int pstn_div_no; //직책 구분 넘버 (외부키)
	private String staff_name; //이름
	private String staff_pw; //패스워드
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date staff_join_date; //직원 입사일
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date staff_rsgnt_date; //직원 퇴사일
	
	private String staff_state; //직원 상태

	public StaffVO() {
		super();
	}

	public StaffVO(String staff_id, int pstn_div_no, String staff_name, String staff_pw, Date staff_join_date,
			Date staff_rsgnt_date, String staff_state) {
		super();
		this.staff_id = staff_id;
		this.pstn_div_no = pstn_div_no;
		this.staff_name = staff_name;
		this.staff_pw = staff_pw;
		this.staff_join_date = staff_join_date;
		this.staff_rsgnt_date = staff_rsgnt_date;
		this.staff_state = staff_state;
	}

	public String getStaff_id() {
		return staff_id;
	}

	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}

	public int getPstn_div_no() {
		return pstn_div_no;
	}

	public void setPstn_div_no(int pstn_div_no) {
		this.pstn_div_no = pstn_div_no;
	}

	public String getStaff_name() {
		return staff_name;
	}

	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}

	public String getStaff_pw() {
		return staff_pw;
	}

	public void setStaff_pw(String staff_pw) {
		this.staff_pw = staff_pw;
	}

	public Date getStaff_join_date() {
		return staff_join_date;
	}

	public void setStaff_join_date(Date staff_join_date) {
		this.staff_join_date = staff_join_date;
	}

	public Date getStaff_rsgnt_date() {
		return staff_rsgnt_date;
	}

	public void setStaff_rsgnt_date(Date staff_rsgnt_date) {
		this.staff_rsgnt_date = staff_rsgnt_date;
	}

	public String getStaff_state() {
		return staff_state;
	}

	public void setStaff_state(String staff_state) {
		this.staff_state = staff_state;
	}
}
