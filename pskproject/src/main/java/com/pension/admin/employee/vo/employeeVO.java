package com.pension.admin.employee.vo;

import com.pension.admin.job.vo.jobVO;

public class employeeVO extends jobVO{
	private int 	e_no;			//직원번호			
	private String 	e_name;			//직원이름
	private String 	e_phone;		//직원연락처
	private String 	e_gender;		//직원성별
	private String 	e_birth;		//직원생년월일
	private String 	e_address;		//직원주소
	private String 	e_hiredate;		//직원입사일
	private String 	e_retiredate;	//직원퇴사일
	private int 	e_status;		//직원근무상태
	private int 	j_no;			//직무번호
	private String 	e_price;		//직원월급
	private String 	e_update;		//직원수정일
	private String 	e_date;			//직원등록일
	
	
	
	
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getE_phone() {
		return e_phone;
	}
	public void setE_phone(String e_phone) {
		this.e_phone = e_phone;
	}
	public String getE_gender() {
		return e_gender;
	}
	public void setE_gender(String e_gender) {
		this.e_gender = e_gender;
	}
	public String getE_birth() {
		return e_birth;
	}
	public void setE_birth(String e_birth) {
		this.e_birth = e_birth;
	}
	public String getE_address() {
		return e_address;
	}
	public void setE_address(String e_address) {
		this.e_address = e_address;
	}
	public String getE_hiredate() {
		return e_hiredate;
	}
	public void setE_hiredate(String e_hiredate) {
		this.e_hiredate = e_hiredate;
	}
	public String getE_retiredate() {
		return e_retiredate;
	}
	public void setE_retiredate(String e_retiredate) {
		this.e_retiredate = e_retiredate;
	}
	public int getE_status() {
		return e_status;
	}
	public void setE_status(int e_status) {
		this.e_status = e_status;
	}
	public int getJ_no() {
		return j_no;
	}
	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}
	public String getE_price() {
		return e_price;
	}
	public void setE_price(String e_price) {
		this.e_price = e_price;
	}
	public String getE_update() {
		return e_update;
	}
	public void setE_update(String e_update) {
		this.e_update = e_update;
	}
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
	}
}
