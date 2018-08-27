package com.pension.client.review.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.client.review.vo.ReviewVO;

@Repository
public class ReviewDaoImpl implements ReviewDao{
 
	@Autowired
	private SqlSession session;
	
	
	// 글 목록 구현
	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo) {
		return session.selectList("reviewList", rvo);
	}	
	 
	// 글 입력 구현
	@Override
	public int reviewInsert(ReviewVO rvo) {
		return session.insert("reviewInsert", rvo);
	}

	// 글 상세 구현
	@Override
	public ReviewVO reviewDetail(ReviewVO rvo) {
		return (ReviewVO)session.selectOne("reviewDetail", rvo);
	}
	 
	// 비밀번호 확인
	@Override
	public int pwdConfirm(ReviewVO rvo) {
		return session.selectOne("pwdConfirm", rvo);
	}
	
	// 글 수정하기
	@Override
	public int reviewUpdate(ReviewVO rvo) {
		return session.update("reviewUpdate", rvo);
	}
	
	// 글 삭제하기
	@Override
	public int reviewDelete(int rv_no) {
		return session.delete("reviewDelete", rv_no); 
	}
	
	// 조회수 확인
	@Override
	public int updateCnt(Integer rv_no) throws Exception {
		return session.update("updateCnt", rv_no);
	}		

		
}





