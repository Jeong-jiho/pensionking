package com.pension.admin.orderProduct.vo;

import com.pension.admin.order.vo.OrderVO;

public class OrderProductVO extends OrderVO{
	private String 	op_name 	= "";	//주문상품명		
	private int 	op_ea 		= 0;	//주문상품수량
	private String 	op_price 	= "";	//주문상품가격
	private String  op_sumprice	= "";	//주문상품합산가격
	
	
	
	
	public String getOp_name() {
		return op_name;
	}
	public void setOp_name(String op_name) {
		this.op_name = op_name;
	}
	public int getOp_ea() {
		return op_ea;
	}
	public void setOp_ea(int op_ea) {
		this.op_ea = op_ea;
	}
	public String getOp_price() {
		return op_price;
	}
	public void setOp_price(String op_price) {
		this.op_price = op_price;
	}
	public String getOp_sumprice() {
		return op_sumprice;
	}
	public void setOp_sumprice(String op_sumprice) {
		this.op_sumprice = op_sumprice;
	}
}
