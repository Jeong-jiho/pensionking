package com.pension.admin.pay.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.pension.admin.pay.service.PayService;
import com.pension.admin.pay.vo.PayVO;
import com.pension.admin.reservation.service.ReservationService;

@RestController 
@RequestMapping(value="/admin")
public class PayController {
	Logger logger = Logger.getLogger(PayController.class);
	
	@Autowired
	private PayService payService;
	@Autowired
	private ReservationService reservationService;

	@RequestMapping(value="/pay/payUpdate.do", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String payUpdate(@RequestBody PayVO pvo,Model model) {
		logger.info("payUpdate 호출성공");
		int result = 0;
		String value="";
		logger.info(pvo.getA_confirm());
		if(pvo.getPay_no()==0) {
			result = payService.payAllUpdate();
			for(int i=0; i<pvo.getRes_noList().length; i++) {
				logger.info(pvo.getRes_noList()[i]);
				pvo.setRes_gno(pvo.getRes_noList()[i]);
				reservationService.resStateUpdate(pvo);
			}
		}else {
			logger.info(pvo.getRes_gno());
			result = payService.payUpdate(pvo);
			reservationService.resStateUpdate(pvo);
		}
		logger.info(result);
		if(result==0) {
			value="실패";
		}else {
			value="성공";
		}
		return value;
	}
	
	@RequestMapping(value="/pay/refund.do", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String Refund(@RequestBody PayVO pvo,Model model) {
		logger.info("refund 호출성공");
		int result = 0;
		String value="";
		double price = 0.0;
		logger.info(pvo.getA_confirm() +"/" + pvo.getPay_no());
		int day = payService.payDday(pvo);
		logger.info(pvo.getPay_price());
		if(day>0) {
			switch(day) {
			case 1:
				price = (pvo.getPay_price()*0.1);
				break;
			case 2:
				price = (pvo.getPay_price()*0.2);
				break;
			case 3:
				price = (pvo.getPay_price()*0.3);
				break;
			case 4:
				price = (pvo.getPay_price()*0.4);
				break;
			case 5:
				price = (pvo.getPay_price()*0.5);
				break;
			case 6:
				price = (pvo.getPay_price()*0.6);
				break;
			case 7:
				price = (pvo.getPay_price()*0.7);
				break;
			default:
				price = pvo.getPay_price();
			}
			pvo.setC_price(price);
			pvo.setDday(day);
			result = payService.cancelInsert(pvo);
			payService.payUpdate(pvo);
			reservationService.resStateUpdate(pvo);
		}else {
			result = 3;
		}
		

		logger.info(result);
		if(result==0) {
			value="실패";
		}else if(result==3) {
			value= "불가능";
		}else {
			value="성공";
		}
		return value;
	}
}
