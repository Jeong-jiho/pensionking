package com.pension.admin.stock.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.admin.stock.vo.StockVO;

@Repository
public class StockDaoImpl implements StockDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<StockVO> stockList(StockVO svo) {
		return session.selectList("stockList", svo);
	}
	
	//글 입력 구현
	@Override
	public int stockInsert(StockVO svo) {
		
		return session.insert("stockInsert", svo);
	}

	@Override
	public int stockUpdate(StockVO svo) {
		return session.update("stockUpdate", svo);
	}
 
	@Override
	public int stockDelete(Integer s_no) {
		return session.delete("stockDelete", s_no);
	}
}
