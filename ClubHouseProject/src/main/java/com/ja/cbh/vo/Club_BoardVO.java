package com.ja.cbh.vo;

import java.util.Date;

public class Club_BoardVO {

	private int club_board_no; //동아리 게시판(기본키)
	private int club_stud_no; //동아리 회원
	private int club_no; //동아리 번호 
	private String club_board_title; //동아리 제목
	private String club_board_content; //동아리 내용
	private int club_board_readcount; //동아리 조회수
	private Date club_board_writedate; //동아리 게시일
	
	public Club_BoardVO() {
		super();
	}

	public Club_BoardVO(int club_board_no, int club_stud_no, int club_no, String club_board_title,
			String club_board_content, int club_board_readcount, Date club_board_writedate) {
		super();
		this.club_board_no = club_board_no;
		this.club_stud_no = club_stud_no;
		this.club_no = club_no;
		this.club_board_title = club_board_title;
		this.club_board_content = club_board_content;
		this.club_board_readcount = club_board_readcount;
		this.club_board_writedate = club_board_writedate;
	}

	public int getClub_board_no() {
		return club_board_no;
	}

	public void setClub_board_no(int club_board_no) {
		this.club_board_no = club_board_no;
	}

	public int getClub_stud_no() {
		return club_stud_no;
	}

	public void setClub_stud_no(int club_stud_no) {
		this.club_stud_no = club_stud_no;
	}

	public int getClub_no() {
		return club_no;
	}

	public void setClub_no(int club_no) {
		this.club_no = club_no;
	}

	public String getClub_board_title() {
		return club_board_title;
	}

	public void setClub_board_title(String club_board_title) {
		this.club_board_title = club_board_title;
	}

	public String getClub_board_content() {
		return club_board_content;
	}

	public void setClub_board_content(String club_board_content) {
		this.club_board_content = club_board_content;
	}

	public int getClub_board_readcount() {
		return club_board_readcount;
	}

	public void setClub_board_readcount(int club_board_readcount) {
		this.club_board_readcount = club_board_readcount;
	}

	public Date getClub_board_writedate() {
		return club_board_writedate;
	}

	public void setClub_board_writedate(Date club_board_writedate) {
		this.club_board_writedate = club_board_writedate;
	}

}
