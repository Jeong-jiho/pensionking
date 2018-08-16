package com.pension.admin.into.vo;

import com.pension.admin.stock.vo.stockVO;

public class intoVO extends stockVO{
	private int 	in_no;		//입고번호
	private int 	s_no;		//재고품번호
	private int 	in_ea;		//입고품개수
	private String 	in_date;	//입고일자
	
	
	
	
	public int getIn_no() {
		return in_no;
	}
	public void setIn_no(int in_no) {
		this.in_no = in_no;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getIn_ea() {
		return in_ea;
	}
	public void setIn_ea(int in_ea) {
		this.in_ea = in_ea;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}
}
