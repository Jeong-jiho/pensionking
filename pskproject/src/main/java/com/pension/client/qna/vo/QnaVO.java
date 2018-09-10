package com.pension.client.qna.vo;

import com.pension.client.login.vo.LoginVO;

public class QnaVO extends LoginVO{
	
	private int q_no = 0;
	private String q_title = "";
	private String q_content = "";
	private String q_pwd = "";
	private String q_date = "";
	private String q_update = "";
	private int readcnt=0;
	private int q_repRoot;
	private int q_repStep;
	
	//조건 검색시 사용한 필드
		private String search = "";
		private String keyword = "";
		private String start_date = "";
		private String end_date = "";
	
	public String getStart_date() {
			return start_date;
		}
		public void setStart_date(String start_date) {
			this.start_date = start_date;
		}
		public String getEnd_date() {
			return end_date;
		}
		public void setEnd_date(String end_date) {
			this.end_date = end_date;
		}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_pwd() {
		return q_pwd;
	}
	public void setQ_pwd(String q_pwd) {
		this.q_pwd = q_pwd;
	}
	public String getQ_date() {
		return q_date;
	}
	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}
	public String getQ_update() {
		return q_update;
	}
	public void setQ_update(String q_update) {
		this.q_update = q_update;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getQ_repRoot() {
		return q_repRoot;
	}
	public void setQ_repRoot(int q_repRoot) {
		this.q_repRoot = q_repRoot;
	}
	public int getQ_repStep() {
		return q_repStep;
	}
	public void setQ_repStep(int q_repStep) {
		this.q_repStep = q_repStep;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
		
	
}
