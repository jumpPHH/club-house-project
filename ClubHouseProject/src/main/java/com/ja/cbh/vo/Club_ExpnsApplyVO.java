package com.ja.cbh.vo;

import java.util.Date;

public class Club_ExpnsApplyVO {
	 
	private int club_expns_apply_no;// 동아리 경비 넘버
	private int club_no;// 동아리 넘버
	private int club_expns_apply_grants;// 경비 요청액
	private String club_expns_apply_period_use;// 경비 사용날짜
	private int club_expns_number_use; // 사용 인원
	private String club_expns_apply_purpose_use;// 사용 목적
	private Date club_expns_apply_date;// 신청일자
	private String club_expns_apply_reject_reason;// 반려사유
	private String club_expns_apply_state;// 상태
	
	public Club_ExpnsApplyVO() {
		super();
	}

	public Club_ExpnsApplyVO(int club_expns_apply_no, int club_no, int club_expns_apply_grants,
			String club_expns_apply_period_use, int club_expns_number_use, String club_expns_apply_purpose_use,
			Date club_expns_apply_date, String club_expns_apply_reject_reason, String club_expns_apply_state) {
		super();
		this.club_expns_apply_no = club_expns_apply_no;
		this.club_no = club_no;
		this.club_expns_apply_grants = club_expns_apply_grants;
		this.club_expns_apply_period_use = club_expns_apply_period_use;
		this.club_expns_number_use = club_expns_number_use;
		this.club_expns_apply_purpose_use = club_expns_apply_purpose_use;
		this.club_expns_apply_date = club_expns_apply_date;
		this.club_expns_apply_reject_reason = club_expns_apply_reject_reason;
		this.club_expns_apply_state = club_expns_apply_state;
	}

	public int getClub_expns_apply_no() {
		return club_expns_apply_no;
	}

	public void setClub_expns_apply_no(int club_expns_apply_no) {
		this.club_expns_apply_no = club_expns_apply_no;
	}

	public int getClub_no() {
		return club_no;
	}

	public void setClub_no(int club_no) {
		this.club_no = club_no;
	}

	public int getClub_expns_apply_grants() {
		return club_expns_apply_grants;
	}

	public void setClub_expns_apply_grants(int club_expns_apply_grants) {
		this.club_expns_apply_grants = club_expns_apply_grants;
	}

	public String getClub_expns_apply_period_use() {
		return club_expns_apply_period_use;
	}

	public void setClub_expns_apply_period_use(String club_expns_apply_period_use) {
		this.club_expns_apply_period_use = club_expns_apply_period_use;
	}

	public int getClub_expns_number_use() {
		return club_expns_number_use;
	}

	public void setClub_expns_number_use(int club_expns_number_use) {
		this.club_expns_number_use = club_expns_number_use;
	}

	public String getClub_expns_apply_purpose_use() {
		return club_expns_apply_purpose_use;
	}

	public void setClub_expns_apply_purpose_use(String club_expns_apply_purpose_use) {
		this.club_expns_apply_purpose_use = club_expns_apply_purpose_use;
	}

	public Date getClub_expns_apply_date() {
		return club_expns_apply_date;
	}

	public void setClub_expns_apply_date(Date club_expns_apply_date) {
		this.club_expns_apply_date = club_expns_apply_date;
	}

	public String getClub_expns_apply_reject_reason() {
		return club_expns_apply_reject_reason;
	}

	public void setClub_expns_apply_reject_reason(String club_expns_apply_reject_reason) {
		this.club_expns_apply_reject_reason = club_expns_apply_reject_reason;
	}

	public String getClub_expns_apply_state() {
		return club_expns_apply_state;
	}

	public void setClub_expns_apply_state(String club_expns_apply_state) {
		this.club_expns_apply_state = club_expns_apply_state;
	}
	
}
