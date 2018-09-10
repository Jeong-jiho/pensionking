package com.pension.admin.pay.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.pay.dao.PayDao;
import com.pension.admin.pay.vo.PayVO;

@Service
public class PayServiceImpl implements PayService{
	@Autowired
	private PayDao payDao;

	@Override
	public List<PayVO> payConfirmList(PayVO pvo) {
		List<PayVO> myList = null;
		myList = payDao.payConfirmList(pvo);
		return myList;
	}

	@Override
	public PayVO payDetail(PayVO pvo) {
		PayVO pay = null;
		pay = payDao.payDetail(pvo);
		return pay;
	}

	@Override
	public int payAllUpdate() {
		int result = 0;
		result = payDao.payAllUpdate();
		return result;
	}

	@Override
	public int payUpdate(PayVO pvo) {
		int result = 0;
		result = payDao.payUpdate(pvo);
		return result;
	}

	@Override
	public int payInsert(PayVO pvo) {
		int result = 0;
		result = payDao.payInsert(pvo);
		return result;
	}

	@Override
	public List<PayVO> payAllList(PayVO pvo) {
		List<PayVO> myList = null;
		myList = payDao.payAllList(pvo);
		return myList;
	}

	@Override
	public int cancelInsert(PayVO pvo) {
		int result = 0;
		result = payDao.cancelInsert(pvo);
		return result;
	}

	@Override
	public int payDday(PayVO pvo) {
		int result = 0;
		result = payDao.payDday(pvo);
		return result;
	}

	@Override
	public List<PayVO> myPayList(PayVO pvo) {
		List<PayVO> myList = null;
		myList = payDao.myPayList(pvo);
		return myList;
	}
}
