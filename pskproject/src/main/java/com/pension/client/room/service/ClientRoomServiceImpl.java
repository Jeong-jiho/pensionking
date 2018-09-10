package com.pension.client.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.room.dao.AdminRoomDao;
import com.pension.admin.room.vo.RoomVO;

@Service
public class ClientRoomServiceImpl implements ClientRoomService {

	@Autowired
	private AdminRoomDao adminRoomDao;

	@Override 
	public List<RoomVO> roomList(RoomVO rvo) {
		List<RoomVO> myList;
		myList = adminRoomDao.roomList(rvo);
		return myList; 
	}

	@Override
	public RoomVO roomDetail(RoomVO rvo) {
		RoomVO detail = null;
		detail = adminRoomDao.roomDetail(rvo);
		return detail;
	}
}
