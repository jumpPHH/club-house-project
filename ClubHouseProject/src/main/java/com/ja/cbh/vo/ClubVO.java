package com.ja.cbh.vo;

import java.util.Date;

public class ClubVO {

	private int club_no; //동아리 (기본키)
	private int club_division_no; //동아리 구분 넘버 (외부키)
	private int club_category_no; //클럽 카테고리 (외부키)
	private int club_appl_no; //클럽 신청서 번호?
	private String club_boss; //동아리 회장
	private String club_name; //동아리 이름
	private String club_description; //동아리 설명
	private int club_people_count; //동아리 회원수
	private String club_state; //동아리 활동 상태
	private String club_title_image; // 동아리 타이틀 이미지 
	private String club_dscrp_image; // 동아리 설명 이미지
	private Date club_estbl_dt; //동아리 설립일자
	private Date club_appl_dt; //동아리 신청일자
	public ClubVO() {
		super();
	}
	public ClubVO(int club_no, int club_division_no, int club_category_no, int club_appl_no, String club_boss,
			String club_name, String club_description, int club_people_count, String club_state,
			String club_title_image, String club_dscrp_image, Date club_estbl_dt, Date club_appl_dt) {
		super();
		this.club_no = club_no;
		this.club_division_no = club_division_no;
		this.club_category_no = club_category_no;
		this.club_appl_no = club_appl_no;
		this.club_boss = club_boss;
		this.club_name = club_name;
		this.club_description = club_description;
		this.club_people_count = club_people_count;
		this.club_state = club_state;
		this.club_title_image = club_title_image;
		this.club_dscrp_image = club_dscrp_image;
		this.club_estbl_dt = club_estbl_dt;
		this.club_appl_dt = club_appl_dt;
	}
	public int getClub_no() {
		return club_no;
	}
	public void setClub_no(int club_no) {
		this.club_no = club_no;
	}
	public int getClub_division_no() {
		return club_division_no;
	}
	public void setClub_division_no(int club_division_no) {
		this.club_division_no = club_division_no;
	}
	public int getClub_category_no() {
		return club_category_no;
	}
	public void setClub_category_no(int club_category_no) {
		this.club_category_no = club_category_no;
	}
	public int getClub_appl_no() {
		return club_appl_no;
	}
	public void setClub_appl_no(int club_appl_no) {
		this.club_appl_no = club_appl_no;
	}
	public String getClub_boss() {
		return club_boss;
	}
	public void setClub_boss(String club_boss) {
		this.club_boss = club_boss;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public String getClub_description() {
		return club_description;
	}
	public void setClub_description(String club_description) {
		this.club_description = club_description;
	}
	public int getClub_people_count() {
		return club_people_count;
	}
	public void setClub_people_count(int club_people_count) {
		this.club_people_count = club_people_count;
	}
	public String getClub_state() {
		return club_state;
	}
	public void setClub_state(String club_state) {
		this.club_state = club_state;
	}
	public String getClub_title_image() {
		return club_title_image;
	}
	public void setClub_title_image(String club_title_image) {
		this.club_title_image = club_title_image;
	}
	public String getClub_dscrp_image() {
		return club_dscrp_image;
	}
	public void setClub_dscrp_image(String club_dscrp_image) {
		this.club_dscrp_image = club_dscrp_image;
	}
	public Date getClub_estbl_dt() {
		return club_estbl_dt;
	}
	public void setClub_estbl_dt(Date club_estbl_dt) {
		this.club_estbl_dt = club_estbl_dt;
	}
	public Date getClub_appl_dt() {
		return club_appl_dt;
	}
	public void setClub_appl_dt(Date club_appl_dt) {
		this.club_appl_dt = club_appl_dt;
	}
	
	
}