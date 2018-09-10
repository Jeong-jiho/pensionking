package com.pension.client.login.vo;

public class LoginVO {
	private String m_id = "";
	private String m_pwd = "";
	private String m_name = "";
	private int m_no = 0;
	
	public LoginVO() {}

	public LoginVO(String m_id, String m_pwd, String m_name, int m_no) {
		super();
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_no = m_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	@Override
	public String toString() {
		return "LoginVO [m_id=" + m_id + ", m_pwd=" + m_pwd + ", m_name=" + m_name + ", m_no=" + m_no + "]";
	}
}