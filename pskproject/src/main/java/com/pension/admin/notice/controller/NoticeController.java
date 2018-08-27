package com.pension.admin.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.pension.admin.notice.service.NoticeService;
import com.pension.admin.notice.vo.NoticeVO;


@Controller
@RequestMapping(value="/admin")
public class NoticeController {
	Logger logger = Logger.getLogger(NoticeController.class);
 
	@Autowired
	private NoticeService noticeService;

/*****************************************************************
* 공지사항 목록 구현하기(페이징 처리를 제외한 목록)
******************************************************************/
@RequestMapping(value="/notice/noticeList.do", method = RequestMethod.GET)
public String noticeList(NoticeVO nvo, Model model) {
	logger.info("noticeList 호출성공");

	List<NoticeVO> noticeList = noticeService.noticeList(nvo);
	model.addAttribute("noticeList", noticeList);

	return "admin/notice/noticeList";		
}
/*****************************************************************
*공지사항 입력 폼 구현하기
******************************************************************/
@RequestMapping(value="/notice/writeForm.do")
public String writeForm() {
	logger.info("writeForm 호출 성공");

	return "admin/notice/writeForm";

}
/*****************************************************************
* 공지사항 입력 하기
******************************************************************/
@RequestMapping(value="/notice/noticeInsert.do", method=RequestMethod.POST)
public String noticeInsert(NoticeVO nvo, Model model) {
	logger.info("noticeInsert 호출 성공");

	int result = 0;
	String url = "";
	result = noticeService.noticeInsert(nvo);

	if(result == 1) {
		url = "redirect:noticeList.do";
	}else {
		model.addAttribute("code", 1);
		url="writeForm";
	}
	return url;
}
/*****************************************************************
 * 공지사항 상세 보기
******************************************************************/
@RequestMapping(value="/notice/noticeDetail.do", method=RequestMethod.GET)
public String noticeDetail(NoticeVO nvo, Model model) {
	logger.info("noticeDetail 호출성공");
	logger.info("n_no = " + nvo.getN_no());
	
	NoticeVO detail = new NoticeVO();
	detail = noticeService.noticeDetail(nvo);
	
	if(detail !=null && (!detail.equals(""))) {
		detail.setN_content(
				detail.getN_content().toString().replaceAll("\n", "<br>"));
		
		}
	model.addAttribute("detail", detail);
	
	return "admin/notice/noticeDetail";	
	} 
/******************************************************************
* 공지사항 수정 폼 구현
*******************************************************************/		
@RequestMapping(value="/notice/updateForm.do", method=RequestMethod.POST)
public String updateForm(NoticeVO nvo, Model model) {
	logger.info("updateForm 호출 성공");
	
	logger.info("n_no" + nvo.getN_no());
	
	NoticeVO updateData = new NoticeVO();
	updateData = noticeService.noticeDetail(nvo);
	
	model.addAttribute("updateData", updateData);
	return "admin/notice/updateForm";

	}
/******************************************************************
* 공지사항 수정 하기
*******************************************************************/
@RequestMapping(value="/notice/noticeUpdate.do", method=RequestMethod.POST)
public String noticeUpdate(NoticeVO nvo, Model model) {
	logger.info("noticeUpdate 호출 성공");

	int result = 0;
	String url = "";
	
	result = noticeService.noticeUpdate(nvo);

	if(result == 1) {
		url ="noticeDetail.do?n_no="+nvo.getN_no();
	}else {
		url="updateForm.do?n_no="+nvo.getN_no();
	}
	return "redirect:"+url;
}
/******************************************************************
* 공지사항 삭제 하기
*******************************************************************/
@RequestMapping(value="/notice/noticeDelete.do")      
public String noticeDelete(NoticeVO nvo, HttpServletRequest request)throws IOException{       
	
	logger.info("noticeDelete 호출 성공");

	int result = 0;
	String url = "";
	result = noticeService.noticeDelete(nvo.getN_no());
	
	if(result == 1) {
		url = "noticeList.do";
	}else {
		url = "noticeDetail.do?n_no="+nvo.getN_no();
	}
	return "redirect:" + url;
	}

}