package com.pension.admin.login.service;

import com.pension.admin.login.vo.AdminLoginVO;

public interface AdminLoginService {
	public AdminLoginVO owner_idSelect(String owner_id);
	public AdminLoginVO loginSelect(AdminLoginVO alvo);
}