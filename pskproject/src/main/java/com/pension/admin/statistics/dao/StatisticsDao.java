package com.pension.admin.statistics.dao;

import java.util.List;

import com.pension.admin.statistics.vo.StatisticsVO;

public interface StatisticsDao {
	public StatisticsVO statistics(StatisticsVO svo);
	public List<StatisticsVO> statisticsRoom(StatisticsVO svo);
	public StatisticsVO todayCnt(StatisticsVO svo);
	public List<StatisticsVO> todayIn(StatisticsVO svo);
	public List<StatisticsVO> todayOut(StatisticsVO svo);
}
