package com.pension.admin.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.admin.order.vo.OrderVO;
import com.pension.admin.orderProduct.vo.OrderProductVO;

@Repository
public class OrderDaoImpl implements OrderDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<OrderVO> orderList(OrderVO ovo) {
	
		return session.selectList("orderList", ovo);
	}

	@Override
	public int orderInsert(OrderProductVO opvo) {

		return session.insert("orderInsert", opvo);
	}

}
