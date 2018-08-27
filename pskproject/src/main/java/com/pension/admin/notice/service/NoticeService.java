package com.pension.admin.notice.service;

import java.util.List;

import com.pension.admin.notice.vo.NoticeVO;

public interface NoticeService {
 
	public List<NoticeVO> noticeList(NoticeVO nvo);

	public int noticeInsert(NoticeVO nvo);

	public NoticeVO noticeDetail(NoticeVO nvo);

	public int noticeUpdate(NoticeVO nvo);

	public int noticeDelete(int n_no);

 
}
