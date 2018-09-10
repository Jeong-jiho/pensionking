package com.pension.client.room.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pension.admin.price.service.PriceService;
import com.pension.admin.room.vo.RoomVO;
import com.pension.client.room.service.ClientRoomService;
import com.pension.common.image.service.ImageService;
import com.pension.common.image.vo.ImageVO;

@Controller
@RequestMapping(value="/room")
public class ClientRoomController {
	Logger logger = Logger.getLogger(ClientRoomController.class);
	
	@Autowired
	private ClientRoomService clientRoomService;
 
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private PriceService priceService;
	
	@RequestMapping(value="/roomInfo.do")
	public String roomList(@ModelAttribute("data") RoomVO rvo, Model model) {
		logger.info("roomList 호출성공");

		List<RoomVO> roomList = clientRoomService.roomList(rvo);
		
		model.addAttribute("roomList",roomList);

		return "client/room/roomInfo";
	}
	
	@RequestMapping(value="/roomDetail.do", method=RequestMethod.GET)
	public String roomDetail(RoomVO rvo, Model model) {
		logger.info("roomDetail 호출 성공");
		logger.info(rvo.getR_no());
		
		RoomVO detail = new RoomVO();
		detail = clientRoomService.roomDetail(rvo);
		List<ImageVO> roomImageList = imageService.roomImageList(rvo);
		RoomVO priceDetail = priceService.priceSelect(rvo.getR_no());
		
		if(detail != null && (!detail.equals(""))) {
			detail.setR_cvc(detail.getR_cvc().toString().replaceAll("\n", "<br>"));
			detail.setR_info(detail.getR_info().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		model.addAttribute("roomImageList", roomImageList);
		model.addAttribute("price", priceDetail);
		
		return "client/room/roomDetail";
	}
	
	@RequestMapping(value="/amenity.do")
	public String maps() {
		logger.info("maps 호출 성공");
		
		return "client/room/amenity";
	}
	
	@RequestMapping(value="/intro.do")
	public String intro() {
		logger.info("intro 호출 성공");
		
		return "client/room/intro";
	}
}
