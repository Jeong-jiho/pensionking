package com.pension.admin.pay.service;

import java.util.List;

import com.pension.admin.pay.vo.PayVO;

public interface PayService {
	public List<PayVO> payConfirmList(PayVO pvo);
	public PayVO payDetail(PayVO pvo);
	public int payAllUpdate();
	public int payUpdate(PayVO pvo);
	public int payInsert(PayVO pvo);
	public List<PayVO> payAllList(PayVO pvo);
	public int cancelInsert(PayVO pvo);
	public int payDday(PayVO pvo);
	public List<PayVO> myPayList(PayVO pvo);
}
