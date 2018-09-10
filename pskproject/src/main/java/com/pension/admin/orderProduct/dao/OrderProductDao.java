package com.pension.admin.orderProduct.dao;

import java.util.List;

import com.pension.admin.orderProduct.vo.OrderProductVO;

public interface OrderProductDao {
	public List<OrderProductVO> orderProductList(OrderProductVO opvo);
	public int orderProductInsert(OrderProductVO opvo);

}
