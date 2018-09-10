package com.pension.admin.sterm.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pension.admin.room.controller.AdminRoomController;
import com.pension.admin.room.vo.RoomVO;
import com.pension.admin.sterm.service.StermService;
import com.pension.admin.sterm.vo.StermVO;

@Controller
@RequestMapping(value="/admin")
public class StermController {
	Logger logger = Logger.getLogger(StermService.class);
	
	@Autowired 
	private StermService stermService;
	
	@ResponseBody 
	@RequestMapping(value="/sterm/stermInsert.do",  method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String priceUpdate(StermVO svo, HttpServletRequest request) {
		logger.info("stermInsert 호출성공");
		int result = 0;
		String value = "";
		logger.info(stermService.confirm());
		
		if(stermService.confirm()!=0) {
			stermService.stermDelete(svo);
		}
		result = stermService.stermInsert(svo);

		if(result==1) {
			value="성공";
		}else {
			value="실패";
		}
		
		return value;
	}
			
}
