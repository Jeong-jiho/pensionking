package com.pension.admin.employee.service;

import java.util.List;

import com.pension.admin.employee.vo.EmployeeVO;

public interface EmployeeService {

	public List<EmployeeVO> employeeList(EmployeeVO evo);
	public EmployeeVO employeeDetail(EmployeeVO evo);
	public int employeeInsert(EmployeeVO evo);
	public int employeeUpdate(EmployeeVO evo);
	public int employeeRetire(EmployeeVO evo);
}
