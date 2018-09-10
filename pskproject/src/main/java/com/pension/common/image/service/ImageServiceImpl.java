package com.pension.common.image.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.room.dao.AdminRoomDao;
import com.pension.admin.room.vo.RoomVO;
import com.pension.common.image.dao.ImageDao;
import com.pension.common.image.vo.ImageVO;

@Service
public class ImageServiceImpl implements ImageService {
	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private AdminRoomDao adminRoomDao;

	@Override
	public int roomImageInsert(RoomVO rvo) {
		int result = 0;
		result = imageDao.roomImageInsert(rvo);
		
		return result;
	}

	@Override
	public List<ImageVO> roomImageList(RoomVO rvo) {
		List<ImageVO> imageList = null;
		imageList = imageDao.roomImageList(rvo);
		return imageList;
	}

	@Override
	public int imageDelete(ImageVO ivo) {
		int result = 0;
		result = imageDao.imageDelete(ivo);
		return result;
	}

	@Override
	public String getMain(int r_no) {
		String result="";
		result = adminRoomDao.getMain(r_no);
		return result;
	}

	@Override
	public int roomMainImageInsert(RoomVO rvo) {
		int result = 0;
		result = imageDao.roomMainImageInsert(rvo);
		return result;
	}

	@Override
	public int imageAllDelete(RoomVO rvo) {
		int result = 0;
		result = imageDao.imageAllDelete(rvo);
		return result;
	}
}
