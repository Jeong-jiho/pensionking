package com.pension.admin.orderProduct.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pension.admin.orderProduct.service.OrderProductService;
import com.pension.admin.orderProduct.vo.OrderProductVO;
import com.pension.admin.stock.service.StockService;
import com.pension.admin.stock.vo.StockVO;


@Controller
@RequestMapping(value="/admin")
public class OrderProductController {
	Logger logger = Logger.getLogger(OrderProductController.class);
	
	@Autowired
	private OrderProductService orderProductService;
	
	@Autowired
	private StockService stockService; 
	
	/*******************************************************************
	 * 발주 리스트(디테일) 구현하기
	 *******************************************************************/
	@RequestMapping(value="/orderProduct/orderProductList.do", method = RequestMethod.GET)
	public String orderProductList(@ModelAttribute("orderProductData") OrderProductVO opvo, Model model) {
		logger.info("orderProduct 호출 성공");
		logger.info("o_no = " + opvo.getO_no());
		
		List<OrderProductVO> orderProductList = orderProductService.orderProductList(opvo);
		model.addAttribute("orderProductList", orderProductList);
		
		return "/admin/orderProduct/orderProductList";
	}
	
	/*******************************************************************
	 * 주문버튼 클릭 후 주문화면(폼)이동 구현하기
	 *******************************************************************/
	@RequestMapping(value="/orderProduct/orderForm.do", method = RequestMethod.GET)
	public String orderForm(OrderProductVO opvo,StockVO svo, Model model) {
		logger.info("orderForm 호출 성공");
		List<StockVO> stockList = stockService.stockList(svo);
		
		model.addAttribute("stockList", stockList);
		
		return "/admin/orderProduct/orderForm";
	}	
}
