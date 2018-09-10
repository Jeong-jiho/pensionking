package com.pension.admin.review.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pension.client.review.dao.ReviewDao;
import com.pension.client.review.vo.ReviewVO;

@Service
public class AdminReviewServiceImpl implements AdminReviewService {
    
	@Autowired
	private ReviewDao reviewDao;

	// 목록 구현
	@Override
	   public List<ReviewVO> reviewList(ReviewVO rvo) {
	      List<ReviewVO> aList = null;
	      aList = reviewDao.reviewList(rvo);
	      
	      return aList;
	   }

	// 상세 구현
	@Override
	public ReviewVO reviewDetail(ReviewVO rvo) {
		ReviewVO detail = new ReviewVO();
		detail = reviewDao.reviewDetail(rvo);
				
		return detail;
	}
}
