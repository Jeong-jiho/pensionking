package com.pension.client.review.service;

import java.util.List;

import com.pension.client.review.vo.ReviewVO;

public interface ReviewService {

	public List<ReviewVO> reviewList(ReviewVO vo);
}
