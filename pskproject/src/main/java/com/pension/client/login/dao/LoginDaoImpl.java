package com.pension.client.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.client.login.vo.LoginVO;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	private SqlSession session;

	@Override
	public LoginVO m_idSelect(String m_id) {
		return (LoginVO) session.selectOne("m_idSelect", m_id);
	}

	@Override
	public LoginVO loginSelect(LoginVO lvo) {
		return (LoginVO) session.selectOne("loginSelect", lvo);
	}
}