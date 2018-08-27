package com.pension.client.reply.dao;

import java.util.List;

import com.pension.client.reply.vo.ReplyVO;
 
public interface ReplyDao {

	public List<ReplyVO> replyList(Integer rv_no);

	public int replyInsert(ReplyVO rvo);

	public int pwdConfirm(ReplyVO rvo);

	public int replyDelete(int rp_no);

	public int replyUpdate(ReplyVO rvo);

	public int replyCount(int rv_no);
	
}
