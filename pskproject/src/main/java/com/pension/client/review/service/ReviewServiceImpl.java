package com.pension.client.review.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pension.client.reply.dao.ReplyDao;
import com.pension.client.review.dao.ReviewDao;
import com.pension.client.review.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	Logger logger = Logger.getLogger(ReviewServiceImpl.class);
	 
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private ReplyDao replyDao;
	
	
	// 목록 구현	
	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo) {
		
		List<ReviewVO> myList = null;
		 
		if(rvo.getSearch()=="") {
		rvo.setSearch("all");
		} 
		myList = reviewDao.reviewList(rvo);
		return myList;
	}
	
	// 글 입력 구현
	@Override
	public int reviewInsert(ReviewVO rvo) {
		int result = 0;
		try {
			result = reviewDao.reviewInsert(rvo);
		}catch(Exception e) {
			e.printStackTrace();
			result= 0;
		}
		return result;
	}
	
	// 글 상세 구현 
	@Override
	public ReviewVO reviewDetail(ReviewVO rvo) {
		ReviewVO detail = new ReviewVO();
						
		detail = reviewDao.reviewDetail(rvo);
		
		
		return detail;
	}
	
	// 비밀번호 확인
	@Override
	public int pwdConfirm(ReviewVO rvo) {
		int result = 0;
		result = reviewDao.pwdConfirm(rvo);
		return result;
	}
	
	// 수정하기
	@Override
	public int reviewUpdate(ReviewVO rvo) {
		int result = 0;
		try{
			result =  reviewDao.reviewUpdate(rvo);
		}catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
	}
	
	// 삭제하기
	@Override
	public int reviewDelete(int rv_no) {
		int result = 0;
		try {
			result = reviewDao.reviewDelete(rv_no);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
		
	// 댓글 조회수
	@Override
	public int replyCount(int rv_no) {
		int result = replyDao.replyCount(rv_no);
		return result;
	}
	
}
