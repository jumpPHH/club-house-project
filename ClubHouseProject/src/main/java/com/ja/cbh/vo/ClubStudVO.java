package com.ja.cbh.vo;

import java.util.Date;

public class ClubStudVO {

	private int club_stud_no;
	private String stud_id;
	private int club_no;
	private int club_category_no;
	private String club_stud_grade;
	private Date club_stud_join_date;
	private Date club_stud_drop_date;
	private String club_stud_etc;
	private String club_stud_state;
	
	public ClubStudVO() {
		super();
	}
	
	public ClubStudVO(int club_stud_no, String stud_id, int club_no, int club_category_no, String club_stud_grade,
			Date club_stud_join_date, Date club_stud_drop_date, String club_stud_etc, String club_stud_state) {
		super();
		this.club_stud_no = club_stud_no;
		this.stud_id = stud_id;
		this.club_no = club_no;
		this.club_category_no = club_category_no;
		this.club_stud_grade = club_stud_grade;
		this.club_stud_join_date = club_stud_join_date;
		this.club_stud_drop_date = club_stud_drop_date;
		this.club_stud_etc = club_stud_etc;
		this.club_stud_state = club_stud_state;
	}
	public int getClub_stud_no() {
		return club_stud_no;
	}
	public void setClub_stud_no(int club_stud_no) {
		this.club_stud_no = club_stud_no;
	}
	public String getStud_id() {
		return stud_id;
	}
	public void setStud_id(String stud_id) {
		this.stud_id = stud_id;
	}
	public int getClub_no() {
		return club_no;
	}
	public void setClub_no(int club_no) {
		this.club_no = club_no;
	}
	public int getClub_category_no() {
		return club_category_no;
	}
	public void setClub_category_no(int club_category_no) {
		this.club_category_no = club_category_no;
	}
	public String getClub_stud_grade() {
		return club_stud_grade;
	}
	public void setClub_stud_grade(String club_stud_grade) {
		this.club_stud_grade = club_stud_grade;
	}
	public Date getClub_stud_join_date() {
		return club_stud_join_date;
	}
	public void setClub_stud_join_date(Date club_stud_join_date) {
		this.club_stud_join_date = club_stud_join_date;
	}
	public Date getClub_stud_drop_date() {
		return club_stud_drop_date;
	}
	public void setClub_stud_drop_date(Date club_stud_drop_date) {
		this.club_stud_drop_date = club_stud_drop_date;
	}
	public String getClub_stud_etc() {
		return club_stud_etc;
	}
	public void setClub_stud_etc(String club_stud_etc) {
		this.club_stud_etc = club_stud_etc;
	}
	public String getClub_stud_state() {
		return club_stud_state;
	}
	public void setClub_stud_state(String club_stud_state) {
		this.club_stud_state = club_stud_state;
	}
	
	
}
