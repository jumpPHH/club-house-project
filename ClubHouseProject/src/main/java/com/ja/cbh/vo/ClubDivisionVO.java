package com.ja.cbh.vo;

public class ClubDivisionVO {

	private int club_division_no;
	private String club_division_name;
	private String club_division_state;
	public ClubDivisionVO() {
		super();
	}
	public ClubDivisionVO(int club_division_no, String club_division_name, String club_division_state) {
		super();
		this.club_division_no = club_division_no;
		this.club_division_name = club_division_name;
		this.club_division_state = club_division_state;
	}
	public int getClub_division_no() {
		return club_division_no;
	}
	public void setClub_division_no(int club_division_no) {
		this.club_division_no = club_division_no;
	}
	public String getClub_division_name() {
		return club_division_name;
	}
	public void setClub_division_name(String club_division_name) {
		this.club_division_name = club_division_name;
	}
	public String getClub_division_state() {
		return club_division_state;
	}
	public void setClub_division_state(String club_division_state) {
		this.club_division_state = club_division_state;
	}
	
	
}
