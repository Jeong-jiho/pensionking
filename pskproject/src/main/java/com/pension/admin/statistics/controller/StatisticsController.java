package com.pension.admin.statistics.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pension.admin.reservation.service.ReservationService;
import com.pension.admin.reservation.vo.ReservationVO;
import com.pension.admin.statistics.service.StatisticsService;
import com.pension.admin.statistics.vo.StatisticsVO;

@Controller
@RequestMapping(value="/statistics")
public class StatisticsController {
Logger logger = Logger.getLogger(StatisticsService.class);
	
	@Autowired 
	private StatisticsService statisticsService;
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping(value="/statistics.do", method = RequestMethod.GET)
	public String statistics(StatisticsVO svo,Model model) {
		logger.info("Statistics 호출 성공");
		
		StatisticsVO st = statisticsService.statistics(svo);
		List<StatisticsVO> stRoom = statisticsService.statisticsRoom(svo);

		model.addAttribute("st",st);
		model.addAttribute("stRoom",stRoom);
		
		return "admin/chart/statistics";
	}
	
	@RequestMapping(value="/main.do", method = RequestMethod.GET)
	public String main(StatisticsVO svo,ReservationVO resvo,Model model) {
		logger.info("Statistics 호출 성공");
		
		StatisticsVO todayCnt = statisticsService.todayCnt(svo);
		List<StatisticsVO> todayIn = statisticsService.todayIn(svo);
		List<StatisticsVO> todayOut = statisticsService.todayOut(svo);
		
		model.addAttribute("todayCnt",todayCnt);
		model.addAttribute("todayIn",todayIn);
		model.addAttribute("todayOut",todayOut);
		
		return "admin/main/mainPage";
	}
	
}
