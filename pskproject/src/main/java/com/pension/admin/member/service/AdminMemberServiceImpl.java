package com.pension.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.member.dao.AdminMemberDao;
import com.pension.admin.member.vo.AdminMemberVO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	private AdminMemberDao adminMemberDao;

	@Override
	public List<AdminMemberVO> memberList(AdminMemberVO amvo) {
		List<AdminMemberVO> amList = null;
		
		amList = adminMemberDao.memberList(amvo);
		return amList;
	}

	@Override
	public AdminMemberVO memberDetail(AdminMemberVO amvo) {
		AdminMemberVO detail = null;
		detail = adminMemberDao.memberDetail(amvo);
		
		return detail;
	}

}
