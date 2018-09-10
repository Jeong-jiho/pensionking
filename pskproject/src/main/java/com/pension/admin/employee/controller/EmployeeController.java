package com.pension.admin.employee.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pension.admin.employee.service.EmployeeService;
import com.pension.admin.employee.vo.EmployeeVO;

@Controller
@RequestMapping(value="/admin")
public class EmployeeController {
	Logger logger = Logger.getLogger(EmployeeController.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	/*******************************************************************
	 * 직원 리스트 구현하기
	 *******************************************************************/
	@RequestMapping(value="/employee/employeeList.do", method = RequestMethod.GET)
	public String employeeList(@ModelAttribute("employeeData") EmployeeVO evo, Model model) {
		logger.info("employeeList 호출 성공");
		
		List<EmployeeVO> employeeList = employeeService.employeeList(evo);
		model.addAttribute("employeeList", employeeList);
		
		return "admin/employee/employeeList";
	}
	
	/*******************************************************************
	 * 직원 리스트 상세보기 구현하기
	 *******************************************************************/
	@RequestMapping(value="/employee/employeeDetail.do", method = RequestMethod.GET)
	public String employeeDetail(EmployeeVO evo, Model model) {
		logger.info("employeeDetail 호출 성공");
		logger.info("e_no = " + evo.getE_no());
		
		EmployeeVO detail = new EmployeeVO();
		detail = employeeService.employeeDetail(evo);
		
		model.addAttribute("detail", detail);
		
		return "admin/employee/employeeDetail";
	}
	
	/*******************************************************************
	 * 직원 등록(폼) 구현하기
	 *******************************************************************/
	@RequestMapping(value="/employee/insertForm.do")
	public String employeeInsertForm() {
		logger.info("writeForm 호출 성공");
		 return "admin/employee/insertForm";
	}
	
	/*******************************************************************
	 * 직원 등록 구현하기
	 *******************************************************************/
	@RequestMapping(value="/employee/employeeInsert.do", method = RequestMethod.POST)
	public String employeeInsert(EmployeeVO evo, Model model, HttpServletRequest request) throws IllegalStateException, IOException{
		logger.info("employeeInsert 호출");
		
		int result = 0;
		String url = "";
		
		result = employeeService.employeeInsert(evo);
		if(result == 1) {
			url="/admin/employee/employeeList.do";
		}else {
			model.addAttribute("code",1);
			url="/admin/employee/insertForm.do";
		}
		return "redirect:" + url;
	}
	
	/*******************************************************************
	 * 직원 수정(폼) 구현하기
	 *******************************************************************/
	@RequestMapping(value="/employee/updateForm.do")
	   public String updateForm(EmployeeVO evo, Model model) {
		   logger.info("updateForm 호출 성공");
		   
		   logger.info("e_no = " + evo.getE_no());
		   
		   EmployeeVO updateData = new EmployeeVO();
		   updateData = employeeService.employeeDetail(evo);
		   
		   model.addAttribute("updateData", updateData);
		   return "admin/employee/updateForm";
	   }
	
	/*******************************************************************
	 * 직원 수정 구현하기
	 *******************************************************************/
	@RequestMapping(value="/employee/employeeUpdate.do", method=RequestMethod.POST)
	public String employeeUpdate(EmployeeVO evo, HttpServletRequest request) throws IOException {
		logger.info("employeeUpdate 호출 성공");
		logger.info(evo.toString());
		int result = 0;
		String url = "";
		
		result = employeeService.employeeUpdate(evo);
		
		if(result == 1) {
			url="/admin/employee/employeeDetail.do?e_no="+evo.getE_no();
		}else {
			url="/admin/employee/updateForm.do?e_no="+evo.getE_no();
		}
		
		return "redirect:"+url;
	}
	
	/*******************************************************************
	 * 직원 퇴사 구현하기
	 *******************************************************************/
	@RequestMapping(value="/employee/employeeRetire.do", method=RequestMethod.POST)
	public String employeeRetire(EmployeeVO evo, HttpServletRequest request) throws IOException {
		logger.info("employeeRetire 호출 성공");
		logger.info(evo.toString());
		int result = 0;
		String url = "";
		
		result = employeeService.employeeRetire(evo);
		
		if(result == 1) {
			url="/admin/employee/employeeDetail.do?e_no="+evo.getE_no();
		}else {
			url="/admin/employee/employeeDetail.do?e_no="+evo.getE_no();
		}
		
		return "redirect:"+url;
	}
}
