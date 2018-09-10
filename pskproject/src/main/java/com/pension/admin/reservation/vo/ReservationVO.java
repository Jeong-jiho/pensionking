package com.pension.admin.reservation.vo;

import java.util.List;

import com.pension.admin.room.vo.RoomVO;

public class ReservationVO extends RoomVO{
	private String res_no;
	private String res_date;
	private int res_night;
	private int res_people;
	private int res_price;
	private String res_update;
	private String res_indate="";
	private String res_outdate;
	private String res_bbq;
	private String res_state;
	private String res_no1;
	private String bs;
	private int res_add;
	private int r_price;
	private String res_gno;
	private int r_no1; 
	
	private String schDateType = "";
	private String schStart = "";
	private String schEnd = "";
	private String schState = "";
	private String schText = "";
	private String setYear = "";
	private int schR_no = 0;
	private String schIndate ="";
	
	private int r_noList[] ; 
	 
	
	public String getSchIndate() {
		return schIndate;
	}
	public void setSchIndate(String schIndate) {
		this.schIndate = schIndate;
	}
	public int getSchR_no() {
		return schR_no;
	}
	public void setSchR_no(int schR_no) {
		this.schR_no = schR_no;
	}
	public int[] getR_noList() {
		return r_noList;
	}
	public void setR_noList(int[] r_noList) {
		this.r_noList = r_noList;
	}
	
	private List<ReservationVO> resVoList;

	public String getRes_gno() {
		return res_gno;
	}
	public void setRes_gno(String res_gno) {
		this.res_gno = res_gno;
	}
	public int getR_no1() {
		return r_no1;
	}
	public void setR_no1(int r_no1) {
		this.r_no1 = r_no1;
	}
	public int getR_price() {
		return r_price;
	}
	public void setR_price(int r_price) {
		this.r_price = r_price;
	}
	public int getRes_add() {
		return res_add;
	}
	public void setRes_add(int res_add) {
		this.res_add = res_add;
	}
	public String getBs() {
		return bs;
	}
	public void setBs(String bs) {
		this.bs = bs;
	}
	public String getRes_no1() {
		return res_no1;
	}
	public void setRes_no1(String res_no1) {
		this.res_no1 = res_no1;
	}
	public String getSetYear() {
		return setYear;
	}
	public void setSetYear(String setYear) {
		this.setYear = setYear;
	}
	public String getSchDateType() {
		return schDateType;
	}
	public void setSchDateType(String schDateType) {
		this.schDateType = schDateType;
	}
	public String getSchStart() {
		return schStart;
	}
	public void setSchStart(String schStart) {
		this.schStart = schStart;
	}
	public String getSchEnd() {
		return schEnd;
	}
	public void setSchEnd(String schEnd) {
		this.schEnd = schEnd;
	}
	public String getSchState() {
		return schState;
	}
	public void setSchState(String schState) {
		this.schState = schState;
	}
	public String getSchText() {
		return schText;
	}
	public void setSchText(String schText) {
		this.schText = schText;
	}
	public String getRes_no() {
		return res_no;
	}
	public void setRes_no(String res_no) {
		this.res_no = res_no;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
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
	public int getRes_price() {
		return res_price;
	}
	public void setRes_price(int res_price) {
		this.res_price = res_price;
	}
	public String getRes_update() {
		return res_update;
	}
	public void setRes_update(String res_update) {
		this.res_update = res_update;
	} 
	public String getRes_indate() {
		return res_indate;
	}
	public void setRes_indate(String res_indate) {
		this.res_indate = res_indate;
	}
	public String getRes_outdate() {
		return res_outdate;
	}
	public void setRes_outdate(String res_outdate) {
		this.res_outdate = res_outdate;
	}
	public String getRes_bbq() {
		return res_bbq;
	}
	public void setRes_bbq(String res_bbq) {
		this.res_bbq = res_bbq;
	}
	public String getRes_state() {
		return res_state;
	}
	public void setRes_state(String res_state) {
		this.res_state = res_state;
	}
	public List<ReservationVO> getResVoList() {
		return resVoList;
	}
	public void setResVoList(List<ReservationVO> resVoList) {
		this.resVoList = resVoList;
	}
}
