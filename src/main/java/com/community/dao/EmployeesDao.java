package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Employees;


public class EmployeesDao {
	
	private static EmployeesDao instance = new EmployeesDao();
	private EmployeesDao() {}
	public static EmployeesDao getInstance() {
		return instance;
	}

	public Employees getUserById(String id) {
		return (Employees) SqlMapper.selectOne("employees.getUserById", id);
	}
	
	public Employees getUserByNo(int no) {
		return (Employees) SqlMapper.selectOne("employees.getUserByNo", no);
	}
	
	public Employees getUserByEmail(String email) {
		return (Employees) SqlMapper.selectOne("employees.getUserByEmail", email);
	}
	
	public void insertEmployees(Employees employees) {
		SqlMapper.insert("employees.insertEmployees", employees);
	}
}
