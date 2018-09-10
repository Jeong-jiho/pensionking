package com.pension.admin.pay.vo;

import java.util.List;

import com.pension.admin.reservation.vo.ReservationVO;

public class PayVO extends ReservationVO{
	private int pay_no ;
	private String pay_bank;
	private String pay_acc;
	private String pay_date;
	private int pay_price;
	private int a_confirm;
	private String res_no;
	private String[] res_noList;
	private int c_no; 
    private String c_date; 
    private double c_price;
    private int dday;
    
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public double getC_price() {
		return c_price;
	}
	public void setC_price(double c_price) {
		this.c_price = c_price;
	}
    	
	public String[] getRes_noList() {
		return res_noList;
	}
	public void setRes_noList(String[] res_noList) {
		this.res_noList = res_noList;
	}
	public int getPay_no() { 
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public String getPay_bank() {
		return pay_bank;
	} 
	public void setPay_bank(String pay_bank) {
		this.pay_bank = pay_bank;
	}
	public String getPay_acc() {
		return pay_acc;
	}
	public void setPay_acc(String pay_acc) {
		this.pay_acc = pay_acc;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public int getA_confirm() {
		return a_confirm;
	}
	public void setA_confirm(int a_confirm) {
		this.a_confirm = a_confirm;
	}
	public String getRes_no() {
		return res_no;
	}
	public void setRes_no(String res_no) {
		this.res_no = res_no;
	}
	
	
}
