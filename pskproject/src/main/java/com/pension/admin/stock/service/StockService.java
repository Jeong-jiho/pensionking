package com.pension.admin.stock.service;

import java.util.List;

import com.pension.admin.stock.vo.StockVO;

public interface StockService {
	public List<StockVO> stockList(StockVO svo);
	public int stockInsert(StockVO svo);
	public int stockUpdate(StockVO svo);
	public int stockDelete(Integer s_no);

	

}
