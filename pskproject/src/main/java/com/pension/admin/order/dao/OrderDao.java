package com.pension.admin.order.dao;

import java.util.List;

import com.pension.admin.order.vo.OrderVO;
import com.pension.admin.orderProduct.vo.OrderProductVO;

public interface OrderDao {
	
	public List<OrderVO> orderList(OrderVO ovo);
	public int orderInsert(OrderProductVO opvo);
}
