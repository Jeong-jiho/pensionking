package com.pension.client.notice.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pension.admin.notice.service.NoticeService;
import com.pension.admin.notice.vo.NoticeVO;


@Controller
@RequestMapping(value="/notice")
public class ClientNoticeController {
   Logger logger = Logger.getLogger(ClientNoticeController.class);
   
   @Autowired 
   private NoticeService noticeService;
   
 /**************************************************************
  * 글목록 구현하기
  **************************************************************/
   @RequestMapping(value="noticeList.do", method=RequestMethod.GET)
   public String noticeList(@ModelAttribute("data") NoticeVO nvo, Model model) {
      logger.info("noticeList 호출 성공");
      
      //전체 레코드 구현
      List<NoticeVO> noticeList = noticeService.noticeList(nvo);
      model.addAttribute("noticeList", noticeList);
      
      return "client/notice/noticeList";
   }

/*****************************************************************
 * 글 상세보기
 ******************************************************************/
@RequestMapping(value="noticeDetail.do", method=RequestMethod.GET)
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

	return "client/notice/noticeDetail";	
}

}