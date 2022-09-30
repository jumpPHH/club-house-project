package com.ja.cbh.vo;

import java.util.Date;

public class Club_ActVO {

	private int club_act_no; // 동아리 활동내역 게시글 번호
	private int club_no;	// 동아리 구분
	private String stud_id;	// 학생 아이디
	private String club_act_title;		// 활동내역 제목
	private String club_act_content;	// 활동내역 글내용
	private int club_readcount;			// 조회수
	private Date club_act_date;			// 게시일자
	
	public Club_ActVO() {
		super();
	}

	public Club_ActVO(int club_act_no, int club_no, String stud_id, String club_act_title, String club_act_content,
			int club_readcount, Date club_act_date) {
		super();
		this.club_act_no = club_act_no;
		this.club_no = club_no;
		this.stud_id = stud_id;
		this.club_act_title = club_act_title;
		this.club_act_content = club_act_content;
		this.club_readcount = club_readcount;
		this.club_act_date = club_act_date;
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

	public String getClub_act_title() {
		return club_act_title;
	}

	public void setClub_act_title(String club_act_title) {
		this.club_act_title = club_act_title;
	}

	public String getClub_act_content() {
		return club_act_content;
	}

	public void setClub_act_content(String club_act_content) {
		this.club_act_content = club_act_content;
	}

	public int getClub_readcount() {
		return club_readcount;
	}

	public void setClub_readcount(int club_readcount) {
		this.club_readcount = club_readcount;
	}

	public Date getClub_act_date() {
		return club_act_date;
	}

	public void setClub_act_date(Date club_act_date) {
		this.club_act_date = club_act_date;
	}

}
