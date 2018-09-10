package com.pension.client.reservation.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.pay.vo.PayVO;
import com.pension.admin.reservation.dao.ReservationDao;
import com.pension.admin.reservation.vo.ReservationVO;
import com.pension.admin.room.vo.RoomVO;


@Service
public class ClientReservationServiceImpl implements ClientReservationService {
	Logger logger = Logger.getLogger(ClientReservationServiceImpl.class);

	@Autowired
	private ReservationDao reservationDao;


	//예약 목록 구현
	@Override
	public List<ReservationVO> resList(ReservationVO resvo) {
		// TODO Auto-generated method stub

		List<ReservationVO> myList = null;

		myList = reservationDao.resList(resvo);

		return myList;
	}

	@Override
	public List<ReservationVO> resStateList(ReservationVO resvo) {
		List<ReservationVO> myList = null;
		myList = reservationDao.resStateList(resvo);
		return myList;
	}

	@Override
	public int resStateUpdate(PayVO pvo) {
		int result = 0;
		result = reservationDao.resStateUpdate(pvo);
		return result;
	} 
	
	@Override
	public List<ReservationVO> resRoom(String res_indate) {
		List<ReservationVO> myList = null;
		myList = reservationDao.resRoom(res_indate);
		return myList;
	} 
	
	@Override
	public int resInsert(ReservationVO resvo) {
		int result = 0;
		result = reservationDao.resInsert(resvo);
		return result;
	} 
	
	@Override
	public String getResNo(ReservationVO resvo) {
		String result="";
		result = reservationDao.getResNo(resvo);
		return result;
	}

	@Override
	public int resGnoUpdate(ReservationVO resvo) {
		int result = 0;
		result = reservationDao.resGnoUpdate(resvo);
		return result;
	}

}
