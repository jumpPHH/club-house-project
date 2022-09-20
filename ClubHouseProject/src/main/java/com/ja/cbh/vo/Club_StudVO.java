package com.ja.cbh.vo;

import java.util.Date;

public class Club_StudVO {

	private int club_stud_no; //동아리 회원 (기본키)
	private String stud_id; //학생 아이디 (외부키)
	private int club_no; //동아리 정보 (외부키)
	private String club_stud_grade; //동아리 회원 등급
	private Date club_stud_join_date; //동아리 가입 일자
	private Date club_stud_drop_date; //동아리 탈퇴 일자
	private String club_stud_etc; //기타사항 
	private String club_stud_state; //상태
	
	public Club_StudVO() {
		super();
	}

	public Club_StudVO(int club_stud_no, String stud_id, int club_no, String club_stud_grade, Date club_stud_join_date,
			Date club_stud_drop_date, String club_stud_etc, String club_stud_state) {
		super();
		this.club_stud_no = club_stud_no;
		this.stud_id = stud_id;
		this.club_no = club_no;
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
