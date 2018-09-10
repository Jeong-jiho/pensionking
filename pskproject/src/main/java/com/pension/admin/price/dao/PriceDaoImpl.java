package com.pension.admin.price.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.admin.room.vo.RoomVO;

@Repository
public class PriceDaoImpl implements PriceDao {
	@Autowired
	private SqlSession session;

	@Override
	public RoomVO priceSelect(int r_no) {
		return (RoomVO)session.selectOne("priceSelect", r_no);
	}

	@Override 
	public int priceInsert(RoomVO rvo) {
		return (Integer)session.insert("priceInsert",rvo);
	}

	@Override
	public int priceUpdate(RoomVO rvo) {
		return (Integer)session.update("priceUpdate",rvo);
	}

	@Override
	public int priceDelete(RoomVO rvo) {
		return (Integer)session.delete("priceDelete",rvo);
	}
}
