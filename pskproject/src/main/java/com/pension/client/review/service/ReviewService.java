package com.pension.client.review.service;

import java.util.List;

import com.pension.client.review.vo.ReviewVO;

public interface ReviewService {

	public List<ReviewVO> reviewList(ReviewVO rvo);
 
	public int reviewInsert(ReviewVO rvo);
	
	public ReviewVO reviewDetail(ReviewVO rvo);

	public int pwdConfirm(ReviewVO rvo);

	public int reviewUpdate(ReviewVO rvo);

	public int reviewDelete(int rv_no);
 
	public int replyCount(int rv_no);

	
	}
 