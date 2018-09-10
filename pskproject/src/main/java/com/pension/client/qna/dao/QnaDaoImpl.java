package com.pension.client.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.client.qna.vo.QnaVO;
import com.pension.client.review.vo.ReviewVO;

@Repository
public class QnaDaoImpl implements QnaDao {
	
	@Autowired
	private SqlSession session;
	
	// qna 목록 구현
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		return session.selectList("qnaList", qvo);
	}
	// 글 입력 구현
	@Override
	public int qnaInsert(QnaVO qvo) {
		return session.insert("qnaInsert", qvo);
	}
	// 글 상세 구현
	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		return (QnaVO)session.selectOne("qnaDetail", qvo);
	}
	// 비밀번호 확인
	@Override
	public int pwdConfirm(QnaVO qvo) {
		return session.selectOne("pwdConfirm", qvo);
	}
	// 조회수 확인
	@Override
	public int updateCnt(int q_no) {
		return session.update("updateCnt", q_no);
		
	}
	// 글 수정하기
	@Override
	public int qnaUpdate(QnaVO qvo) {
		return session.update("qnaUpdate", qvo);
	} 
	
	// 글 삭제하기
	@Override
	public int qnaDelete(int q_no) {
		return session.delete("qnaDelete", q_no);
	}

}
