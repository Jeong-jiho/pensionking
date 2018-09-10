package com.pension.admin.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.client.qna.dao.QnaDao;
import com.pension.client.qna.vo.QnaVO;


@Service
public class AdminQnaSeviceImpl implements AdminQnaService{
	
	@Autowired
	private QnaDao qnaDao;
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> aList = null;
	    aList = qnaDao.qnaList(qvo);
	      
	    return aList;
	}
	
	// 상세 구현
	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		QnaVO detail = new QnaVO();
		detail = qnaDao.qnaDetail(qvo);
				
		return detail;
	}	
}
