package com.pension.admin.notice.dao;

import java.util.List;

import com.pension.admin.notice.vo.NoticeVO;

  public interface NoticeDao{
 
	public List<NoticeVO> noticeList(NoticeVO nvo);

	public int noticeInsert(NoticeVO nvo);

	public NoticeVO noticeDetail(NoticeVO nvo);

	public int updateForm(NoticeVO nvo);

	public int noticeUpdate(NoticeVO nvo);

	public int noticeDelete(int n_no);

 
	
}
