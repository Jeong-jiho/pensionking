package com.pension.client.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.client.reservation.vo.ReservationVO;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	
	@Autowired
	private SqlSession session;
	
	/**
	 * 예약목록 구현
	 * **/
	@Override
	public List<ReservationVO> reservationList(ReservationVO rvo) {
		return session.selectList("reservationList", rvo);
	}
	
	/**
	 * 예약 입력 구현
	 * **/
	@Override
	public int reservationInsert(ReservationVO rvo) {
		return session.insert("reservationInsert", rvo);
	}
}
