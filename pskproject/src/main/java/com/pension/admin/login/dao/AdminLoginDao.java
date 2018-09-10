package com.pension.admin.login.dao;

import com.pension.admin.login.vo.AdminLoginVO;

public interface AdminLoginDao {
	public AdminLoginVO owner_idSelect(String owner_id);
	public AdminLoginVO loginSelect(AdminLoginVO alvo);
}