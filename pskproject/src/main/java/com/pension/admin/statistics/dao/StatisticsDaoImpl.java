package com.pension.admin.statistics.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.admin.statistics.vo.StatisticsVO;

@Repository
public class StatisticsDaoImpl implements StatisticsDao {
	@Autowired
	private SqlSession session;

	@Override
	public StatisticsVO statistics(StatisticsVO svo) {
		return session.selectOne("statistics",svo);  
	}

	@Override
	public List<StatisticsVO> statisticsRoom(StatisticsVO svo) {
		return session.selectList("statisticsRoom",svo);
	}

	@Override
	public StatisticsVO todayCnt(StatisticsVO svo) {
		return session.selectOne("todayCnt",svo);
	}

	@Override
	public List<StatisticsVO> todayIn(StatisticsVO svo) {
		return session.selectList("todayIn", svo);
	}

	@Override
	public List<StatisticsVO> todayOut(StatisticsVO svo) {
		return session.selectList("todayOut", svo);
	}


}
