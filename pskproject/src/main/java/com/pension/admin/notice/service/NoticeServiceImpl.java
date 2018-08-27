package com.pension.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.notice.dao.NoticeDao;
import com.pension.admin.notice.vo.NoticeVO;

 
@Service
public class NoticeServiceImpl implements NoticeService {
	  
	@Autowired
	private NoticeDao noticeDao;
	
	// 공지 사항 목록 구현	
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		List<NoticeVO> myList = null;
		myList = noticeDao.noticeList(nvo);
		return myList;
	}
	
	// 공지사항 입력
	@Override
	public int noticeInsert(NoticeVO nvo) {
		int result = 0;
		try {
			result = noticeDao.noticeInsert(nvo);
		}catch(Exception e) {
			e.printStackTrace();
			result= 0;
		}
		return result;
	}
	
	// 공지사항 상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		NoticeVO detail = new NoticeVO();
		detail = noticeDao.noticeDetail(nvo);
		
		return detail;
	}
	
	// 공지사항 수정
	@Override
	public int noticeUpdate(NoticeVO nvo) {
		int result = 0;
		try{
			result =  noticeDao.noticeUpdate(nvo);
		}catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
	}
	
	// 공지사항 삭제
	@Override
	public int noticeDelete(int n_no) {
		int result = 0;
		try{
			result =  noticeDao.noticeDelete(n_no);
		}catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
	
	 
	}
}

