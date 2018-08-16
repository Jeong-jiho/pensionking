package com.pension.admin.order.vo;

import com.pension.admin.stock.vo.stockVO;

public class orderVO extends stockVO{
	private int 	o_no;		//발주번호
	private String 	o_date;		//발주일자
	private int 	o_ea;		//발주품개수
	private String 	o_price;	//발주금액
	private String 	o_update;	//발주수정일
	
	
	
	
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public int getO_ea() {
		return o_ea;
	}
	public void setO_ea(int o_ea) {
		this.o_ea = o_ea;
	}
	public String getO_price() {
		return o_price;
	}
	public void setO_price(String o_price) {
		this.o_price = o_price;
	}
	public String getO_update() {
		return o_update;
	}
	public void setO_update(String o_update) {
		this.o_update = o_update;
	}
}
