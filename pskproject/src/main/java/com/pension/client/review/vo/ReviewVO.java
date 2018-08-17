package com.pension.client.review.vo;

import java.sql.Date;

public class ReviewVO extends MemberVO {

	private int rv_no 		  =0;
	private String rv_title = "";
	private String rv_content ="";
	private String rv_date	  ="";
	private String rv_pwd = "";
	private String rv_update ="";
	
	
	
	public int getRv_no() {
		return rv_no;
	}
	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}
	public String getRv_title() {
		return rv_title;
	}
	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public String getRv_date() {
		return rv_date;
	}
	public void setRv_date(String rv_date) {
		this.rv_date = rv_date;
	}
	public String getRv_pwd() {
		return rv_pwd;
	}
	public void setRv_pwd(String rv_pwd) {
		this.rv_pwd = rv_pwd;
	}
	public String getRv_update() {
		return rv_update;
	}
	public void setRv_update(String rv_update) {
		this.rv_update = rv_update;
	}
	
	

	
}
