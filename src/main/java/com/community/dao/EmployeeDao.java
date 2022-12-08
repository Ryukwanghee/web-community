package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Employee;

public class EmployeeDao {
	public Employee getEmployeeByNo(int no) {
		return (Employee) SqlMapper.selectOne("employees.getEmployeeByNo", no);
	}
	
	public Employee getEmployeeByEmail(String email) {
		return (Employee) SqlMapper.selectOne("employees.getEmployeeByEmail", email);
	}

}
