package com.pension.admin.job.vo;

public class jobVO {
	private int 	j_no;		//직무번호
	private String 	j_name;		//직무이름
	private String 	j_day;		//직무요일
	private String 	j_time;		//근무시간
	private String 	j_price;	//기본월급
	
	
	
	
	public int getJ_no() {
		return j_no;
	}
	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}
	public String getJ_name() {
		return j_name;
	}
	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}
	public String getJ_day() {
		return j_day;
	}
	public void setJ_day(String j_day) {
		this.j_day = j_day;
	}
	public String getJ_time() {
		return j_time;
	}
	public void setJ_time(String j_time) {
		this.j_time = j_time;
	}
	public String getJ_price() {
		return j_price;
	}
	public void setJ_price(String j_price) {
		this.j_price = j_price;
	}
}
