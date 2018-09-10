package com.pension.client.qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pension.admin.notice.vo.NoticeVO;
import com.pension.client.login.vo.LoginVO;
import com.pension.client.qna.service.QnaService;
import com.pension.client.qna.vo.QnaVO;
import com.pension.client.review.vo.ReviewVO;
import com.pension.common.file.FileUploadUtil;



@Controller 
@RequestMapping(value="/qna")
public class QnaController {
	Logger logger = Logger.getLogger(QnaController.class);
	
	@Autowired
	private QnaService qnaService;
	

/*****************************************************************
 * QnA 글 목록 구현하기
 *****************************************************************/
@RequestMapping(value="/qnaList.do", method = RequestMethod.GET)
public String qnaList(@ModelAttribute("data") QnaVO qvo, Model model) {
logger.info("qnaList 호출성공");


List<QnaVO> qnaList = qnaService.qnaList(qvo);
model.addAttribute("qnaList", qnaList);

return "client/qna/qnaList";		
}
/*****************************************************************
 * QnA 글쓰기 폼 출력하기
 *****************************************************************/
@RequestMapping(value="/writeForm.do")
public String writeForm() {
	logger.info("writeForm 호출 성공");
	
	return "client/qna/writeForm";

}
/***************************************************************** 
 * QnA 입력 하기
 ******************************************************************/
@RequestMapping(value="/qnaInsert.do", method=RequestMethod.POST)
public String noticeInsert(HttpSession session, QnaVO qvo, Model model) {
	logger.info("qnaInsert 호출 성공");

	int result = 0;
	String url = "";
	
	LoginVO login =(LoginVO)session.getAttribute("login");
	qvo.setM_no(login.getM_no());
	
	logger.info("m_id = "+login.getM_id());
    logger.info("m_no = "+login.getM_no());
	
	result = qnaService.qnaInsert(qvo);
	
	if(result == 1) {
		url = "redirect:qnaList.do";
	}else {
		model.addAttribute("code", 1);
		url="writeForm";
	}
	return url;
}
/*****************************************************************
 * QnA 글 상세보기
 *****************************************************************/
@RequestMapping(value="/qnaDetail.do", method=RequestMethod.GET)
public String qnaDetail(QnaVO qvo, Model model) {
	logger.info("qnaDetail 호출성공");
	logger.info("q_no = " + qvo.getQ_no());
	
	
	QnaVO detail = new QnaVO();
	detail = qnaService.qnaDetail(qvo);

	if(detail !=null && (!detail.equals(""))) {
		detail.setQ_content(
				detail.getQ_content().toString().replaceAll("\n", "<br>"));

	}
	model.addAttribute("detail", detail);

	return "client/qna/qnaDetail";	
}
/*****************************************************************
 *비밀 번호 확인
 *****************************************************************/
@ResponseBody
@RequestMapping(value="/pwdConfirm.do", method=RequestMethod.POST,
produces="text/plain; charset=UTF-8")
public String pwdConfirm(QnaVO qvo, Model model) {
	logger.info("pwdConfirm 호출 성공");
	String value = "";

	//아래 변수에는 입력 성공에 대한 상태값 저장(1 or 0)
	int result = qnaService.pwdConfirm(qvo);
	//return result+""; //정수값 반환
	if(result==1) {
		value="성공";
	}else {
		value="실패";
	}
	return value;
}
/******************************************************************
 *글 수정 폼 구현
 ******************************************************************/		
@RequestMapping(value="/updateForm.do", method=RequestMethod.POST)
public String updateForm(QnaVO qvo, Model model) {
	logger.info("pwdConfirm 호출 성공");

	logger.info("q_no" + qvo.getQ_no());

	QnaVO updateData = new QnaVO();
	updateData = qnaService.qnaDetail(qvo);

	model.addAttribute("updateData", updateData);
	return "client/qna/updateForm";
}
/******************************************************************
* QnA 수정 하기
*******************************************************************/
@RequestMapping(value="/qnaUpdate.do", method=RequestMethod.POST)
public String qnaUpdate(QnaVO qvo, HttpServletRequest requst) throws IOException{
	logger.info("qnaUpdate 호출 성공");

	int result = 0;
	String url = "";
	 
	result = qnaService.qnaUpdate(qvo);

	if(result == 1) {
		url ="qnaDetail.do?q_no="+qvo.getQ_no();
	}else {
		url="updateForm.do?q_no="+qvo.getQ_no();
	}
	return "redirect:"+url;
}
/******************************************************************
 *글 삭제 하기
 ******************************************************************/
@RequestMapping(value="/qnaDelete.do")      
public String qnaDelete(QnaVO qvo, HttpServletRequest request)throws IOException{       
	logger.info("qnaDelete 호출 성공");

	int result = 0;
	String url = "";
	
	result = qnaService.qnaDelete(qvo.getQ_no());
	if(result == 1) {
		url = "qnaList.do";
	}else {
		url = "qnaDetail.do?q_no="+qvo.getQ_no();
	}
	return "redirect:" + url;

}


}