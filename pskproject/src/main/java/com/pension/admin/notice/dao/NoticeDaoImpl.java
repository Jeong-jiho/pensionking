package com.pension.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
import com.pension.admin.notice.vo.NoticeVO;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	  
	@Autowired
	private SqlSession session;
	
	// 공지사항 목록 구현
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		return session.selectList("noticeList", nvo);
	} 
	// 공지사항 입력
	@Override
	public int noticeInsert(NoticeVO nvo) {
		return session.insert("noticeInsert", nvo);
	}
	
	// 공지사항 상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		return (NoticeVO)session.selectOne("noticeDetail", nvo);
	}
	
	// 공지사항 수정  폼 구현
	@Override
	public int updateForm(NoticeVO nvo) {
		return session.update("noticeUpdate", nvo);
	}
		
	// 공지사항 수정
	@Override
	public int noticeUpdate(NoticeVO nvo) {
		return session.update("noticeUpdate", nvo);
	}
	
	// 공지사항 삭제
	@Override
	public int noticeDelete(int n_no) {
		return session.delete("noticeDelete", n_no); 
	}


}
