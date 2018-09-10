package com.pension.client.qna.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.pension.client.qna.dao.QnaDao;
import com.pension.client.qna.vo.QnaVO;




@Service
public class QnaServiceImpl implements QnaService {
	Logger logger = Logger.getLogger(QnaServiceImpl.class);
	 
	@Autowired
	private QnaDao qnaDao;
				
	// 목록 구현	
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		
		List<QnaVO> myList = null;
		 
		if(qvo.getSearch()=="") {
		qvo.setSearch("all");
		} 
		myList = qnaDao.qnaList(qvo);
		return myList;
	}

	// 글 입력 구현
	@Override
	public int qnaInsert(QnaVO qvo) {
		int result = 0;
		try {
			result = qnaDao.qnaInsert(qvo);
		}catch(Exception e) {
			e.printStackTrace();
			result= 0;
		}
		return result;
	}

	// 글 상세 구현 
	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		QnaVO detail = new QnaVO();
		qnaDao.updateCnt(qvo.getQ_no());				
		detail = qnaDao.qnaDetail(qvo);
			
		return detail;
	}

	// 비밀번호 확인
	@Override
	public int pwdConfirm(QnaVO qvo) {
			int result = 0;
			result = qnaDao.pwdConfirm(qvo);
			return result;
	}

	// 수정하기
		@Override
		public int qnaUpdate(QnaVO qvo) {
			int result = 0;
			try{
				result =  qnaDao.qnaUpdate(qvo);
			}catch(Exception e) {
				e.printStackTrace();
				result=0;
			}
			return result;
		}

		// 삭제하기
		@Override
		public int qnaDelete(int q_no) {
			int result = 0;
			try  {
				result = qnaDao.qnaDelete(q_no);
			}catch(Exception e) {
				e.printStackTrace();
				result = 0;
			}
			return result;
		}		
}