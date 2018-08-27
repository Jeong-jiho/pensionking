package com.pension.client.reservation.dao;

import java.util.List;

import com.pension.client.reservation.vo.ReservationVO;

public interface ReservationDao {
	public List<ReservationVO> reservationList(ReservationVO rvo);
	
	public int reservationInsert(ReservationVO rvo);
}
