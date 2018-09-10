package com.pension.client.login.service;

import com.pension.client.login.vo.LoginVO;

public interface LoginService {
	public LoginVO m_idSelect(String m_id);
	public LoginVO loginSelect(String m_id, String m_pwd);
}