package com.pension.admin.notice.vo;

import com.pension.client.review.vo.ReviewVO;


public class NoticeVO extends ReviewVO{

	private  int n_no=0;
	private String n_title="";
	private String n_content="";
	private String n_writer="";
	private String n_date="";
	private String n_update="";
	
	
	
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public String getN_date() {
		return n_date;
	}
	public void setN_date(String n_date) {
		this.n_date = n_date;
	}
	public String getN_update() {
		return n_update;
	}
	public void setN_update(String n_update) {
		this.n_update = n_update;
	}
	
}
