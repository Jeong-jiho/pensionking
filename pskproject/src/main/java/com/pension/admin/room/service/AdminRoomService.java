package com.pension.admin.room.service;

import java.util.List;

import com.pension.admin.room.vo.RoomVO;

public interface AdminRoomService {
	public List<RoomVO> roomList(RoomVO rvo);
	public int roomInsert(RoomVO rvo);
	public int getRoomSeq();
	public String getMain(int r_no);
	public int roomR_mainUpdate(RoomVO rvo);
	public RoomVO roomDetail(RoomVO rvo);
	public int roomUpdate(RoomVO rvo);
	public int roomDelete(RoomVO rvo);
	public List<RoomVO> roomName(RoomVO rvo);
}
