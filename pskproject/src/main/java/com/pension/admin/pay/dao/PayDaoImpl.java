package com.pension.admin.pay.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.admin.pay.vo.PayVO;

@Repository
public class PayDaoImpl implements PayDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<PayVO> payConfirmList(PayVO pvo) {
		return session.selectList("payConfirmList", pvo);
	}

	@Override
	public PayVO payDetail(PayVO pvo) {
		return (PayVO)session.selectOne("payDetail",pvo);
	}

	@Override
	public int payAllUpdate() {
		return (Integer)session.update("payAllUpdate");
	}

	@Override
	public int payUpdate(PayVO pvo) {
		return (Integer)session.update("payUpdate",pvo);
	}

	@Override
	public int payInsert(PayVO pvo) {
		return session.insert("payInsert",pvo);
	}

	@Override
	public List<PayVO> payAllList(PayVO pvo) {
		return session.selectList("payAllList",pvo);
	}

	@Override
	public int cancelInsert(PayVO pvo) {
		return session.insert("cancelInsert",pvo);
	}

	@Override
	public int payDday(PayVO pvo) {
		return (Integer)session.selectOne("payDday",pvo);
	}

	@Override
	public List<PayVO> myPayList(PayVO pvo) {
		return session.selectList("myPayList",pvo);
	}
}
