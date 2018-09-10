package com.pension.client.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pension.admin.pay.service.PayService;
import com.pension.admin.pay.vo.PayVO;
import com.pension.admin.reservation.service.ReservationService;
import com.pension.admin.reservation.vo.ReservationVO;
import com.pension.client.login.service.LoginService;
import com.pension.client.login.vo.LoginVO;
import com.pension.client.member.service.MemberService;
import com.pension.client.member.vo.MemberVO;
import com.pension.client.qna.service.QnaService;
import com.pension.client.qna.vo.QnaVO;
import com.pension.client.review.service.ReviewService;
import com.pension.client.review.vo.ReviewVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private PayService payService;
	
	/**************************************************************************
	 * 회원 가입 폼
	 **************************************************************************/
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joinForm(Model model) {
		logger.info("join.do get 방식에 의한 메서드 호출 성공");
		return "client/member/join";
	}
	
	/**************************************************************************
	 * 사용자 아이디 중복 체크 메서드
	 **************************************************************************/
	@ResponseBody
	@RequestMapping(value = "/m_idConfirm.do", method = RequestMethod.POST)
	public String m_idConfirm(@RequestParam("m_id") String m_id) {
		int result = memberService.m_idConfirm(m_id);
		return result + "";
	}
	
	/**************************************************************************
	 * 회원 가입 처리(AOP 예외 처리)
	 **************************************************************************/
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public ModelAndView memberInsert(MemberVO mvo, ModelAndView mav) {
		logger.info("join.do post 방식에 의한 메서드 호출 성공");
		
		memberService.memberInsert(mvo);
		mav.setViewName("client/member/join_success");
		return mav;
	}

	/**************************************************************************
	 * 회원 수정 폼
	 **************************************************************************/
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public ModelAndView memberModify(HttpSession session) {
		logger.info("modify.do get 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();
		// session 객체에서 로그인 정보 얻기
		LoginVO login = (LoginVO)session.getAttribute("login");
		
		// 추후 아래 부분에 대한 제어는 한 곳에서 설정되도록 변경해 주면 된다.
		// 혹시 로그인되어 있지 않으면 로그인 화면으로 이동.
		if(login == null) {
			mav.setViewName("client/member/login");
			return mav;
		}
		// 세션에서 로그인 정보 중 아이디만 가지고 해당 아이디에 대한 상세내역 DB에서 조회
		MemberVO vo = memberService.memberSelect(login.getM_id());
		mav.addObject("member", vo);
		mav.setViewName("client/member/modify");
		return mav;
	}
	
	/**************************************************************************
	 * 회원 수정 처리(AOP 예외 처리 후)
	 **************************************************************************/
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public ModelAndView memberModifyProcess(MemberVO mvo, HttpSession session, ModelAndView mav) {
		logger.info("modify.do post 방식에 의한 메서드 호출 성공");
		
		LoginVO login = (LoginVO)session.getAttribute("login");
		
		if(login == null) {
			mav.setViewName("client/member/login");
			return mav;
		}
		// 세션으로 얻은 로그인 정보를 가지고 다시 회원테이블에 존재하는지 확인
		mvo.setM_id(login.getM_id());
		MemberVO vo = memberService.memberSelect(mvo.getM_id());
		// 기존 비밀번호로 회원정보를 확인하여 일치하면 수정 가능하도록 확인 작업
		if(loginService.loginSelect(mvo.getM_id(), mvo.getOldM_pwd()) == null) {
			mav.addObject("status", 1);
			mav.addObject("member", vo);
			mav.setViewName("client/member/modify");
			return mav;
		}
		
		memberService.memberUpdate(mvo);
		mav.setViewName("redirect:/member/logout.do");
		return mav;
	}
	
/*	*//**************************************************************************
	 * 회원 탈퇴 처리
	 **************************************************************************//*
	@RequestMapping("/delete.do")
	public ModelAndView memberDelete(HttpSession session) {
		logger.info("delete.do get방식에 의한 메서드 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		LoginVO login = (LoginVO)session.getAttribute("login");
		
		if(login == null) {
			mav.setViewName("member/login");
			return mav;
		}
		
		memberService.memberDelete(login.getM_id());
		mav.setViewName("redirect:/member/logout.do");
		return mav;
	}*/
	
	/**************************************************************************
	 * 회원 탈퇴 폼
	 **************************************************************************/
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public ModelAndView memberDelete(HttpSession session) {
		logger.info("delete.do get 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();
		// session 객체에서 로그인 정보 얻기
		LoginVO login = (LoginVO)session.getAttribute("login");
		
		// 추후 아래 부분에 대한 제어는 한 곳에서 설정되도록 변경해 주면 된다.
		// 혹시 로그인되어 있지 않으면 로그인 화면으로 이동.
		if(login == null) {
			mav.setViewName("client/member/login");
			return mav;
		}
		// 세션에서 로그인 정보 중 아이디만 가지고 해당 아이디에 대한 상세내역 DB에서 조회
		MemberVO vo = memberService.memberSelect(login.getM_id());
		mav.addObject("member", vo);
		mav.setViewName("client/member/delete");
		return mav;
	}
	
	/**************************************************************************
	 * 회원 삭제 처리(AOP 예외 처리 후)
	 **************************************************************************/
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public ModelAndView memberDeleteProcess(MemberVO mvo, HttpSession session, ModelAndView mav) {
		logger.info("delete.do post 방식에 의한 메서드 호출 성공");
		
		LoginVO login = (LoginVO)session.getAttribute("login");
		
		if(login == null) {
			mav.setViewName("member/login");
			return mav;
		}
		// 세션으로 얻은 로그인 정보를 가지고 다시 회원테이블에 존재하는지 확인
		mvo.setM_id(login.getM_id());
		MemberVO vo = memberService.memberSelect(mvo.getM_id());
		// 기존 비밀번호로 회원정보를 확인하여 일치하면 탈퇴 가능하도록 확인 작업
		if(loginService.loginSelect(mvo.getM_id(), mvo.getM_pwd()) == null) {
			mav.addObject("status", 1);
			mav.addObject("member", vo);
			mav.setViewName("member/delete");
			return mav;
		}
		
		memberService.memberDelete(mvo);
		mav.setViewName("redirect:/member/logout.do");
		return mav;
	}
	
	/*****************************************************************************
	 * 마이페이지
	 *****************************************************************************/
	@RequestMapping(value="/myPage.do", method = RequestMethod.GET)
		public String qnaList(HttpSession session,PayVO pvo, QnaVO qvo,ReviewVO rvo, Model model) {
		logger.info("myPage 호출성공");
		LoginVO login =(LoginVO)session.getAttribute("login");
		
		qvo.setM_no(login.getM_no());
		rvo.setM_no(login.getM_no());
		pvo.setM_no(login.getM_no());

		List<PayVO> selectList = payService.myPayList(pvo);
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		List<ReviewVO> reviewList = reviewService.reviewList(rvo);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("selectList",selectList);

		
		return "client/member/myPage";
	}
	
	   /**************************************************************************
	    * 아이디 찾기 폼
	    **************************************************************************/
	   @RequestMapping(value="/findId.do", method = RequestMethod.GET)
	   public String findIdForm(Model model) {
	      logger.info("findId.do GET 방식에 의한 메서드 호출 성공");
	      return "client/member/findId";
	   }

	   /**************************************************************************
	    * 아이디 찾기 처리 메서드
	    **************************************************************************/
	   @ResponseBody
	   @RequestMapping(value = "/findId.do", method = RequestMethod.POST)
	   public ModelAndView findIdProcess(@ModelAttribute LoginVO lvo, @RequestParam("m_name") String m_name, @RequestParam("m_phone") String m_phone, ModelAndView mav) {
	      logger.info("findIdProcess 메서드 호출 성공");
	      logger.info("이전 mav : " + mav);

	      String findIdResult = memberService.findId(m_name, m_phone);
	      
	      if(findIdResult == null) {
	         logger.info("이름이 존재하지 않습니다.");
	         mav.addObject("status", 1);
	         mav.setViewName("client/member/findId");
	         logger.info("mav : " + mav);
	         return mav;
	      } else {
	         mav.addObject("m_id", memberService.findId(m_name, m_phone));
	         mav.addObject("m_name", m_name);

	         mav.setViewName("client/member/findIdSuccess");
	         logger.info("memberService.findId : " + memberService.findId(m_name, m_phone));

	         lvo.setM_id(memberService.findId(m_name, m_phone));
	         logger.info("lvo.getM_id() : " + lvo.getM_id());
	         logger.info("이후 mav : " + mav);
	         return mav;
	      }
	   }
	
	
}