package com.pension.client.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.client.review.dao.ReviewDao;
import com.pension.client.review.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;
	
	
	@Override
	public List<ReviewVO> reviewList(ReviewVO vo) {
		
		return null;
	}


}
