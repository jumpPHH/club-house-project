package com.ja.cbh.vo;

import java.util.Date;

public class StudVO {

	private String stud_id; //학생 아이디 (기본키)
	private String stud_pw; //패스워드
	private String stud_name; //이름
	private String stud_phone; //전화번호
	private String stud_email; //이메일
	private String stud_gender; //성별
	private String stud_birth; //생년월일
	private String stud_grade; //학년
	private String stud_dept; //학과
	private String stud_photo_link; //사진
	private int stud_vlntr_time; //봉사시간
	private Date stud_reg_dt; //등록일자 
	private String stud_state; //학적상태
	public StudVO() {
		super();
	}
	public StudVO(String stud_id, String stud_pw, String stud_name, String stud_phone, String stud_email,
			String stud_gender, String stud_birth, String stud_grade, String stud_dept, String stud_photo_link,
			int stud_vlntr_time, Date stud_reg_dt, String stud_state) {
		super();
		this.stud_id = stud_id;
		this.stud_pw = stud_pw;
		this.stud_name = stud_name;
		this.stud_phone = stud_phone;
		this.stud_email = stud_email;
		this.stud_gender = stud_gender;
		this.stud_birth = stud_birth;
		this.stud_grade = stud_grade;
		this.stud_dept = stud_dept;
		this.stud_photo_link = stud_photo_link;
		this.stud_vlntr_time = stud_vlntr_time;
		this.stud_reg_dt = stud_reg_dt;
		this.stud_state = stud_state;
	}
	public String getStud_id() {
		return stud_id;
	}
	public void setStud_id(String stud_id) {
		this.stud_id = stud_id;
	}
	public String getStud_pw() {
		return stud_pw;
	}
	public void setStud_pw(String stud_pw) {
		this.stud_pw = stud_pw;
	}
	public String getStud_name() {
		return stud_name;
	}
	public void setStud_name(String stud_name) {
		this.stud_name = stud_name;
	}
	public String getStud_phone() {
		return stud_phone;
	}
	public void setStud_phone(String stud_phone) {
		this.stud_phone = stud_phone;
	}
	public String getStud_email() {
		return stud_email;
	}
	public void setStud_email(String stud_email) {
		this.stud_email = stud_email;
	}
	public String getStud_gender() {
		return stud_gender;
	}
	public void setStud_gender(String stud_gender) {
		this.stud_gender = stud_gender;
	}
	public String getStud_birth() {
		return stud_birth;
	}
	public void setStud_birth(String stud_birth) {
		this.stud_birth = stud_birth;
	}
	public String getStud_grade() {
		return stud_grade;
	}
	public void setStud_grade(String stud_grade) {
		this.stud_grade = stud_grade;
	}
	public String getStud_dept() {
		return stud_dept;
	}
	public void setStud_dept(String stud_dept) {
		this.stud_dept = stud_dept;
	}
	public String getStud_photo_link() {
		return stud_photo_link;
	}
	public void setStud_photo_link(String stud_photo_link) {
		this.stud_photo_link = stud_photo_link;
	}
	public int getStud_vlntr_time() {
		return stud_vlntr_time;
	}
	public void setStud_vlntr_time(int stud_vlntr_time) {
		this.stud_vlntr_time = stud_vlntr_time;
	}
	public Date getStud_reg_dt() {
		return stud_reg_dt;
	}
	public void setStud_reg_dt(Date stud_reg_dt) {
		this.stud_reg_dt = stud_reg_dt;
	}
	public String getStud_state() {
		return stud_state;
	}
	public void setStud_state(String stud_state) {
		this.stud_state = stud_state;
	}
	
	
}
