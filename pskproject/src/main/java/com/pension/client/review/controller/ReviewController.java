package com.pension.client.review.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pension.client.review.service.ReviewService;
import com.pension.client.review.vo.ReviewVO;

@Controller
@RequestMapping(value="/review")
public class ReviewController {
	Logger logger = Logger.getLogger(ReviewController.class);

	@Autowired
	private ReviewService reviewService;
	
/*****************************************************************
    				글 목록 구현하기(페이징 처리를 제외한 목록)
******************************************************************/
@RequestMapping(value="/reviewList", method = RequestMethod.GET)
public String reviewList(@ModelAttribute("data") ReviewVO bvo, Model model) {
logger.info("reviewList 호출성공");

List<ReviewVO> reviewList = reviewService.reviewList(bvo);
model.addAttribute("rewviewList", reviewList);

return "review/reviewList";		
}
/*****************************************************************
							글쓰기 폼 출력하기
******************************************************************/
@RequestMapping(value="/writeForm.do")
public String writeForm() {
logger.info("writeForm 호출 성공");

return "review/writeForm";

}	
	
}
