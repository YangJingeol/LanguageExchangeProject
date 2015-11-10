package com.qna.dao;
/*
 * 
 * NO NUMBER,
B_NO NUMBER,
Q_ID VARCHAR2(100),
SUBJECT VARCHAR2(100),
CONT VARCHAR2(2000),
REGDATE DATE DEFAULT SYSDATE,
SECRET VARCHAR(1),
PW VARCHAR(10)
 */
import java.sql.*;
public class q_dto {
	private int no;
	private int b_no;
	private String q_id;
	private String subject;
	private String cont;
	private Date regdate;
	private String secret;
	private String pw;
	private String ans_ch;
	private a_dto a_vo=new a_dto();
	public a_dto getA_vo() {
		return a_vo;
	}
	public void setA_vo(a_dto a_vo) {
		this.a_vo = a_vo;
	}
	public int getNo() {
		return no;
	}
	public String getAns_ch() {
		return ans_ch;
	}
	public void setAns_ch(String ans_ch) {
		this.ans_ch = ans_ch;
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
	public String getQ_id() {
		return q_id;
	}
	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
}
