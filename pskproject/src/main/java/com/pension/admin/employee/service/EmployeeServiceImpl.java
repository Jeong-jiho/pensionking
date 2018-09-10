package com.pension.admin.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pension.admin.employee.dao.EmployeeDao;
import com.pension.admin.employee.vo.EmployeeVO;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeDao employeeDao;
	
	@Override
	public List<EmployeeVO> employeeList(EmployeeVO evo) {
		List<EmployeeVO> eList = null;
		
		eList = employeeDao.employeeList(evo);
		return eList;
	}
	
	//직원 상세보기 구현
	@Override
	public EmployeeVO employeeDetail(EmployeeVO evo) {
		EmployeeVO detail = null;
		detail = employeeDao.employeeDetail(evo);
		
		return detail;
	}

	@Override
	public int employeeInsert(EmployeeVO evo) {
		int result = 0;
		try {
			result = employeeDao.employeeInsert(evo);
		}catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int employeeUpdate(EmployeeVO evo) {
		int result = 0;
		try {
			result = employeeDao.employeeUpdate(evo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int employeeRetire(EmployeeVO evo) {
		int result = 0;
		try {
			result = employeeDao.employeeRetire(evo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}


}
