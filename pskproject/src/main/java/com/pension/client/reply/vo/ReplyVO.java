package com.pension.client.reply.vo;
 
public class ReplyVO {
	private int rp_no = 0;          // 댓글번호 
	private int rv_no = 0;          // 후기 글번호 
	private String rp_writer = "";  // 댓글 작성자
	private String rp_content = ""; // 댓글내용
	private String rp_pwd = "";     // 댓글 비밀번호
	private String rp_date = "";	// 댓글 작성일
	private String pv_update = "";  // 댓글 수정일
	
	 
	public int getRp_no() {
		return rp_no;
	}
	public void setRp_no(int rp_no) {
		this.rp_no = rp_no;
	}
	public int getRv_no() {
		return rv_no;
	}
	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}
	public String getRp_writer() {
		return rp_writer;
	}
	public void setRp_writer(String rp_writer) {
		this.rp_writer = rp_writer;
	}
	public String getRp_content() {
		return rp_content;
	}
	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}
	public String getRp_pwd() {
		return rp_pwd;
	}
	public void setRp_pwd(String rp_pwd) {
		this.rp_pwd = rp_pwd;
	}
	public String getRp_date() {
		return rp_date;
	}
	public void setRp_date(String rp_date) {
		this.rp_date = rp_date;
	}
	public String getPv_update() {
		return pv_update;
	}
	public void setPv_update(String pv_update) {
		this.pv_update = pv_update;
	}
	
}	