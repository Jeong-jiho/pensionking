package com.pension.common.image.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.admin.room.vo.RoomVO;
import com.pension.common.image.vo.ImageVO;

@Repository
public class ImageDaoImpl implements ImageDao {
	@Autowired 
	private SqlSession session;

	@Override
	public int roomImageInsert(RoomVO rvo) {
		return session.insert("roomImageInsert",rvo);
	}

	@Override
	public List<ImageVO> roomImageList(RoomVO rvo) {
		return session.selectList("roomImageList",rvo);
	}

	@Override
	public int imageDelete(ImageVO ivo) {
		return (Integer)session.selectOne("imageDelete", ivo);
	}

	@Override
	public int roomMainImageInsert(RoomVO rvo) {
		return session.insert("roomMainImageInsert",rvo);
	}

	@Override
	public int imageAllDelete(RoomVO rvo) {
		return (Integer)session.delete("imageAllDelete",rvo);
	}
}
