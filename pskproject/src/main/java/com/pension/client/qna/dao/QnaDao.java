package com.pension.client.qna.dao;

import java.util.List;

import com.pension.client.qna.vo.QnaVO;

public interface QnaDao {

	public List<QnaVO> qnaList(QnaVO qvo);

	public int qnaInsert(QnaVO qvo);

	public QnaVO qnaDetail(QnaVO qvo);

	public int pwdConfirm(QnaVO qvo);
	
	public int updateCnt(int q_no);

	public int qnaUpdate(QnaVO qvo);
 
	public int qnaDelete(int q_no);
	

	
}
