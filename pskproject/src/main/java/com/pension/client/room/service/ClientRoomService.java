package com.pension.client.room.service;

import java.util.List;

import com.pension.admin.room.vo.RoomVO;

public interface ClientRoomService {

	public List<RoomVO> roomList(RoomVO rvo);

	public RoomVO roomDetail(RoomVO rvo);

} 
