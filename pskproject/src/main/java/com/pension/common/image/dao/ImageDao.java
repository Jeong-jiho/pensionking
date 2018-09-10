package com.pension.common.image.dao;

import java.util.List;

import com.pension.admin.room.vo.RoomVO;
import com.pension.common.image.vo.ImageVO;

public interface ImageDao {
	public int roomImageInsert(RoomVO rvo);
	public List<ImageVO> roomImageList(RoomVO rvo);
	public int imageDelete(ImageVO ivo);
	public int roomMainImageInsert(RoomVO rvo);
	public int imageAllDelete(RoomVO rvo);
}
