package com.pension.client.reservation.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pension.client.reservation.service.ReservationService;
import com.pension.client.reservation.vo.ReservationVO;

@Controller
@RequestMapping(value="/reservation")		//매핑
public class ReservationController {
	Logger logger = Logger.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService reservationService;
	
	/**
	 * 예약 목록 구현 
	 * **/
	
	@RequestMapping(value="/reservationList.do", method=RequestMethod.GET)
	public String reservationList(@ModelAttribute ReservationVO rvo, Model model) {
		logger.info("reservationList 호출 성공");
		
		List<ReservationVO> reservationList = reservationService.reservationList(rvo);
		model.addAttribute("reservationList", reservationList);
		
		return "reservation/reservationList";
	}
	
	/**
	 * 예약 확인
	 * **/
	
	@RequestMapping(value="/reservation_confirm.do")
	public String reservation_confirm() {
		logger.info("reservation_confirm 호출 성공");
		
		return "reservation/reservation_confirm";
	}
	
	/**
	 * 예약 내용 입력하기
	 * 필드명과 VO 객체의 이름을 같게해서 command 객체 자동 mapping
	 * **/
	
	/*@RequestMapping(value="/reservationInsert.do", method=RequestMethod.POST)
	public String reservationInsert(ReservationVO rvo, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("res_insert 호출 성공");
		
		int result = 0;
		String url="";
		
		result = reservationService.reservationInsert(rvo);
		if(result == 1) {
			url = "/reservation/reservationList.do";
		} else {
			model.addAttribute("code", 1);
			url = "/reservation/res_writeForm.do";
		}
		return "redirect:" + url;
	}*/
	
	
}
