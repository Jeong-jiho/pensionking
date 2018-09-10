package com.pension.admin.reservation.service;

import java.util.List;

import com.pension.admin.pay.vo.PayVO;
import com.pension.admin.reservation.vo.ReservationVO;

public interface ReservationService {
	public List<ReservationVO> resList(ReservationVO resvo);
	public List<ReservationVO> resStateList(ReservationVO resvo); 
	public int resStateUpdate(PayVO pvo);
	public List<ReservationVO> resRoom(String res_indate);
	public int resInsert(ReservationVO resvo);
	public String getResNo(ReservationVO resvo);
	public int resGnoUpdate(ReservationVO resvo);
}
 