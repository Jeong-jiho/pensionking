package com.pension.admin.order.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.order.dao.OrderDao;
import com.pension.admin.order.vo.OrderVO;
import com.pension.admin.orderProduct.dao.OrderProductDao;
import com.pension.admin.orderProduct.vo.OrderProductVO;
import com.pension.admin.stock.vo.StockVO;

@Service
public class OrderServiceImpl implements OrderService{
Logger logger = Logger.getLogger(OrderServiceImpl.class);
	
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderProductDao orderProductDao;
	
	//재고 조회 구현
	@Override
	public List<OrderVO> orderList(OrderVO ovo) {
		List<OrderVO> oList = null;
		
		oList = orderDao.orderList(ovo);
		
		return oList;
	}

		//발주 등록 구현
		@Override
		public int orderInsert(OrderProductVO opvo, String[] b_num) {
			logger.info("orderInsert 성공");
			int result = 0;
			try {
				for(int i=0; i<b_num.length; i++) {
				opvo.setO_no(Integer.parseInt(b_num[i]));
				result = orderProductDao.orderProductInsert(opvo);
				result = orderDao.orderInsert(opvo);
				}
			}catch(Exception e) {
				e.printStackTrace();
				result = 0;
			}
			return result;
		}
}
