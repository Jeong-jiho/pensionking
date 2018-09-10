package com.pension.admin.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pension.admin.order.service.OrderService;
import com.pension.admin.order.vo.OrderVO;
import com.pension.admin.orderProduct.service.OrderProductService;
import com.pension.admin.orderProduct.vo.OrderProductVO;

@Controller
@RequestMapping(value="/admin")
public class OrderController {
	Logger logger = Logger.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderProductService orderProductService;
	
	/*******************************************************************
	 * 발주 리스트 구현하기
	 *******************************************************************/
	@RequestMapping(value="/order/orderList.do", method = RequestMethod.GET)
	public String orderList(@ModelAttribute("orderData") OrderVO ovo, Model model) {
		logger.info("orderList 호출 성공");
		logger.info("o_no = " + ovo.getO_no());
		
		List<OrderVO> orderList = orderService.orderList(ovo);
		model.addAttribute("orderList", orderList);
		
		return "/admin/order/orderList";
	}
	
	/*******************************************************************
	 * 발주 등록(폼) 구현하기
	 *******************************************************************/
	@RequestMapping(value="/order/insertForm.do")
	public String orderInsertForm() {
		logger.info("insertForm 호출 성공");
		return "admin/order/insertForm";
	}
	
	/***********************************************************************
	    * 발주등록 구현하기
	    ***********************************************************************/
	   @RequestMapping(value = "/order/orderInsert.do", method = RequestMethod.POST)
	   public String orderInsert(OrderProductVO opvo, @RequestParam String b_number) {
	      logger.info("orderInsert 호출 성공");
	      String[] b_num = b_number.split(",");
	      int result = 0;
	      
	      result = orderService.orderInsert(opvo, b_num);
	      
	      if(result == 1) {   
	         return "redirect:/admin/order/orderList.do";
	      }else {
	         return "redirect:/admin/orderProduct/orderForm.do";
	      }
	   }
}