package com.ja.cbh.vo;

import java.util.Date;

public class Club_MemberInfoDyVO {
	
	private int club_stud_no; //동아리 회원 번호
	private String stud_id; //학생 아이디 
	private String stud_name; //학생 이름
	private String club_stud_grade; //동아리 회원 직책
	private Date club_stud_join_date; //동아리 회원 가입 날짜
	private String stud_gender; //학생 성별
	private String stud_phone; //학생 번호
	
	public Club_MemberInfoDyVO() {
		super();
	}

	public Club_MemberInfoDyVO(int club_stud_no, String stud_id, String stud_name, String club_stud_grade,
			Date club_stud_join_date, String stud_gender, String stud_phone) {
		super();
		this.club_stud_no = club_stud_no;
		this.stud_id = stud_id;
		this.stud_name = stud_name;
		this.club_stud_grade = club_stud_grade;
		this.club_stud_join_date = club_stud_join_date;
		this.stud_gender = stud_gender;
		this.stud_phone = stud_phone;
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

	public String getStud_name() {
		return stud_name;
	}

	public void setStud_name(String stud_name) {
		this.stud_name = stud_name;
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

	public String getStud_gender() {
		return stud_gender;
	}

	public void setStud_gender(String stud_gender) {
		this.stud_gender = stud_gender;
	}

	public String getStud_phone() {
		return stud_phone;
	}

	public void setStud_phone(String stud_phone) {
		this.stud_phone = stud_phone;
	}
}
