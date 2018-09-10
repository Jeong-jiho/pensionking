package com.pension.admin.member.service;

import java.util.List;

import com.pension.admin.member.vo.AdminMemberVO;

public interface AdminMemberService {

	public List<AdminMemberVO> memberList(AdminMemberVO amvo);

	public AdminMemberVO memberDetail(AdminMemberVO amvo);

}
