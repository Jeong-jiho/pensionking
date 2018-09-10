package com.pension.client.login.dao;

import com.pension.client.login.vo.LoginVO;

public interface LoginDao {
	public LoginVO m_idSelect(String m_id);
	public LoginVO loginSelect(LoginVO lvo);
}