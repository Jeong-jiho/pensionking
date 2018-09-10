package com.pension.admin.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pension.admin.pay.service.PayService;
import com.pension.admin.pay.vo.PayVO;
import com.pension.admin.reservation.service.ReservationService;
import com.pension.admin.reservation.vo.ReservationVO;
import com.pension.admin.room.service.AdminRoomService;
import com.pension.admin.room.vo.RoomVO;
import com.pension.admin.sterm.service.StermService;
import com.pension.admin.sterm.vo.StermVO;
import com.pension.common.image.controller.ImageController;

@Controller
@RequestMapping(value="/admin")
public class ReservationController {
	Logger logger = Logger.getLogger(ReservationController.class);

	@Autowired
	private ReservationService reservationService;
	 
	@Autowired
	private AdminRoomService adminRoomService;
	
	@Autowired
	private StermService stermService;
	
	@Autowired
	private PayService payService;
	
	
	@RequestMapping(value = "/res/resList.do", method = RequestMethod.GET)
	public String roomList(@ModelAttribute("data") ReservationVO resvo, PayVO pvo,Model model,ObjectMapper mapper) {
		logger.info("roomList 호출성공");
		
		List<ReservationVO> resList = reservationService.resList(resvo);
		List<PayVO> payList = payService.payConfirmList(pvo);
		List<PayVO> payAllList = payService.payAllList(pvo);
		
		model.addAttribute("payList",payList);
		model.addAttribute("payAllList",payAllList);
		model.addAttribute("resList",resList);
		
		
		return "admin/reservation/resList";
	}
	
	@RequestMapping(value="/res/resCalendar.do", method = RequestMethod.GET)
	public String resCalendar(ReservationVO resvo,RoomVO rvo, Model model){
		logger.info("resCalendar 호출성공");
		
		List<RoomVO> roomName = adminRoomService.roomName(rvo);
		List<ReservationVO> resState = reservationService.resStateList(resvo);
		StermVO sterm = stermService.getSterm();
		
		model.addAttribute("roomName",roomName);
		model.addAttribute("r_count",roomName.size());
		model.addAttribute("resState",resState);
		model.addAttribute("res_count",resState.size());
		model.addAttribute("sterm",sterm);
		
		return "admin/reservation/resCalendar";
		
	}

}
