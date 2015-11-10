package com.qna.dao;

import java.sql.Date;

public class ntc_dto {
	private int no;
	private int b_no;
	private String ntc_id;
	private String ntc_sub;
	private String ntc_cont;
	private Date ntc_reg;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getNtc_id() {
		return ntc_id;
	}
	public void setNtc_id(String ntc_id) {
		this.ntc_id = ntc_id;
	}
	public String getNtc_sub() {
		return ntc_sub;
	}
	public void setNtc_sub(String ntc_sub) {
		this.ntc_sub = ntc_sub;
	}
	public String getNtc_cont() {
		return ntc_cont;
	}
	public void setNtc_cont(String ntc_cont) {
		this.ntc_cont = ntc_cont;
	}
	public Date getNtc_reg() {
		return ntc_reg;
	}
	public void setNtc_reg(Date ntc_reg) {
		this.ntc_reg = ntc_reg;
	}
	
}
