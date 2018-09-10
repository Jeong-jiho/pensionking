package com.pension.client.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pension.admin.pay.service.PayService;
import com.pension.admin.pay.vo.PayVO;
import com.pension.admin.reservation.service.ReservationService;
import com.pension.admin.reservation.vo.ReservationVO;
import com.pension.admin.room.service.AdminRoomService;
import com.pension.admin.room.vo.RoomVO;
import com.pension.admin.sterm.service.StermService;
import com.pension.admin.sterm.vo.StermVO;
import com.pension.client.login.vo.LoginVO;
import com.pension.client.reservation.service.ClientReservationService;


@Controller
@RequestMapping(value="/reservation")		//매핑
public class ClientReservationController {
	Logger logger = Logger.getLogger(ClientReservationController.class);
	
	@Autowired
	private ClientReservationService clientReservationService;
	
	
	@Autowired
	private StermService stermService;
	
	@Autowired
	private AdminRoomService adminRoomService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private PayService payService;
	/**
	 * 예약 목록 구현 
	 * **/
	
	/*@RequestMapping(value="/resCalendar.do", method=RequestMethod.GET)
	public String reservationList(@ModelAttribute("data") ReservationVO resvo,PayVO pvo,RoomVO rvo, Model model, ObjectMapper mapper) {
		logger.info("reservationList 호출 성공");
		
		List<ReservationVO> resList = clientReservationService.resList(resvo);
		List<PayVO> payList = payService.payConfirmList(pvo);
		List<ReservationVO> resState = clientReservationService.resStateList();
		List<RoomVO> roomName = adminRoomService.roomName(rvo);
		
		model.addAttribute("resList", resList);
		model.addAttribute("payList", payList);
		model.addAttribute("resState", resState);
		model.addAttribute("roomName", roomName);
		
		return "reservation/resCalendar";
	}*/
	
	@RequestMapping(value="/resCalendar.do", method = RequestMethod.GET)
	public String resCalendar(ReservationVO resvo,RoomVO rvo, Model model){
		logger.info("resCalendar 호출 성공");
		
		

		List<RoomVO> roomName = adminRoomService.roomName(rvo);
		List<ReservationVO> resState = clientReservationService.resStateList(resvo);
		StermVO sterm = stermService.getSterm();
		
		model.addAttribute("roomName",roomName);
		model.addAttribute("r_count",roomName.size());
		model.addAttribute("resState",resState);
		model.addAttribute("res_count",resState.size());
		model.addAttribute("sterm",sterm);
		
		return "client/reservation/resCalendar";
	}
	
	/**
	 * 예약 확인
	 * **/
	@RequestMapping(value="/resWriteForm.do",method=RequestMethod.POST)
	public String reservation_writeForm(@ModelAttribute("select") ReservationVO resvo, Model model,HttpServletRequest request) {
		logger.info("resWriteForm 호출 성공");
		String x = resvo.getRes_indate();
		String[] sizeOptions = new String[ x.length()];
	      String size = "";
	      for (int i = 0; i < x.length(); ++i) {
	         char character = x.charAt(i); //;
	         if (character != ' ') {
	            size = size + character;      // color = 빨강
	         }
	         else {
	            sizeOptions[i] = size;
	            size = "";
	         }
	         
	      }
	      logger.info(resvo.getRes_indate());
	      List<RoomVO> roomList = adminRoomService.roomList(resvo);
	      List<ReservationVO> resRoom = reservationService.resRoom(sizeOptions[4]+"-"+sizeOptions[7]+"-"+sizeOptions[10]);
	     
		model.addAttribute("roomList",roomList);
		if(!resRoom.isEmpty()) {
			model.addAttribute("resRoom",resRoom);
		}
		
		
		
		return "client/reservation/resWriteForm";
	}
	@RequestMapping(value="/resConfirm.do",method=RequestMethod.POST)
	public String resConfirm(ReservationVO resvo, Model model,HttpServletRequest request) {
		logger.info("resConfirm 호출 성공");

		List<ReservationVO> selectList = resvo.getResVoList();

		model.addAttribute("selectList",selectList);

		return "client/reservation/reservation_confirm";
	}
	
	
	/*@RequestMapping(value="/resInsert.do",  method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String resInsert(HttpSession session, ReservationVO resvo, HttpServletRequest request) {
		logger.info("resInsert 호출성공");
		int result = 0;
		String url = "";
		
		LoginVO login = (LoginVO)session.getAttribute("login");
		resvo.setM_no(login.getM_no());
		
		logger.info("m_id="+resvo.getM_id()+"/"+resvo.getM_no());
			
			List<ReservationVO> selectList = resvo.getResVoList();
			
			//logger.info(selectList.get(0));
			for(int i=0; i<selectList.size(); i++) {
				reservationService.resInsert(selectList.get(i));
				logger.info("gg");
			}
			if(selectList.iterator().hasNext()) {

				//logger.info(selectList.iterator().next().toString());
				result = reservationService.resInsert(selectList.iterator().next());
				logger.info("gg");
			}
		if(result == 0) {
			url = "client/reservation/resSuccess";
		}else {
			url = "client/reservation/resFail";
		} 
		return url+"";

	}*/
	
	@RequestMapping(value="/payInsert.do",  method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String payInsert(HttpSession session,PayVO pvo,ReservationVO resvo, HttpServletRequest request){
		logger.info("payInsert 호출성공");
		int result = 0;
		String url = "";

		LoginVO login = (LoginVO)session.getAttribute("login");
		
		logger.info(login.getM_no());
		resvo.setM_no(login.getM_no());
		pvo.setM_no(login.getM_no());
		
		logger.info("m_id="+resvo.getM_id()+"/"+pvo.getM_no());
		
		List<ReservationVO> selectList = pvo.getResVoList();
			//logger.info(resvo.getR_noList().length);

			for(int i=0; i<selectList.size(); i++) {
				selectList.get(i).setM_no(login.getM_no());
				reservationService.resInsert(selectList.get(i));
				if(i==0) {
					String resgno = clientReservationService.getResNo(selectList.get(i));
					resvo.setRes_gno(resgno);
					pvo.setRes_gno(resgno);
				}
				clientReservationService.resGnoUpdate(resvo);
			}
			result = payService.payInsert(pvo);
		if(result == 1) {
			url = "client/reservation/resSuccess";
		}else {
			url = "client/reservation/resFail";
		}
		return url+"";

	}
	/**
	 * 구글맵스
	 * **/ 
	@RequestMapping(value="/maps.do") 
	public String maps() {
		logger.info("maps 호출 성공");
		
		return "client/reservation/maps";
	}

}
