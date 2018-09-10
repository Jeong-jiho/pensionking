package com.pension.admin.into.vo;

import com.pension.admin.stock.vo.StockVO;

public class IntoVO extends StockVO{
	private int 	in_no;		//�԰��ȣ
	private int 	in_ea;		//�԰�ǰ����
	private String 	in_date;	//�԰�����
	
	
	
	
	public int getIn_no() {
		return in_no;
	}
	public void setIn_no(int in_no) {
		this.in_no = in_no;
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
