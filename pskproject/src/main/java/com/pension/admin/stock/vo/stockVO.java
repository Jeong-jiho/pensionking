package com.pension.admin.stock.vo;

public class stockVO {
	private int 	s_no;		//재고품번호
	private String 	s_name;		//재고품이름
	private int 	s_ea;		//재고품개수
	private String 	s_price;	//재고품가격
	
	
	
	
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public int getS_ea() {
		return s_ea;
	}
	public void setS_ea(int s_ea) {
		this.s_ea = s_ea;
	}
	public String getS_price() {
		return s_price;
	}
	public void setS_price(String s_price) {
		this.s_price = s_price;
	}
}
