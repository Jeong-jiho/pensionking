package com.pension.admin.employee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pension.admin.employee.vo.EmployeeVO;

@Repository
public class EmployeeDaoImpl implements EmployeeDao{
	@Autowired
	private SqlSession session;
	
	//직원목록
	@Override
	public List<EmployeeVO> employeeList(EmployeeVO evo) {
		
		return session.selectList("employeeList", evo);
	}
	
	//직원 상세보기 
	@Override
	public EmployeeVO employeeDetail(EmployeeVO evo) {
		
		return session.selectOne("employeeDetail", evo);
	}

	@Override
	public int employeeInsert(EmployeeVO evo) {
	
		return session.insert("employeeInsert", evo);
	}

	@Override
	public int employeeUpdate(EmployeeVO evo) {
		
		return session.update("employeeUpdate", evo);
	}

	@Override
	public int employeeRetire(EmployeeVO evo) {

		return session.update("employeeRetire", evo);
	}
}
