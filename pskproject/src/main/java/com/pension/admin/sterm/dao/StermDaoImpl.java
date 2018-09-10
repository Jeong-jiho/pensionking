package com.pension.admin.sterm.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.admin.sterm.vo.StermVO;

@Repository
public class StermDaoImpl implements StermDao {
	@Autowired
	private SqlSession session;

	@Override
	public StermVO getSterm() {
		return (StermVO)session.selectOne("getSterm");
	}

	@Override
	public int stermInsert(StermVO svo) {
		return (Integer)session.insert("stermInsert",svo);
	}

	@Override
	public int stermDelete(StermVO svo) {
		return (Integer)session.delete("stermDelete",svo);
	}

	@Override
	public int confirm() {
		return (Integer)session.selectOne("confirm");
	} 
}
