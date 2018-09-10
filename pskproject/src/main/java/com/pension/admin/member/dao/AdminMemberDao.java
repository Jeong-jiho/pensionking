package com.pension.admin.member.dao;

import java.util.List;


import com.pension.admin.member.vo.AdminMemberVO;

public interface AdminMemberDao {

	public List<AdminMemberVO> memberList(AdminMemberVO amvo);
	public AdminMemberVO memberDetail(AdminMemberVO amvo);


}
