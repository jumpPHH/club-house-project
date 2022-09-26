package com.ja.cbh.vo;

public class Club_BossAndAccountingMemberVO {
	
	
	private String club_name;
	private String stud_id;
	private String stud_name;
	private String club_stud_grade;
	private int club_no;
	private int club_stud_no;
	
	public Club_BossAndAccountingMemberVO() {
		super();
	}

	public Club_BossAndAccountingMemberVO(String club_name, String stud_id, String stud_name, String club_stud_grade,
			int club_no, int club_stud_no) {
		super();
		this.club_name = club_name;
		this.stud_id = stud_id;
		this.stud_name = stud_name;
		this.club_stud_grade = club_stud_grade;
		this.club_no = club_no;
		this.club_stud_no = club_stud_no;
	}

	public String getClub_name() {
		return club_name;
	}

	public void setClub_name(String club_name) {
		this.club_name = club_name;
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

	public int getClub_no() {
		return club_no;
	}

	public void setClub_no(int club_no) {
		this.club_no = club_no;
	}

	public int getClub_stud_no() {
		return club_stud_no;
	}

	public void setClub_stud_no(int club_stud_no) {
		this.club_stud_no = club_stud_no;
	}
}
