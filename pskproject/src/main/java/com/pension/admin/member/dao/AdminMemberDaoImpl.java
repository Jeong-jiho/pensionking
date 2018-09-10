package com.pension.admin.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.admin.member.vo.AdminMemberVO;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<AdminMemberVO> memberList(AdminMemberVO amvo) {
		
		return session.selectList("memberList", amvo);
	}

	@Override
	public AdminMemberVO memberDetail(AdminMemberVO amvo) {
		
		return session.selectOne("memberDetail", amvo);
	}

}
