package com.pension.client.main;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class MainController {
	Logger logger = Logger.getLogger(MainController.class);
	
	
	//브라우저를 직접 요청하기때문에 GET방식 사용
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String main() {
		return "index";
	}
}
