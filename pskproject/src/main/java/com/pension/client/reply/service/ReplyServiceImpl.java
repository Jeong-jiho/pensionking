package com.pension.client.reply.service;

import java.util.List;
 
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.client.reply.dao.ReplyDao;
import com.pension.client.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	Logger logger = Logger.getLogger(ReplyServiceImpl.class);

	@Autowired
	private ReplyDao replyDao;

	@Override
	public List<ReplyVO> replyList(Integer rv_no){
		List<ReplyVO> myList = null;
		myList = replyDao.replyList(rv_no);
		return myList;
	}
	// 글 입력 구현
	@Override
	public int replyInsert(ReplyVO rvo) {
		int result = 0;
		try {
			result = replyDao.replyInsert(rvo);
		}catch(Exception e) {
			e.printStackTrace();
			result= 0;
		}
		return result;
	}

	// 비밀번호 입력칸
	@Override
	public int pwdConfirm(ReplyVO rvo) {
		int result = 0;
		result = replyDao.pwdConfirm(rvo);
		return result;
	}

	// 글 삭제 구현
	@Override
	public int replyDelete(int rp_no) {
		int result = 0;
		try {
			result = replyDao.replyDelete(rp_no);
		}catch(Exception e) {
			e.printStackTrace();
			result= 0;
		}
		return result;
	}
	// 글 수정 구현
	@Override
	public int replyUpdate(ReplyVO rvo) {
		int result = 0;
		try {
			result = replyDao.replyUpdate(rvo);
		}catch(Exception e) {
			e.printStackTrace();
			result= 0;
		}
		return result;
	
	}

}
