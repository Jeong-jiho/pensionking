package com.pension.admin.login.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.login.vo.AdminLoginVO;
import com.pension.admin.login.dao.AdminLoginDao;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	Logger logger = Logger.getLogger(AdminLoginServiceImpl.class);
	
	@Autowired
	private AdminLoginDao adminLoginDao;

	@Override
	public AdminLoginVO owner_idSelect(String owner_id) {
		return adminLoginDao.owner_idSelect(owner_id);
	}

	@Override
	public AdminLoginVO loginSelect(AdminLoginVO alvo) {

		AdminLoginVO vo = new AdminLoginVO();
		vo.setOwner_id(alvo.getOwner_id());
		vo.setOwner_pwd(alvo.getOwner_pwd());

		vo = adminLoginDao.loginSelect(alvo);
		return vo;
	}
}