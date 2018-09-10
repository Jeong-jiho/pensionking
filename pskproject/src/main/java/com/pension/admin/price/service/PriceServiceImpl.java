package com.pension.admin.price.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.price.dao.PriceDao;
import com.pension.admin.room.vo.RoomVO;

@Service
public class PriceServiceImpl implements PriceService {
	@Autowired
	private PriceDao priceDao;

	@Override
	public RoomVO priceSelect(int r_no) {
		RoomVO price = null;
		price = priceDao.priceSelect(r_no);
		return price;	
	}

	@Override
	public int priceInsert(RoomVO rvo) {
		int result = 0;
		result = priceDao.priceInsert(rvo); 
		return result;
	}

	@Override
	public int priceUpdate(RoomVO rvo) {
		int result = 0;
		result = priceDao.priceUpdate(rvo);
		return result;
	}

	@Override
	public int priceDelete(RoomVO rvo) {
		int result = 0;
		result = priceDao.priceDelete(rvo);
		return result;
	}
}
