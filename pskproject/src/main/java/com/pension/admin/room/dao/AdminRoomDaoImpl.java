package com.pension.admin.room.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.admin.room.vo.RoomVO;

@Repository
public class AdminRoomDaoImpl implements AdminRoomDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<RoomVO> roomList(RoomVO rvo) {
		return session.selectList("roomList",rvo);
	}
}
  