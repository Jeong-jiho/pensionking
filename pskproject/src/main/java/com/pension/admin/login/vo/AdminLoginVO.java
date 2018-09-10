package com.pension.admin.login.vo;

public class AdminLoginVO {
	private String owner_id = "";
	private String owner_pwd = "";
	private String owner_name = "";
	private int owner_no = 0;
	
	public AdminLoginVO() {}

	public AdminLoginVO(String owner_id, String owner_pwd, String owner_name, int owner_no) {
		super();
		this.owner_id = owner_id;
		this.owner_pwd = owner_pwd;
		this.owner_name = owner_name;
		this.owner_no = owner_no;
	}

	public String getOwner_id() {
		return owner_id;
	}

	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}

	public String getOwner_pwd() {
		return owner_pwd;
	}

	public void setOwner_pwd(String owner_pwd) {
		this.owner_pwd = owner_pwd;
	}

	public String getOwner_name() {
		return owner_name;
	}

	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}

	public int getOwner_no() {
		return owner_no;
	}

	public void setOwner_no(int owner_no) {
		this.owner_no = owner_no;
	}

	@Override
	public String toString() {
		return "AdminLoginVO [owner_id=" + owner_id + ", owner_pwd=" + owner_pwd + ", owner_name=" + owner_name
				+ ", owner_no=" + owner_no + "]";
	}
}