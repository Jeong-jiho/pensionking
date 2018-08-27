package com.pension.client.review.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pension.client.review.service.ReviewService;
import com.pension.client.review.vo.ReviewVO;
import com.pension.common.file.FileUploadUtil;


@Controller
@RequestMapping(value="/review")
public class ReviewController {
	Logger logger = Logger.getLogger(ReviewController.class);

	@Autowired
	private ReviewService reviewService;
	 
/*****************************************************************
    				글 목록 구현하기(페이징 처리를 제외한 목록)
******************************************************************/
@RequestMapping(value="/reviewList.do", method = RequestMethod.GET)
public String reviewList(@ModelAttribute("data") ReviewVO rvo, Model model) {
logger.info("reviewList 호출성공");

List<ReviewVO> reviewList = reviewService.reviewList(rvo);
model.addAttribute("reviewList", reviewList);

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
/*****************************************************************
							글 입력하기
******************************************************************/
@RequestMapping(value="/reviewInsert.do", method=RequestMethod.POST)
public String reviewInsert(ReviewVO rvo, Model model, HttpServletRequest request) throws
	IllegalStateException, IOException{
	logger.info("reviewInsert 호출 성공");
	
	int result = 0;
	String url = "";
		
	//확인 후 주석 처리
	//logger.info("fileName:"+rvo.getFile().getOriginalFilename()
	//logger.info("b_title:"+rvo.getB_title());
	
	if(!rvo.getFile().isEmpty()) {
		String rv_file = FileUploadUtil.fileUpload(rvo.getFile(), request, "review");
		rvo.setRv_file(rv_file);
	}else {
		rvo.setRv_file("");
	}	
	
	result = reviewService.reviewInsert(rvo);
	if(result==1) {
		url= "/review/reviewList.do";
	}else {
		model.addAttribute("code",1);
		url="/review/writeForm.do";
	}
	return "redirect:"+ url;
}
/*****************************************************************
							글 상세보기
******************************************************************/
@RequestMapping(value="/reviewDetail.do", method=RequestMethod.GET)
public String reviewDetail(ReviewVO rvo, Model model) {
	logger.info("reviewDetail 호출성공");
	logger.info("rv_no = " + rvo.getRv_no());
	
	
	ReviewVO detail = new ReviewVO();
	detail = reviewService.reviewDetail(rvo);
	
	if(detail !=null && (!detail.equals(""))) {
		detail.setRv_content(
				detail.getRv_content().toString().replaceAll("\n", "<br>"));
		
		}
	model.addAttribute("detail", detail);
	
	return "review/reviewDetail";	
	}
/*****************************************************************
							비밀 번호 확인
******************************************************************/
@ResponseBody
@RequestMapping(value="/pwdConfirm.do", method=RequestMethod.POST,
produces="text/plain; charset=UTF-8")
public String pwdConfirm(ReviewVO rvo, Model model) {
		logger.info("pwdConfirm 호출 성공");
		String value = "";
		
		//아래 변수에는 입력 성공에 대한 상태값 저장(1 or 0)
		int result = reviewService.pwdConfirm(rvo);
		//return result+""; //정수값 반환
		if(result==1) {
			value="성공";
		}else {
			value="실패";
		}
		return value;
	}
/******************************************************************
							글 수정 폼 구현
*******************************************************************/		
@RequestMapping(value="/updateForm.do", method=RequestMethod.POST)
public String updateForm(ReviewVO rvo, Model model) {
	logger.info("pwdConfirm 호출 성공");

	logger.info("rv_no" + rvo.getRv_no());

	ReviewVO updateData = new ReviewVO();
	updateData = reviewService.reviewDetail(rvo);

	model.addAttribute("updateData", updateData);
	return "review/updateForm";

}
/******************************************************************
							글 수정 하기
*******************************************************************/
@RequestMapping(value="/reviewUpdate.do", method=RequestMethod.POST)
public String reviewUpdate(ReviewVO rvo, HttpServletRequest request) throws IOException{
   logger.info("reviewUpdate 호출 성공");
   
   int result = 0;
   String url = "";
   String rv_file="";
   
   if(!rvo.getFile().isEmpty()) {
      logger.info("=============file = " + rvo.getFile().getOriginalFilename());
      //기존 파일 삭제 처리
      if(!rvo.getRv_file().isEmpty()) {
         FileUploadUtil.fileDelete(rvo.getRv_file(), request);
      }
      //다시 파일 업로드 실행
      rv_file = FileUploadUtil.fileUpload(rvo.getFile(), request, "review");
      rvo.setRv_file(rv_file);
   }else {
      logger.info("첨부파일 없음");
   }
   result = reviewService.reviewUpdate(rvo);
   if(result == 1) {
      url = "/review/reviewDetail.do?rv_no="+rvo.getRv_no();
   }else {
      url = "/review/updateForm.do?rv_no="+rvo.getRv_no();
   }
   return "redirect:" + url;
}
/******************************************************************
								글 삭제 하기
*******************************************************************/
@RequestMapping(value="/reviewDelete.do")      
public String reviewDelete(ReviewVO rvo, HttpServletRequest request)throws IOException{       
	logger.info("reviewDelete 호출 성공");

	int result = 0;
	String url = "";
	// 파일이 존재하면
	if(!rvo.getRv_file().isEmpty()) {
		FileUploadUtil.fileDelete(rvo.getRv_file(), request);
	}

	result = reviewService.reviewDelete(rvo.getRv_no());
	if(result == 1) {
		url = "/review/reviewList.do";
	}else {
		url = "/review/reviewDetail.do?rv_no="+rvo.getRv_no();
	}
	return "redirect:" + url;

}
/******************************************************************
							댓글 갯수 구하기
*******************************************************************/
@ResponseBody
@RequestMapping(value="/replyCount.do")
public String replyCount(@RequestParam("rv_no")int rv_no) {
	logger.info("replyCount 호출 성공");

	int result = 0;
	result = reviewService.replyCount(rv_no);
	return result+"";

	}

}