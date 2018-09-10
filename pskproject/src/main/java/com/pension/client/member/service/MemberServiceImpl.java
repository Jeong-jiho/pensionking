package com.pension.client.member.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pension.client.member.dao.MemberDao;
import com.pension.client.member.vo.MemberSecurity;
import com.pension.client.member.vo.MemberVO;
import com.pension.common.util.OpenCrypt;
import com.pension.common.util.Util;

@Service
public class MemberServiceImpl implements MemberService {
	Logger logger = Logger.getLogger(MemberServiceImpl.class);

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int m_idConfirm(String m_id) {
		int result;
		if(memberDao.memberSelect(m_id) != null) {
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}

	@Transactional
	@Override
	public int memberInsert(MemberVO mvo) {
		if(memberDao.memberSelect(mvo.getM_id()) != null) {
			throw new RuntimeException();
		} else {
			MemberSecurity sec = new MemberSecurity();
			sec.setUserId(mvo.getM_id());
			sec.setSalt(Util.getRandomString());
			memberDao.securityInsert(sec);

			mvo.setM_pwd(new String(OpenCrypt.getSHA256(mvo.getM_pwd(), sec.getSalt())));
			int result = memberDao.memberInsert(mvo);
			return result;
		}
	}

	@Override
	public MemberVO memberSelect(String m_id) {
		MemberVO member = null;
		member = memberDao.memberSelect(m_id);
		return member;
	}
	
	@Transactional
	@Override
	public int memberUpdate(MemberVO mvo) {
		if(!mvo.getM_pwd().isEmpty()) {
			MemberSecurity sec = memberDao.securitySelect(mvo.getM_id());
			mvo.setM_pwd(new String(OpenCrypt.getSHA256(mvo.getM_pwd(), sec.getSalt())));
		}
		int result = memberDao.memberUpdate(mvo);
		return result;
	}

	@Transactional
	@Override
	public int memberDelete(MemberVO mvo) {
		int result = memberDao.memberDelete(mvo);
		return result;
	}
	
	   @Override
	   public String findId(String m_name, String m_phone) {
	      MemberVO mvo = new MemberVO();
	      mvo.setM_name(m_name);
	      mvo.setM_phone(m_phone);

	      logger.info("m_name : " + m_name);

	      String m_id = memberDao.findIdSelect(mvo);
	      logger.info("mvo : " + mvo);
	      logger.info("m_id : " + m_id);

	      LoginVO lvo = new LoginVO();
	      lvo.setM_id(m_id);
	      logger.info("lvo : " + lvo);

	      if(m_id == null) {
	         logger.info("가입된 아이디가 없습니다.");         
	         return null;
	      } else {
	         logger.info("성공");
	         return m_id;
	      }
	   }
}