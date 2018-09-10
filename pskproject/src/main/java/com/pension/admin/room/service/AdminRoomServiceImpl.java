package com.pension.admin.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.room.dao.AdminRoomDao;
import com.pension.admin.room.vo.RoomVO;

@Service
public class AdminRoomServiceImpl implements AdminRoomService {
	@Autowired
	private AdminRoomDao adminRoomDao;
	
	
	@Override
	public List<RoomVO> roomList(RoomVO rvo) {
		List<RoomVO> myList;
		myList = adminRoomDao.roomList(rvo);
		return myList; 
	}

	@Override
	public int roomInsert(RoomVO rvo) {
		int result = 0;
		try {
			result = adminRoomDao.roomInsert(rvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int getRoomSeq() {
		int result = 0;
		result = adminRoomDao.getRoomSeq();
		return result;
	}

	@Override
	public String getMain(int r_no) {
		String result ="";
		result = adminRoomDao.getMain(r_no);
		return result;
	}

	@Override
	public int roomR_mainUpdate(RoomVO rvo) {
		int result = 0;
		result = adminRoomDao.roomR_mainUpdate(rvo);
		return result;
	}

	@Override
	public RoomVO roomDetail(RoomVO rvo) {
		RoomVO detail = null;
		detail = adminRoomDao.roomDetail(rvo);
		return detail;
	}

	@Override
	public int roomUpdate(RoomVO rvo) {
		int result = 0;
		result = adminRoomDao.roomUpdate(rvo);
		return result;
	}

	@Override
	public int roomDelete(RoomVO rvo) {
		int result = 0;
		result = adminRoomDao.roomDelete(rvo);
		return result;
	}

	@Override
	public List<RoomVO> roomName(RoomVO rvo) {
		List<RoomVO> myList = null;
		myList = adminRoomDao.roomName(rvo);
		return myList;
	}
}
