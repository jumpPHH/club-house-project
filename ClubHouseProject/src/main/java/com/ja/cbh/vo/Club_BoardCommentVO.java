package com.ja.cbh.vo;

import java.util.Date;

public class Club_BoardCommentVO {
	private int club_board_comment_no;
	private int club_board_no;
	private int club_stud_no;
	private int club_no;
	private String club_board_comment_content;
	private	Date club_board_comment_date;
	
	public Club_BoardCommentVO() {
		super();
	}
	public Club_BoardCommentVO(int club_board_comment_no, int club_board_no, int club_stud_no, int club_no,
			String club_board_comment_content, Date club_board_comment_date) {
		super();
		this.club_board_comment_no = club_board_comment_no;
		this.club_board_no = club_board_no;
		this.club_stud_no = club_stud_no;
		this.club_no = club_no;
		this.club_board_comment_content = club_board_comment_content;
		this.club_board_comment_date = club_board_comment_date;
	}
	public int getClub_board_comment_no() {
		return club_board_comment_no;
	}
	public void setClub_board_comment_no(int club_board_comment_no) {
		this.club_board_comment_no = club_board_comment_no;
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
	public String getClub_board_comment_content() {
		return club_board_comment_content;
	}
	public void setClub_board_comment_content(String club_board_comment_content) {
		this.club_board_comment_content = club_board_comment_content;
	}
	public Date getClub_board_comment_date() {
		return club_board_comment_date;
	}
	public void setClub_board_comment_date(Date club_board_comment_date) {
		this.club_board_comment_date = club_board_comment_date;
	}
	
	}
