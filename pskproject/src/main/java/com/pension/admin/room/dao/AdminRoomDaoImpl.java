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

	@Override
	public int roomInsert(RoomVO rvo) {
		return session.insert("roomInsert",rvo);
	}

	@Override
	public int getRoomSeq() {
		return (Integer)session.selectOne("getRoomSeq");
	}

	@Override
	public String getMain(int r_no) {
		return session.selectOne("getMain",r_no);
	}

	@Override
	public int roomR_mainUpdate(RoomVO rvo) {
		return (Integer)session.selectOne("roomR_mainUpdate", rvo);
	}

	@Override
	public RoomVO roomDetail(RoomVO rvo) {
		return (RoomVO)session.selectOne("roomDetail",rvo);
	}

	@Override
	public int roomUpdate(RoomVO rvo) {
		return (Integer)session.selectOne("roomUpdate",rvo);
	}

	@Override
	public int roomDelete(RoomVO rvo) {
		return (Integer)session.delete("roomDelete",rvo);
	}


	@Override
	public List<RoomVO> roomName(RoomVO rvo) {
		// TODO Auto-generated method stub
		return null;
	} 
	
	
}
 