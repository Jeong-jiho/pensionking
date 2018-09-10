package com.pension.client.login.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.client.login.dao.LoginDao;
import com.pension.client.login.vo.LoginVO;
import com.pension.client.member.dao.MemberDao;
import com.pension.client.member.vo.MemberSecurity;
import com.pension.common.util.OpenCrypt;

@Service
public class LoginServiceImpl implements LoginService {
	Logger logger = Logger.getLogger(LoginServiceImpl.class);
	
	@Autowired
	private LoginDao loginDao;

	@Autowired
	private MemberDao memberDao;

	@Override
	public LoginVO m_idSelect(String m_id) {
		return loginDao.m_idSelect(m_id);
	}

	// 로그인 처리 메서드
	@Override
	public LoginVO loginSelect(String m_id, String m_pwd) {
		LoginVO vo = null;
		MemberSecurity sec = memberDao.securitySelect(m_id);
		if(sec != null) {
			m_pwd = new String(OpenCrypt.getSHA256(m_pwd, sec.getSalt()));
			
			LoginVO lvo = new LoginVO();
			lvo.setM_id(m_id);;
			lvo.setM_pwd(m_pwd);
			
			vo = loginDao.loginSelect(lvo);
		}
		return vo;
	}
}