package com.ja.cbh.vo;

public class VlntrDivVO {

	private int vlntr_div_no;
	private String vlntr_div_name;
	private String vlntr_div_state;
	
	public VlntrDivVO() {
		super();
	}
	
	public VlntrDivVO(int vlntr_div_no, String vlntr_div_name, String vlntr_div_state) {
		super();
		this.vlntr_div_no = vlntr_div_no;
		this.vlntr_div_name = vlntr_div_name;
		this.vlntr_div_state = vlntr_div_state;
	}
	
	public int getVlntr_div_no() {
		return vlntr_div_no;
	}
	public void setVlntr_div_no(int vlntr_div_no) {
		this.vlntr_div_no = vlntr_div_no;
	}
	public String getVlntr_div_name() {
		return vlntr_div_name;
	}
	public void setVlntr_div_name(String vlntr_div_name) {
		this.vlntr_div_name = vlntr_div_name;
	}
	public String getVlntr_div_state() {
		return vlntr_div_state;
	}
	public void setVlntr_div_state(String vlntr_div_state) {
		this.vlntr_div_state = vlntr_div_state;
	}
	
	
	
}
