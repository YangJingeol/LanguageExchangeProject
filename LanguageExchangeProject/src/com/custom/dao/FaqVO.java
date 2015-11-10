package com.custom.dao;

import java.util.Date;

public class FaqVO {
	 private int f_no;
     private String f_title;
     private String f_content;
     private Date f_regdate;
     private String f_mail;
     private int f_hit;
     private int f_rownum;
     private String db_fday;
     
     
	
		     public String getDb_fday() {
		return db_fday;
	}
	public void setDb_fday(String db_fday) {
		this.db_fday = db_fday;
	}
			public int getF_no() {
				return f_no;
			}
			public void setF_no(int f_no) {
				this.f_no = f_no;
			}
			public String getF_title() {
				return f_title;
			}
			public void setF_title(String f_title) {
				this.f_title = f_title;
			}
			public String getF_content() {
				return f_content;
			}
			public void setF_content(String f_content) {
				this.f_content = f_content;
			}
			public Date getF_regdate() {
				return f_regdate;
			}
			public void setF_regdate(Date f_regdate) {
				this.f_regdate = f_regdate;
			}
			public String getF_mail() {
				return f_mail;
			}
			public void setF_mail(String f_mail) {
				this.f_mail = f_mail;
			}
			public int getF_hit() {
				return f_hit;
			}
			public void setF_hit(int f_hit) {
				this.f_hit = f_hit;
			}
			public int getF_rownum() {
				return f_rownum;
			}
			public void setF_rownum(int f_rownum) {
				this.f_rownum = f_rownum;
			}
		     
     

}
