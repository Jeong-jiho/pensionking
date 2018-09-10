package com.pension.admin.stock.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.stock.dao.StockDao;
import com.pension.admin.stock.vo.StockVO;

@Service
public class StockServiceImpl implements StockService{
	Logger logger = Logger.getLogger(StockServiceImpl.class);
	
	@Autowired
	private StockDao stockDao;
	
	//재고 조회 구현
	@Override
	public List<StockVO> stockList(StockVO svo) {
		List<StockVO> sList = null;
		
		sList = stockDao.stockList(svo);
		
		return sList;
	}
	
	//재고 입력 구현
	@Override
	public int stockInsert(StockVO svo) {
		int result=0;
		try {
			result = stockDao.stockInsert(svo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	//재고 수정 구현
	@Override
	public int stockUpdate(StockVO svo) {
		int result = 0;
		try {
			result = stockDao.stockUpdate(svo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	//재고 삭제 구현
	@Override
	public int stockDelete(Integer s_no) {
		int result = 0;
		try {
			result = stockDao.stockDelete(s_no);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
}
