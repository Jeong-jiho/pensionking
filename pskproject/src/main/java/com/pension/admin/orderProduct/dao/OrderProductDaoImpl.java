package com.pension.admin.orderProduct.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.admin.orderProduct.vo.OrderProductVO;

@Repository
public class OrderProductDaoImpl implements OrderProductDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<OrderProductVO> orderProductList(OrderProductVO opvo) {
		
		return session.selectList("orderProductList", opvo);
	}

	@Override
	public int orderProductInsert(OrderProductVO opvo) {

		return session.insert("orderProductInsert", opvo);
	}


}
