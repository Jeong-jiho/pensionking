package com.pension.client.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pension.admin.notice.dao.NoticeDao;
import com.pension.admin.notice.vo.NoticeVO;

@Service
public class ClientNoticeServiceImpl implements ClientNoticeService {
	   
	@Autowired
	private NoticeDao noticeDao;
		
	
	// 공지사항 리스트 구현
	@Override
	public List<NoticeVO> NoticeList(NoticeVO nvo) {
	   List<NoticeVO> aList = null;
	   aList = noticeDao.noticeList(nvo);
	       
	   return aList;
	   }
	
	// 공지사항 상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
	   NoticeVO detail = new NoticeVO();
	   detail = noticeDao.noticeDetail(nvo);
			
	   return detail;
	   }
		


}