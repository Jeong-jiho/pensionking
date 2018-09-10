package com.pension.admin.order.vo;

import com.pension.admin.stock.vo.StockVO;

public class OrderVO extends StockVO{
	private int 	o_no;		//���ֹ�ȣ
	private String 	o_date;		//��������
	private int 	o_ea;		//����ǰ����
	private String 	o_price;	//���ֱݾ�
	private String 	o_update;	//���ּ�����
	
	
	
	
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
