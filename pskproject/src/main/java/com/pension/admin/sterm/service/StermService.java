package com.pension.admin.sterm.service;

import com.pension.admin.sterm.vo.StermVO;

public interface StermService {
	public StermVO getSterm();
	public int stermInsert(StermVO svo);
	public int stermDelete(StermVO svo);
	public int confirm();
}
