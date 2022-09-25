package com.ja.cbh.vo;

import java.util.Date;

public class Club_Fee {
	
	private int club_fee_no; //동아리 회비 넘버
	private int club_stud_no; //동아리 멤버 넘버
	private int club_no; //동아리 넘버 
	private String club_fee_division; //동아리 구분
	private int club_fee_income_amount; //수입
	private int club_fee_using_amount; //지출
	private String club_fee_balance; //잔액
	private String club_fee_detail; //상세 내용
	private String club_fee_other_detail; //기타 내용
	private Date club_fee_use_date; //사용 날짜
	private Date club_fee_date; //작성일
	
	public Club_Fee() {
		super();
	}

	public Club_Fee(int club_fee_no, int club_stud_no, int club_no, String club_fee_division,
			int club_fee_income_amount, int club_fee_using_amount, String club_fee_balance, String club_fee_detail,
			String club_fee_other_detail, Date club_fee_use_date, Date club_fee_date) {
		super();
		this.club_fee_no = club_fee_no;
		this.club_stud_no = club_stud_no;
		this.club_no = club_no;
		this.club_fee_division = club_fee_division;
		this.club_fee_income_amount = club_fee_income_amount;
		this.club_fee_using_amount = club_fee_using_amount;
		this.club_fee_balance = club_fee_balance;
		this.club_fee_detail = club_fee_detail;
		this.club_fee_other_detail = club_fee_other_detail;
		this.club_fee_use_date = club_fee_use_date;
		this.club_fee_date = club_fee_date;
	}

	public int getClub_fee_no() {
		return club_fee_no;
	}

	public void setClub_fee_no(int club_fee_no) {
		this.club_fee_no = club_fee_no;
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

	public String getClub_fee_division() {
		return club_fee_division;
	}

	public void setClub_fee_division(String club_fee_division) {
		this.club_fee_division = club_fee_division;
	}

	public int getClub_fee_income_amount() {
		return club_fee_income_amount;
	}

	public void setClub_fee_income_amount(int club_fee_income_amount) {
		this.club_fee_income_amount = club_fee_income_amount;
	}

	public int getClub_fee_using_amount() {
		return club_fee_using_amount;
	}

	public void setClub_fee_using_amount(int club_fee_using_amount) {
		this.club_fee_using_amount = club_fee_using_amount;
	}

	public String getClub_fee_balance() {
		return club_fee_balance;
	}

	public void setClub_fee_balance(String club_fee_balance) {
		this.club_fee_balance = club_fee_balance;
	}

	public String getClub_fee_detail() {
		return club_fee_detail;
	}

	public void setClub_fee_detail(String club_fee_detail) {
		this.club_fee_detail = club_fee_detail;
	}

	public String getClub_fee_other_detail() {
		return club_fee_other_detail;
	}

	public void setClub_fee_other_detail(String club_fee_other_detail) {
		this.club_fee_other_detail = club_fee_other_detail;
	}

	public Date getClub_fee_use_date() {
		return club_fee_use_date;
	}

	public void setClub_fee_use_date(Date club_fee_use_date) {
		this.club_fee_use_date = club_fee_use_date;
	}

	public Date getClub_fee_date() {
		return club_fee_date;
	}

	public void setClub_fee_date(Date club_fee_date) {
		this.club_fee_date = club_fee_date;
	}
}
