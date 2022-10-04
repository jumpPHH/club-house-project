package com.ja.cbh.vo;

public class Club_ScheduleVO {
	
		private int club_schedule_no;
		private int club_no;
		private int club_stud_no;
		private String subject;
		private String startdate;
		private String enddate;
		private String memo;
		
		public Club_ScheduleVO() {
			super();
		}
		
		public Club_ScheduleVO(int club_schedule_no, int club_no, int club_stud_no, String subject, String startdate,
				String enddate, String memo) {
			super();
			this.club_schedule_no = club_schedule_no;
			this.club_no = club_no;
			this.club_stud_no = club_stud_no;
			this.subject = subject;
			this.startdate = startdate;
			this.enddate = enddate;
			this.memo = memo;
		}

		public int getClub_schedule_no() {
			return club_schedule_no;
		}

		public void setClub_schedule_no(int club_schedule_no) {
			this.club_schedule_no = club_schedule_no;
		}

		public int getClub_no() {
			return club_no;
		}

		public void setClub_no(int club_no) {
			this.club_no = club_no;
		}

		public int getClub_stud_no() {
			return club_stud_no;
		}

		public void setClub_stud_no(int club_stud_no) {
			this.club_stud_no = club_stud_no;
		}

		public String getSubject() {
			return subject;
		}

		public void setSubject(String subject) {
			this.subject = subject;
		}

		public String getStartdate() {
			return startdate;
		}

		public void setStartdate(String startdate) {
			this.startdate = startdate;
		}

		public String getEnddate() {
			return enddate;
		}

		public void setEnddate(String enddate) {
			this.enddate = enddate;
		}

		public String getMemo() {
			return memo;
		}

		public void setMemo(String memo) {
			this.memo = memo;
		}

}
