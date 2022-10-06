package com.ja.cbh.vo;

public class Club_BoardImageVO {

	private int club_board_image_no;
	private int club_board_no;
	private int club_no;
	private String club_board_image_link;
	public Club_BoardImageVO() {
		super();
	}
	public Club_BoardImageVO(int club_board_image_no, int club_board_no, int club_no, String club_board_image_link) {
		super();
		this.club_board_image_no = club_board_image_no;
		this.club_board_no = club_board_no;
		this.club_no = club_no;
		this.club_board_image_link = club_board_image_link;
	}
	public int getClub_board_image_no() {
		return club_board_image_no;
	}
	public void setClub_board_image_no(int club_board_image_no) {
		this.club_board_image_no = club_board_image_no;
	}
	public int getClub_board_no() {
		return club_board_no;
	}
	public void setClub_board_no(int club_board_no) {
		this.club_board_no = club_board_no;
	}
	public int getClub_no() {
		return club_no;
	}
	public void setClub_no(int club_no) {
		this.club_no = club_no;
	}
	public String getClub_board_image_link() {
		return club_board_image_link;
	}
	public void setClub_board_image_link(String club_board_image_link) {
		this.club_board_image_link = club_board_image_link;
	}
	
	
}
