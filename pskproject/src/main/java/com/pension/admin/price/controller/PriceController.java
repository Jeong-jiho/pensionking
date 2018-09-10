package com.pension.admin.price.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.pension.admin.price.service.PriceService;
import com.pension.admin.price.vo.PriceVO;
import com.pension.admin.room.controller.AdminRoomController;
import com.pension.admin.room.vo.RoomVO;

@Controller 
@RequestMapping(value="/price")
public class PriceController {
	Logger logger = Logger.getLogger(AdminRoomController.class);
	
	@Autowired
	private PriceService priceService;
	
	@RequestMapping(value="/priceUpdate.do", method=RequestMethod.POST)
	public String priceUpdate(RoomVO rvo, HttpServletRequest request) {
		logger.info("priceUpdate 호출성공");
		String url="";
		
		priceService.priceUpdate(rvo);
		
		url="/admin/room/roomDetail.do?r_no="+rvo.getR_no();
		return "redirect:" + url;
	} 
}
