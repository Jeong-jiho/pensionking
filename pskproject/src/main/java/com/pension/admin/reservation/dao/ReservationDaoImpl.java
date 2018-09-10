package com.pension.admin.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.admin.pay.vo.PayVO;
import com.pension.admin.reservation.vo.ReservationVO;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<ReservationVO> resList(ReservationVO resvo) {
		return session.selectList("resList",resvo);
	}

	@Override
	public List<ReservationVO> resStateList(ReservationVO resvo) {
		return session.selectList("resStateList" ,resvo);
	}

	@Override
	public int resStateUpdate(PayVO pvo) {
		return (Integer)session.update("resStateUpdate",pvo);
	}

	@Override
	public List<ReservationVO> resRoom(String res_indate) {
		return session.selectList("resRoom",res_indate);
	}

	@Override
	public int resInsert(ReservationVO resvo) {
		return session.insert("resInsert",resvo);
	}

	@Override
	public String getResNo(ReservationVO resvo) {
		return (String)session.selectOne("getResNo",resvo);
	}

	@Override
	public int resGnoUpdate(ReservationVO resvo) {
		return session.update("resGnoUpdate",resvo);
	}


}
