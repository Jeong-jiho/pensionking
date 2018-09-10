package com.pension.admin.chart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/chart")
public class ChartController {
	
	@RequestMapping(value="/chartList.do")
	public String chartList() {
		return "admin/chart/chart";
	}
}
