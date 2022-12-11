package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Employees;


public class EmployeesDao {

	public Employees getUserById(String id) {
		return (Employees) SqlMapper.selectOne("getUserById", id);
	}
	
	public Employees getUserByNo(int no) {
		return (Employees) SqlMapper.selectOne("getUserByNo", no);
	}
	
	public Employees getUserByEmail(String email) {
		return (Employees) SqlMapper.selectOne("getUserByEmail", email);
	}
	
	public void insertUser(Employees employees) {
		SqlMapper.insert("insertUser", employees);
	}
}
