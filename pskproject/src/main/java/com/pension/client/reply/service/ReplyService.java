package com.pension.client.reply.service;

import java.util.List;

import com.pension.client.reply.vo.ReplyVO;
 
public interface ReplyService {
	
	public List<ReplyVO> replyList(Integer rv_no);

	public int replyInsert(ReplyVO rvo);

	public int pwdConfirm(ReplyVO rvo);

	public int replyDelete(int rv_no);

	public int replyUpdate(ReplyVO rvo);

			
}

