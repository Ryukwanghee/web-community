package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Employee;

public class EmployeeDao {
	
	private static EmployeeDao instance = new EmployeeDao();
	private EmployeeDao() {}
	public static EmployeeDao getInstance() {
		return instance;
	}
	
	public Employee getEmployeeByNo(int id) {
		return (Employee) SqlMapper.selectOne("employees.getEmployeeByNo", id);
	}
}
