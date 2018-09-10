package com.pension.client.login.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.pension.client.login.service.LoginService;
import com.pension.client.login.vo.LoginVO;

@Controller
@SessionAttributes("login")
@RequestMapping("/member")
public class LoginController {
	Logger logger = Logger.getLogger(LoginController.class);
	
	@Autowired
	private LoginService loginService;
	
	@ModelAttribute("login")
	public LoginVO login() {
		return new LoginVO();
	}
	
	/**************************************************************************
	 * 로그인 폼 처리
	 **************************************************************************/
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String loginForm() {
		logger.info("login.do GET 호출 성공");
		return "client/login/login";
	}
	
	/**************************************************************************
	 * 로그인 처리
	 * 참고 : 로그인 실패시 횟수 제한을 제어하지 않은 처리
	 **************************************************************************/
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView loginInsert(@ModelAttribute LoginVO lvo, ModelAndView mav) {
		logger.info("login.do POST 호출 성공");
		
		String m_id = lvo.getM_id();
		String m_pwd = lvo.getM_pwd();
		LoginVO loginCheckResult = loginService.loginSelect(m_id, m_pwd);
		
		// 입력받은 아이디와 비밀번호로 DB 확인 시 일치 데이터가 존재하지 않으면
		if(loginCheckResult == null) {
			mav.addObject("status", 1);
			mav.setViewName("client/login/login");
			return mav;
		} else {		// 일치할 경우
			mav.addObject("login", loginCheckResult);
			mav.setViewName("redirect:/");
			return mav;
		}
	}
	
	/**************************************************************************
	 * 로그아웃 처리 메서드
	 **************************************************************************/
	@RequestMapping("/logout.do")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/";
	}
}