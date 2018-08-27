package com.pension.client.review.dao;

import java.util.List;

import com.pension.client.review.vo.ReviewVO;

public interface ReviewDao {

	public List<ReviewVO> reviewList(ReviewVO rvo);
		 
	public int reviewInsert(ReviewVO rvo);

	public ReviewVO reviewDetail(ReviewVO rvo);

	public int pwdConfirm(ReviewVO rvo);

	public int reviewUpdate(ReviewVO rvo);

	public int reviewDelete(int rv_no);

	public int updateCnt(Integer rv_no) throws Exception;

	 
}
