package com.pension.admin.room.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pension.admin.room.service.AdminRoomService;
import com.pension.admin.room.vo.RoomVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value="/admin")
public class AdminRoomController {
	
	Logger logger = Logger.getLogger(AdminRoomController.class);
	
	@Autowired
	private AdminRoomService adminRoomService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/room/roomList.do", method = RequestMethod.GET)
	public String roomList(@ModelAttribute("roomData") RoomVO rvo, Model model) {
		logger.info("Welcome home! The client locale is {}.");
		
		List<RoomVO> roomList = adminRoomService.roomList(rvo);
		
		model.addAttribute("roomList",roomList);
		
		return "admin/room/roomList";
	}
	
}
