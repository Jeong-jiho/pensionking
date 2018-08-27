package com.pension.client.reply.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.pension.client.reply.service.ReplyService;
import com.pension.client.reply.vo.ReplyVO;

@RestController
@RequestMapping(value="/replies")
public class ReplyController {

	Logger logger = Logger.getLogger(ReplyController.class);

	@Autowired
	private ReplyService replyService;

/***********************************************************************
 							댓글 목록 구현하기
	 *@return List<ReplyVO>
	 *참고 : @PathVariable는 URI의 경로에서 원하는 데이터로							

***********************************************************************/
	@RequestMapping(value="/all/{rv_no}.do", method= RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("rv_no")Integer rv_no){
		ResponseEntity<List<ReplyVO>>entity = null;
		try {
			entity = new ResponseEntity<>(replyService.replyList(rv_no),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} 
		return entity;
	}
/*****************************************************************
							댓글 쓰기 구현하기
******************************************************************/
	@RequestMapping(value="/replyInsert.do")
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO rvo) {
		logger.info("replyInsert 호출 성공");
		ResponseEntity<String> entity = null;
		
		int result;
		try {
			result = replyService.replyInsert(rvo);	
			if(result==1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;	
	}
/*****************************************************************
							비밀번호 입력창
******************************************************************/
	@RequestMapping(value="/pwdConfirm.do")
	public ResponseEntity<Integer> pwdConfirm(ReplyVO rvo){
		logger.info("pwdConfirm 호출 성공");
		ResponseEntity<Integer>entity = null;
		int result = 0;
		try {
			result = replyService.pwdConfirm(rvo);
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
/*****************************************************************
								댓글 삭제
******************************************************************/
	@RequestMapping(value="/{rp_no}.do", method= RequestMethod.DELETE)
	public ResponseEntity<String> replyDelete(@PathVariable("rp_no")Integer rp_no){
		logger.info("replyDelete 호출 성공");
		ResponseEntity<String> entity = null;
		try {
			replyService.replyDelete(rp_no);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
/*****************************************************************
								댓글 수정
******************************************************************/
	@RequestMapping(value="/{rp_no}.do", method= RequestMethod.PUT)
	public ResponseEntity<String> replyUpdate(
			@PathVariable("rp_no")Integer rp_no,
			@RequestBody ReplyVO rvo) {
		logger.info("replyUpdate 호출 성공");
		ResponseEntity<String> entity = null;

		try {
			rvo.setRp_no(rp_no);
			replyService.replyUpdate(rvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}