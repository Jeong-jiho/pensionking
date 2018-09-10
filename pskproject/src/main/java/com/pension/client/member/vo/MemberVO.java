package com.pension.client.member.vo;

import java.sql.Timestamp;

import com.pension.client.login.vo.LoginVO;

public class MemberVO extends LoginVO {
	private String m_gender = "";
	private String m_phone = "";
	private String m_email = "";
	private String m_address = "";
	private Timestamp m_date;
	private Timestamp m_update;
	private Timestamp m_retiredate;
	private String m_status;
	private String oldM_pwd;
	private String m_date1;
	
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public Timestamp getM_date() {
		return m_date;
	}
	public void setM_date(Timestamp m_date) {
		this.m_date = m_date;
	}
	public Timestamp getM_update() {
		return m_update;
	}
	public void setM_update(Timestamp m_update) {
		this.m_update = m_update;
	}
	public Timestamp getM_retiredate() {
		return m_retiredate;
	}
	public void setM_retiredate(Timestamp m_retiredate) {
		this.m_retiredate = m_retiredate;
	}
	public String getM_status() {
		return m_status;
	}
	public void setM_status(String m_status) {
		this.m_status = m_status;
	}
	public String getOldM_pwd() {
		return oldM_pwd;
	}
	public void setOldM_pwd(String oldM_pwd) {
		this.oldM_pwd = oldM_pwd;
	}
	public String getM_date1() {
		return m_date1;
	}
	public void setM_date1(String m_date1) {
		this.m_date1 = m_date1;
	}
	@Override
	public String toString() {
		return "MemberVO [m_gender=" + m_gender + ", m_phone=" + m_phone + ", m_email=" + m_email + ", m_address="
				+ m_address + ", m_date=" + m_date + ", m_update=" + m_update + ", m_retiredate=" + m_retiredate
				+ ", m_status=" + m_status + ", oldM_pwd=" + oldM_pwd + ", clause=" + "]";
	}
}