package com.pension.admin.qna.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pension.client.qna.service.QnaService;
import com.pension.client.qna.vo.QnaVO;


@Controller
@RequestMapping(value="/admin")
public class AdminQnaController {
	Logger logger = Logger.getLogger(AdminQnaController.class);
	   
	@Autowired 
	private QnaService qnaService;
/**************************************************************
 * 관리자 QnA 목록 구현하기
 **************************************************************/
@RequestMapping(value="/qna/qnaList.do", method=RequestMethod.GET)
public String qnaList(@ModelAttribute("data") QnaVO qvo, Model model) {
      
	 logger.info("admin qnaList 호출 성공");
     
	 //전체 레코드 구현
     List<QnaVO> qnaList = qnaService.qnaList(qvo);
     model.addAttribute("qnaList", qnaList);
     
     return "admin/qna/qnaList";
   }
/*****************************************************************
 * 관리자 후기 상세 보기
 ******************************************************************/
@RequestMapping(value="/qna/qnaDetail.do", method=RequestMethod.GET)
public String qnaDetail(QnaVO qvo, Model model) {
   logger.info("admin qnaDetail 호출성공");
   logger.info("q_no = " + qvo.getQ_no());
   
   QnaVO detail = new QnaVO();
   detail = qnaService.qnaDetail(qvo);
	   
   if(detail !=null && (!detail.equals(""))) {
		   detail.setQ_content(
			   detail.getQ_content().toString().replaceAll("\n", "<br>"));
   }
   model.addAttribute("detail", detail);
	   
   return "admin/qna/qnaDetail";	
  } 

}