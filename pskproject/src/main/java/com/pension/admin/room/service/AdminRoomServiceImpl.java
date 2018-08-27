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
}
 