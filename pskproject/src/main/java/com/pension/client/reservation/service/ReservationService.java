package com.pension.client.reservation.service;

import java.util.List;

import com.pension.client.reservation.vo.ReservationVO;

public interface ReservationService {
	public List<ReservationVO> reservationList(ReservationVO rvo);
	
	public int reservationInsert(ReservationVO rvo);
}
