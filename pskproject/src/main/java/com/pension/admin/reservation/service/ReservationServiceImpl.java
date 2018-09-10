package com.pension.admin.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.pay.vo.PayVO;
import com.pension.admin.reservation.dao.ReservationDao;
import com.pension.admin.reservation.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDao reservationDao;

	@Override
	public List<ReservationVO> resList(ReservationVO resvo) {
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
		if(pvo.getA_confirm()==1) {
			pvo.setRes_state("예약완료");
		}else {
			pvo.setRes_state("예약취소");
		}
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
