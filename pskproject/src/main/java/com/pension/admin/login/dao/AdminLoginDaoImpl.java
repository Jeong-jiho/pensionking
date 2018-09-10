package com.pension.admin.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pension.admin.login.vo.AdminLoginVO;

public class AdminLoginDaoImpl implements AdminLoginDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public AdminLoginVO owner_idSelect(String owner_id) {
		return (AdminLoginVO) session.selectOne("owner_idSelect", owner_id);
	}

	@Override
	public AdminLoginVO loginSelect(AdminLoginVO alvo) {
		return (AdminLoginVO) session.selectOne("loginSelect", alvo);
	}
}