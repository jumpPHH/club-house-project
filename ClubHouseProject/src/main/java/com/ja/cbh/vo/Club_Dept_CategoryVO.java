package com.ja.cbh.vo;

public class Club_Dept_CategoryVO {

	private int club_category_no;
	private String club_category_name;
	private String club_category_eng;
	private String club_category_description;
	private String club_dept_image_link;
	private String club_category_state;
	public Club_Dept_CategoryVO() {
		super();
	}
	public Club_Dept_CategoryVO(int club_category_no, String club_category_name, String club_category_eng,
			String club_category_description, String club_dept_image_link, String club_category_state) {
		super();
		this.club_category_no = club_category_no;
		this.club_category_name = club_category_name;
		this.club_category_eng = club_category_eng;
		this.club_category_description = club_category_description;
		this.club_dept_image_link = club_dept_image_link;
		this.club_category_state = club_category_state;
	}
	public int getClub_category_no() {
		return club_category_no;
	}
	public void setClub_category_no(int club_category_no) {
		this.club_category_no = club_category_no;
	}
	public String getClub_category_name() {
		return club_category_name;
	}
	public void setClub_category_name(String club_category_name) {
		this.club_category_name = club_category_name;
	}
	public String getClub_category_eng() {
		return club_category_eng;
	}
	public void setClub_category_eng(String club_category_eng) {
		this.club_category_eng = club_category_eng;
	}
	public String getClub_category_description() {
		return club_category_description;
	}
	public void setClub_category_description(String club_category_description) {
		this.club_category_description = club_category_description;
	}
	public String getClub_dept_image_link() {
		return club_dept_image_link;
	}
	public void setClub_dept_image_link(String club_dept_image_link) {
		this.club_dept_image_link = club_dept_image_link;
	}
	public String getClub_category_state() {
		return club_category_state;
	}
	public void setClub_category_state(String club_category_state) {
		this.club_category_state = club_category_state;
	}
	
	
}
