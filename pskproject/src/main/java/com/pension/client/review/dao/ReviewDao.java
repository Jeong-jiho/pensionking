package com.pension.client.review.dao;

import java.util.List;

import com.pension.client.review.vo.ReviewVO;

public interface ReviewDao {

	public List<ReviewVO> reviewList(ReviewVO rvo);

	
}
