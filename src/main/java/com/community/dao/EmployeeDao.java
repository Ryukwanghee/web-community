package com.community.dao;

import com.community.dto.EmployeeDto;
import com.community.util.SqlMapper;
import com.community.vo.Employee;

public class EmployeeDao {
	private static EmployeeDao instance = new EmployeeDao();
	private EmployeeDao() {}
	public static EmployeeDao getInstance() {
		return instance;
	}
	
	public Employee getEmployeeByNo(int no) {
		return (Employee) SqlMapper.selectOne("employees.getEmployeeByNo", no);
	}
	
	public EmployeeDto getEmployeeByEmail(String email) {
		return (EmployeeDto) SqlMapper.selectOne("employees.getEmployeeByEmail", email);
	}
	
	public void changePassword(Employee employee) {
		SqlMapper.update("employees.changePassword", employee);
	}
}
