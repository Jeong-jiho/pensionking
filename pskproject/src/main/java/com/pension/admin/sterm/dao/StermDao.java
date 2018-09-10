package com.pension.admin.sterm.dao;

import com.pension.admin.sterm.vo.StermVO;

public interface StermDao {
	public StermVO getSterm();
	public int stermInsert(StermVO svo);
	public int stermDelete(StermVO svo);
	public int confirm();
}
