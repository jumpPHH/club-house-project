package com.ja.cbh.vo;

import java.util.Date;

public class Club_ActVO {
	
	private int club_act_no;
	private int club_no;
	private String stud_id;
	private String club_act_content;
	private Date club_act_date;
	private String club_act_title;
	private int club_readcount;
	
	public Club_ActVO() {
		super();
	}

	public Club_ActVO(int club_act_no, int club_no, String stud_id, String club_act_content, Date club_act_date,
			String club_act_title, int club_readcount) {
		super();
		this.club_act_no = club_act_no;
		this.club_no = club_no;
		this.stud_id = stud_id;
		this.club_act_content = club_act_content;
		this.club_act_date = club_act_date;
		this.club_act_title = club_act_title;
		this.club_readcount = club_readcount;
	}

	public int getClub_act_no() {
		return club_act_no;
	}

	public void setClub_act_no(int club_act_no) {
		this.club_act_no = club_act_no;
	}

	public int getClub_no() {
		return club_no;
	}

	public void setClub_no(int club_no) {
		this.club_no = club_no;
	}

	public String getStud_id() {
		return stud_id;
	}

	public void setStud_id(String stud_id) {
		this.stud_id = stud_id;
	}

	public String getClub_act_content() {
		return club_act_content;
	}

	public void setClub_act_content(String club_act_content) {
		this.club_act_content = club_act_content;
	}

	public Date getClub_act_date() {
		return club_act_date;
	}

	public void setClub_act_date(Date club_act_date) {
		this.club_act_date = club_act_date;
	}

	public String getClub_act_title() {
		return club_act_title;
	}

	public void setClub_act_title(String club_act_title) {
		this.club_act_title = club_act_title;
	}

	public int getClub_readcount() {
		return club_readcount;
	}

	public void setClub_readcount(int club_readcount) {
		this.club_readcount = club_readcount;
	}
}
