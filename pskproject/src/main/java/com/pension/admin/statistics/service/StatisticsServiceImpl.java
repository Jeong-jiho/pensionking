package com.pension.admin.statistics.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.statistics.dao.StatisticsDao;
import com.pension.admin.statistics.vo.StatisticsVO;

@Service
public class StatisticsServiceImpl implements StatisticsService {
	@Autowired
	private StatisticsDao statisticsDao;

	@Override
	public StatisticsVO statistics(StatisticsVO svo) {
		StatisticsVO st = statisticsDao.statistics(svo);
		return st;
	}

	@Override
	public List<StatisticsVO> statisticsRoom(StatisticsVO svo) {
		List<StatisticsVO> myList = statisticsDao.statisticsRoom(svo);
		return myList;
	}

	@Override
	public StatisticsVO todayCnt(StatisticsVO svo) {
		StatisticsVO st = statisticsDao.todayCnt(svo);
		return st;
	}

	@Override
	public List<StatisticsVO> todayIn(StatisticsVO svo) {
		List<StatisticsVO> myList = statisticsDao.todayIn(svo);
		return myList;
	}

	@Override
	public List<StatisticsVO> todayOut(StatisticsVO svo) {
		List<StatisticsVO> myList = statisticsDao.todayOut(svo);
		return myList;
	}  
}
