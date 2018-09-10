package com.pension.admin.login.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.pension.admin.login.controller.AdminLoginController;
import com.pension.admin.login.service.AdminLoginService;
import com.pension.admin.login.vo.AdminLoginVO;

@Controller
@SessionAttributes("adminLogin")
@RequestMapping("/admin")
public class AdminLoginController {
	Logger logger = Logger.getLogger(AdminLoginController.class);
	
	@Autowired
	private AdminLoginService adminLoginService;
	
	@ModelAttribute("adminLogin")
	public AdminLoginVO login() {
		return new AdminLoginVO();
	}
	
	/**************************************************************************
	 * 로그인 폼 처리
	 **************************************************************************/
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String loginForm() {
		logger.info("login.do GET 호출 성공");
		return "admin/login/login";
	}
	
	/**************************************************************************
	 * 로그인 처리
	 **************************************************************************/
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView loginInsert(@ModelAttribute AdminLoginVO alvo, ModelAndView mav) {
		logger.info("login.do POST 호출 성공");
		
		String owner_id = alvo.getOwner_id();
		String owner_pwd = alvo.getOwner_pwd();
		
		AdminLoginVO loginCheckResult = adminLoginService.loginSelect(alvo);
		
		// 입력받은 아이디와 비밀번호로 DB 확인 시 일치 데이터가 존재하지 않으면
		if(loginCheckResult == null) {
			mav.addObject("status", 1);
			mav.setViewName("admin/login/login");
			return mav;
		} else {		// 일치할 경우
			mav.addObject("adminLogin", loginCheckResult);
			mav.setViewName("redirect:/statistics/main.do");
			return mav;
		}
	}
	
	/**************************************************************************
	 * 로그아웃 처리 메서드
	 **************************************************************************/
	@RequestMapping("/logout.do")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "admin/login/login";
	}
}