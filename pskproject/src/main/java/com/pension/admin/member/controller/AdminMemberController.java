package com.pension.admin.member.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pension.admin.member.service.AdminMemberService;
import com.pension.admin.member.vo.AdminMemberVO;

@RequestMapping(value="/admin")
@Controller
public class AdminMemberController {
Logger logger = Logger.getLogger(AdminMemberController.class);
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	/*******************************************************************
	 * 회원 리스트 구현하기
	 *******************************************************************/
	@RequestMapping(value="/member/memberList.do", method = RequestMethod.GET)
	public String memberList(@ModelAttribute("memberData") AdminMemberVO amvo, Model model) {
		logger.info("memberList 호출 성공");
		
		List<AdminMemberVO> memberList = adminMemberService.memberList(amvo);
		model.addAttribute("memberList", memberList);
		
		return "admin/member/memberList";
	}
	
	/*******************************************************************
	 * 회원 디테일 구현하기
	 *******************************************************************/
	@RequestMapping(value="/member/memberDetail.do", method = RequestMethod.GET)
	public String memberDetail(AdminMemberVO amvo, Model model) {
	logger.info("memberDetail 호출 성공");
	logger.info("m_no = " + amvo.getM_no());
	
	AdminMemberVO detail = new AdminMemberVO();
	detail = adminMemberService.memberDetail(amvo);
	
	model.addAttribute("detail", detail);
	return "admin/member/memberDetail";
	}
}