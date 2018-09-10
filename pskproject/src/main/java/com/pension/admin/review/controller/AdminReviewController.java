package com.pension.admin.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pension.client.review.service.ReviewService;
import com.pension.client.review.vo.ReviewVO;
import com.pension.common.file.FileUploadUtil;

@Controller
@RequestMapping(value="/admin")
public class AdminReviewController {
   Logger logger = Logger.getLogger(AdminReviewController.class);
   
   @Autowired 
   private ReviewService reviewService;
/**************************************************************
 * 관리자 후기 목록 구현하기
 **************************************************************/
@RequestMapping(value="/review/reviewList.do", method=RequestMethod.GET)
public String reviewList(@ModelAttribute("data") ReviewVO rvo, Model model) {
      
	 logger.info("admin reviewList 호출 성공");
     
	 //전체 레코드 구현
     List<ReviewVO> reviewList = reviewService.reviewList(rvo);
     model.addAttribute("reviewList", reviewList);
     
     return "admin/review/reviewList";
   }		
/*****************************************************************
 * 관리자 후기 상세 보기
 ******************************************************************/
@RequestMapping(value="/review/reviewDetail.do", method=RequestMethod.GET)
public String reviewDetail(ReviewVO rvo, Model model) {
   logger.info("admin reviewDetail 호출성공");
   logger.info("rv_no = " + rvo.getRv_no());
   
   ReviewVO detail = new ReviewVO();
   detail = reviewService.reviewDetail(rvo);
	   
   if(detail !=null && (!detail.equals(""))) {
		   detail.setRv_content(
			   detail.getRv_content().toString().replaceAll("\n", "<br>"));
   }
   model.addAttribute("detail", detail);
	   
   return "admin/review/reviewDetail";	
  } 
/******************************************************************
 * 관리자 후기 글 삭제 하기
 *******************************************************************/
@RequestMapping(value="/review/reviewDelete.do")      
public String reviewDelete(ReviewVO rvo, HttpServletRequest request)throws IOException{       
	logger.info("admin reviewDelete 호출 성공");
	
	int result = 0;
	String url = "";
	// 파일이 존재하면
	if(!rvo.getRv_file().isEmpty()) {
		FileUploadUtil.fileDelete(rvo.getRv_file(), request);
	}
	
	result = reviewService.reviewDelete(rvo.getRv_no());
	
	if(result == 1) {
		url = "reviewList.do";
	}else {
		url = "reviewDetail.do?rv_no="+rvo.getRv_no();
	}
	return "redirect:" + url;
	}
}
