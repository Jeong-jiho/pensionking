package com.pension.client.member.service;

import com.pension.client.member.vo.MemberVO;

public interface MemberService {
	public int memberInsert(MemberVO mvo);
	public MemberVO memberSelect(String m_id);
	public int m_idConfirm(String m_id);
	public int memberUpdate(MemberVO mvo);
	public int memberDelete(MemberVO mvo);
	public String findId(String m_name, String m_phone);
}