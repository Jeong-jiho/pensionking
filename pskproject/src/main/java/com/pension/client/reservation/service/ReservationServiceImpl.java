package com.pension.client.reservation.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.client.reservation.dao.ReservationDao;
import com.pension.client.reservation.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {
	Logger logger = Logger.getLogger(ReservationServiceImpl.class);
	
	@Autowired
	private ReservationDao reservationDao;
	
	
	//예약 목록 구현
	@Override
	public List<ReservationVO> reservationList(ReservationVO rvo) {
		// TODO Auto-generated method stub
		
		List<ReservationVO> myList = null;
		
		myList = reservationDao.reservationList(rvo);
		
		return myList;
	}
	
	/**
	 * 예약 입력 구현
	 * **/
	@Override
	public int reservationInsert(ReservationVO rvo) {
		int result = 0;
		try {
			result = reservationDao.reservationInsert(rvo);
		} catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
}
