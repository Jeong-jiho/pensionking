package com.pension.admin.orderProduct.service;


import java.util.List;

import com.pension.admin.orderProduct.vo.OrderProductVO;

public interface OrderProductService {
	public List<OrderProductVO> orderProductList(OrderProductVO opvo);
	public int orderProductInsert(OrderProductVO opvo);

}
