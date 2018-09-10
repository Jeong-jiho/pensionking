package com.pension.client.notice.service;

import java.util.List;
import com.pension.admin.notice.vo.NoticeVO;

public interface ClientNoticeService {

	public List<NoticeVO> NoticeList(NoticeVO nvo);

	public NoticeVO noticeDetail(NoticeVO nvo);

	
}
