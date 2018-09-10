package com.pension.admin.stock.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pension.admin.stock.service.StockService;
import com.pension.admin.stock.vo.StockVO;

@Controller
@RequestMapping(value="/admin")
public class StockController {
	Logger logger = Logger.getLogger(StockController.class);

	@Autowired
	private StockService stockService;
	
	/*******************************************************************
	 * 재고 리스트 구현하기
	 *******************************************************************/
	@RequestMapping(value="/stock/stockList.do", method = RequestMethod.GET)
	public String stockList(@ModelAttribute("stockData") StockVO svo, Model model) {
		logger.info("stockList 호출 성공");
		logger.info("s_no = " + svo.getS_no());
		
		List<StockVO> stockList = stockService.stockList(svo);
		model.addAttribute("stockList", stockList);
		
		return "admin/stock/stockList";
	}
	
	/*******************************************************************
	 * 재고품 추가
	 *******************************************************************/
	@RequestMapping(value="/stock/stockInsert.do", method=RequestMethod.POST)
	public String stockInsert(StockVO svo, Model model, HttpServletRequest request) throws IllegalStateException, IOException{
		logger.info("stockInsert 호출 성공");
		
		 int result = 0;
		 String url="";
		 
		 result = stockService.stockInsert(svo);
		 if(result == 1) {
			 url="redirect:/admin/stock/stockList.do";
		 }else {
			 //model.addAttribute("code",1);
			 url="/admin/stock/stockList.do";
		 }
		 return url;
		   
	   }
	
	/*******************************************************************
	 * 재고품 수정
	 *******************************************************************/
	@ResponseBody
	@RequestMapping(value="/stock/{s_no}.do", method=RequestMethod.PUT)
	public ResponseEntity<String> stockUpdate(@PathVariable("s_no") Integer s_no, @RequestBody StockVO svo){
		logger.info("stockUpdate 호출 성공");
		ResponseEntity<String> entity = null;
		logger.info(s_no);
			try {
				svo.setS_no(s_no);
				stockService.stockUpdate(svo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
			return entity;
	}
	
	/*******************************************************************
	 * 재고품 삭제
	 *******************************************************************/
	@RequestMapping(value="/stock/{s_no}.do", method = RequestMethod.DELETE)
	public ResponseEntity<String> stockDelete(@PathVariable("s_no") Integer s_no){
		logger.info("stockDelete 호출 성공");
		ResponseEntity<String> entity = null;
		try {
			stockService.stockDelete(s_no);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}