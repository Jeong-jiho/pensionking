package com.pension.admin.price.service;

import com.pension.admin.room.vo.RoomVO;

public interface PriceService {
	public RoomVO priceSelect(int r_no);
	public int priceInsert(RoomVO rvo);
	public int priceUpdate(RoomVO rvo);
	public int priceDelete(RoomVO rvo);
}
