package com.pension.admin.qna.service;

import java.util.List;
import com.pension.client.qna.vo.QnaVO;



public interface AdminQnaService {

	public List<QnaVO> qnaList(QnaVO qvo);
	
	public QnaVO qnaDetail(QnaVO qvo);
}
