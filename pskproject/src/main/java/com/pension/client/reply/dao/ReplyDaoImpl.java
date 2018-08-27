package com.pension.client.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
import com.pension.client.reply.vo.ReplyVO;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	private SqlSession session;

	// 글 목록 구현
	@Override
	public List<ReplyVO> replyList(Integer rv_no) {
		return session.selectList("replyList", rv_no);
	}
	
	// 글 입력 구현
	@Override
	public int replyInsert(ReplyVO rvo) {
		return session.insert("ReplyVO", rvo);
	}
	// 비밀번호 입력칸
	@Override
	public int pwdConfirm(ReplyVO rvo) {
		return (Integer)session.selectOne("pwdConfirm", rvo);
	}
	// 글 삭제 구현
	@Override
	public int replyDelete(int rp_no) {
		return session.delete("replyDelete", rp_no);
	}
	// 글 수정 구현
	@Override
	public int replyUpdate(ReplyVO rvo) {
		return session.update("replyUpdate", rvo);
	}

	// 전체 레코드 수 구하기
	@Override
	public int replyCount(int rv_no) {
		return (Integer)session.selectOne("replyCount", rv_no);
	}
		
}