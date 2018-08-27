package com.pension.client.reservation.vo;

import java.util.Date;

public class ReservationVO {
	
	private int res_no = 0;
	private int r_no = 0;
	private int m_no = 0;
	private Date res_date;
	private int res_night = 0;
	private int res_people = 0;
	private String res_price = "";
	private Date res_update;
	private Date res_indate;
	private Date res_outdate;
	private String res_bbq = "";
	
	
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	public int getRes_night() {
		return res_night;
	}
	public void setRes_night(int res_night) {
		this.res_night = res_night;
	}
	public int getRes_people() {
		return res_people;
	}
	public void setRes_people(int res_people) {
		this.res_people = res_people;
	}
	public String getRes_price() {
		return res_price;
	}
	public void setRes_price(String res_price) {
		this.res_price = res_price;
	}
	public Date getRes_update() {
		return res_update;
	}
	public void setRes_update(Date res_update) {
		this.res_update = res_update;
	}
	public Date getRes_indate() {
		return res_indate;
	}
	public void setRes_indate(Date res_indate) {
		this.res_indate = res_indate;
	}
	public Date getRes_outdate() {
		return res_outdate;
	}
	public void setRes_outdate(Date res_outdate) {
		this.res_outdate = res_outdate;
	}
	public String getRes_bbq() {
		return res_bbq;
	}
	public void setRes_bbq(String res_bbq) {
		this.res_bbq = res_bbq;
	}
	
}
