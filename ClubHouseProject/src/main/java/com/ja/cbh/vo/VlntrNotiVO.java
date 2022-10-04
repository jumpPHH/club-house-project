package com.ja.cbh.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class VlntrNotiVO {

	private int vlntr_noti_no;
	private String staff_id;
	private int vlntr_div_no;
	private String vlntr_title;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date vlntr_st_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date vlntr_end_date;
	private String vlntr_mtng_time;
	private String vlntr_spot;
	private String vlntr_content;
	private String vlntr_checker;
	private String vlntr_org_name;
	private int vlntr_srvc_time;
	private int vlntr_fixed_people;
	private String vlntr_image_link;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date vlntr_noti_date;
	private String vlntr_noti_state;
	private int vlntr_appl_count;
	
	public VlntrNotiVO() {
		super();
	}
	public VlntrNotiVO(int vlntr_noti_no, String staff_id, int vlntr_div_no, String vlntr_title,
			Date vlntr_st_date, Date vlntr_end_date, String vlntr_mtng_time, String vlntr_spot, String vlntr_content,
			String vlntr_checker, String vlntr_org_name, int vlntr_srvc_time, int vlntr_fixed_people,
			String vlntr_image_link, Date vlntr_noti_date, String vlntr_noti_state,
			int vlntr_appl_count) {
		super();
		this.vlntr_noti_no = vlntr_noti_no;
		this.staff_id = staff_id;
		this.vlntr_div_no = vlntr_div_no;
		this.vlntr_title = vlntr_title;
		this.vlntr_st_date = vlntr_st_date;
		this.vlntr_end_date = vlntr_end_date;
		this.vlntr_mtng_time = vlntr_mtng_time;
		this.vlntr_spot = vlntr_spot;
		this.vlntr_content = vlntr_content;
		this.vlntr_checker = vlntr_checker;
		this.vlntr_org_name = vlntr_org_name;
		this.vlntr_srvc_time = vlntr_srvc_time;
		this.vlntr_fixed_people = vlntr_fixed_people;
		this.vlntr_image_link = vlntr_image_link;
		this.vlntr_noti_date = vlntr_noti_date;
		this.vlntr_noti_state = vlntr_noti_state;
		this.vlntr_appl_count = vlntr_appl_count;
	}
	public int getVlntr_noti_no() {
		return vlntr_noti_no;
	}
	public void setVlntr_noti_no(int vlntr_noti_no) {
		this.vlntr_noti_no = vlntr_noti_no;
	}
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public int getVlntr_div_no() {
		return vlntr_div_no;
	}
	public void setVlntr_div_no(int vlntr_div_no) {
		this.vlntr_div_no = vlntr_div_no;
	}
	public String getVlntr_title() {
		return vlntr_title;
	}
	public void setVlntr_title(String vlntr_title) {
		this.vlntr_title = vlntr_title;
	}
	public Date getVlntr_st_date() {
		return vlntr_st_date;
	}
	public void setVlntr_st_date(Date vlntr_st_date) {
		this.vlntr_st_date = vlntr_st_date;
	}
	public Date getVlntr_end_date() {
		return vlntr_end_date;
	}
	public void setVlntr_end_date(Date vlntr_end_date) {
		this.vlntr_end_date = vlntr_end_date;
	}
	public String getVlntr_mtng_time() {
		return vlntr_mtng_time;
	}
	public void setVlntr_mtng_time(String vlntr_mtng_time) {
		this.vlntr_mtng_time = vlntr_mtng_time;
	}
	public String getVlntr_spot() {
		return vlntr_spot;
	}
	public void setVlntr_spot(String vlntr_spot) {
		this.vlntr_spot = vlntr_spot;
	}
	public String getVlntr_content() {
		return vlntr_content;
	}
	public void setVlntr_content(String vlntr_content) {
		this.vlntr_content = vlntr_content;
	}
	public String getVlntr_checker() {
		return vlntr_checker;
	}
	public void setVlntr_checker(String vlntr_checker) {
		this.vlntr_checker = vlntr_checker;
	}
	public String getVlntr_org_name() {
		return vlntr_org_name;
	}
	public void setVlntr_org_name(String vlntr_org_name) {
		this.vlntr_org_name = vlntr_org_name;
	}
	public int getVlntr_srvc_time() {
		return vlntr_srvc_time;
	}
	public void setVlntr_srvc_time(int vlntr_srvc_time) {
		this.vlntr_srvc_time = vlntr_srvc_time;
	}
	public int getVlntr_fixed_people() {
		return vlntr_fixed_people;
	}
	public void setVlntr_fixed_people(int vlntr_fixed_people) {
		this.vlntr_fixed_people = vlntr_fixed_people;
	}
	public String getVlntr_image_link() {
		return vlntr_image_link;
	}
	public void setVlntr_image_link(String vlntr_image_link) {
		this.vlntr_image_link = vlntr_image_link;
	}
	public Date getVlntr_noti_date() {
		return vlntr_noti_date;
	}
	public void setVlntr_noti_date(Date vlntr_noti_date) {
		this.vlntr_noti_date = vlntr_noti_date;
	}
	public String getVlntr_noti_state() {
		return vlntr_noti_state;
	}
	public void setVlntr_noti_state(String vlntr_noti_state) {
		this.vlntr_noti_state = vlntr_noti_state;
	}
	public int getVlntr_appl_count() {
		return vlntr_appl_count;
	}
	public void setVlntr_appl_count(int vlntr_appl_count) {
		this.vlntr_appl_count = vlntr_appl_count;
	}
	
	
	
	
}
