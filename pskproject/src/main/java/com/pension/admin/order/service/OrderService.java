package com.pension.admin.order.service;

import java.util.List;

import com.pension.admin.order.vo.OrderVO;
import com.pension.admin.orderProduct.vo.OrderProductVO;

public interface OrderService {

	public List<OrderVO> orderList(OrderVO ovo);
	public int orderInsert(OrderProductVO opvo, String[] b_num);
}
