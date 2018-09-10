package com.pension.admin.member.vo;

import com.pension.common.vo.CommonVO;

public class AdminMemberVO extends CommonVO{
	   private int m_no = 0;       			// 회원번호
	   private String m_name 		= "";	// 회원이름
	   private String m_phone 		= "";	// 회원연락처
	   private String m_gender 		= "";	// 회원성별
	   private String m_email 		= "";	// 회원이메일
	   private String m_id 			= "";	// 회원아이디
	   private String m_pwd 		= "";	// 회원비밀번호
	   private String m_date 		= "";	// 회원가입일자
	   private String m_update 		= "";	// 회원수정일자
	   private String m_retiredate 	= "";	// 회원탈퇴일자
	   private int m_status 		= 0;	// 회원상태번호
	   
	   
	   
	   
	@Override
	public String toString() {
		return "AdminMemberVO [m_no=" + m_no + ", m_name=" + m_name + ", m_phone=" + m_phone + ", m_gender=" + m_gender
				+ ", m_email=" + m_email + ", m_address=" + ", m_id=" + m_id + ", m_pwd=" + m_pwd
				+ ", m_date=" + m_date + ", m_update=" + m_update + ", m_retiredate=" + m_retiredate + ", m_status="
				+ m_status + "]";
	}
	
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
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
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	public String getM_update() {
		return m_update;
	}
	public void setM_update(String m_update) {
		this.m_update = m_update;
	}
	public String getM_retiredate() {
		return m_retiredate;
	}
	public void setM_retiredate(String m_retiredate) {
		this.m_retiredate = m_retiredate;
	}
	public int getM_status() {
		return m_status;
	}
	public void setM_status(int m_status) {
		this.m_status = m_status;
	}

}
