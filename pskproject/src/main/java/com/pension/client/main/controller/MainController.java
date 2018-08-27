package com.pension.client.main.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	Logger logger = Logger.getLogger(MainController.class);
	
	/* 절대 Method 방식이 POST가 될수 없음 브라우저를 요청하기 때문 */
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String main() {
		return "index";
	}
}
