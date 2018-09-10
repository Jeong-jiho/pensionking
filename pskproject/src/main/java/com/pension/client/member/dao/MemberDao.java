package com.pension.client.member.dao;

import com.pension.client.member.vo.MemberSecurity;
import com.pension.client.member.vo.MemberVO;

public interface MemberDao {
	public int securityInsert(MemberSecurity sec);
	public int securityDelete(String m_id);
	public MemberSecurity securitySelect(String m_id);
	public MemberVO memberSelect(String m_id);
	public int memberInsert(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	public int memberDelete(MemberVO mvo);
	public String findIdSelect(MemberVO mvo);

}