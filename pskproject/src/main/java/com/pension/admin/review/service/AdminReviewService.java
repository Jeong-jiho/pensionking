package com.pension.admin.review.service;

import java.util.List;
import com.pension.client.review.vo.ReviewVO;

public interface AdminReviewService {

	public List<ReviewVO> reviewList(ReviewVO rvo);

	public ReviewVO reviewDetail(ReviewVO rvo);

}
