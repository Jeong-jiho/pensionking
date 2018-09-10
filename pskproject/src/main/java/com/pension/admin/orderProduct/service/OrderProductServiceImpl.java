package com.pension.admin.orderProduct.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.orderProduct.dao.OrderProductDao;
import com.pension.admin.orderProduct.vo.OrderProductVO;

@Service
public class OrderProductServiceImpl implements OrderProductService {
Logger logger = Logger.getLogger(OrderProductServiceImpl.class);

	@Autowired
	private OrderProductDao orderProductDao;
	
	//주문상품 조회 구현
	@Override
	public List<OrderProductVO> orderProductList(OrderProductVO opvo) {
		List<OrderProductVO> opList = null;
		
		opList = orderProductDao.orderProductList(opvo);
		
		return opList;
	}

	@Override
	public int orderProductInsert(OrderProductVO opvo) {
		int result = 0;
		try {
			result = orderProductDao.orderProductInsert(opvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}


	
}

