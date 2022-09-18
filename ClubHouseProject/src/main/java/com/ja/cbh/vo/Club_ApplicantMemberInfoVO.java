package com.ja.cbh.vo;

import java.util.Date;

public class Club_ApplicantMemberInfoVO {
	
	private String stud_id;
	private String stud_name;
	private Date club_stud_appl_date;
	private String stud_gender;
	
	public Club_ApplicantMemberInfoVO() {
		super();
	}

	public Club_ApplicantMemberInfoVO(String stud_id, String stud_name, Date club_stud_appl_date, String stud_gender) {
		super();
		this.stud_id = stud_id;
		this.stud_name = stud_name;
		this.club_stud_appl_date = club_stud_appl_date;
		this.stud_gender = stud_gender;
	}

	public String getStud_id() {
		return stud_id;
	}

	public void setStud_id(String stud_id) {
		this.stud_id = stud_id;
	}

	public String getStud_name() {
		return stud_name;
	}

	public void setStud_name(String stud_name) {
		this.stud_name = stud_name;
	}

	public Date getClub_stud_appl_date() {
		return club_stud_appl_date;
	}

	public void setClub_stud_appl_date(Date club_stud_appl_date) {
		this.club_stud_appl_date = club_stud_appl_date;
	}

	public String getStud_gender() {
		return stud_gender;
	}

	public void setStud_gender(String stud_gender) {
		this.stud_gender = stud_gender;
	}
}
