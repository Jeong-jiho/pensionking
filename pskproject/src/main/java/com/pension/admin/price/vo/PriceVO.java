package com.pension.admin.price.vo;

import com.pension.client.member.vo.MemberVO;

public class PriceVO extends MemberVO{
	private int pr_no;
	private int pr_weekday;
	private int pr_weekend;
	private int pr_sweekday;
	private int pr_sweekend;
	private int r_no;
	
	public int getPr_no() {
		return pr_no;
	}
	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getPr_weekday() {
		return pr_weekday;
	}
	public void setPr_weekday(int pr_weekday) {
		this.pr_weekday = pr_weekday;
	}
	public int getPr_weekend() {
		return pr_weekend;
	}
	public void setPr_weekend(int pr_weekend) {
		this.pr_weekend = pr_weekend;
	}
	public int getPr_sweekday() {
		return pr_sweekday;
	}
	public void setPr_sweekday(int pr_sweekday) {
		this.pr_sweekday = pr_sweekday;
	}
	public int getPr_sweekend() {
		return pr_sweekend;
	}
	public void setPr_sweekend(int pr_sweekend) {
		this.pr_sweekend = pr_sweekend;
	}
	
	
}
