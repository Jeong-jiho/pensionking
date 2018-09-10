package com.pension.admin.stock.dao;

import java.util.List;

import com.pension.admin.stock.vo.StockVO;

public interface StockDao {
	public List<StockVO> stockList(StockVO svo);
	public int stockInsert(StockVO svo);
	public int stockUpdate(StockVO svo);
	public int stockDelete(Integer s_no);
}
