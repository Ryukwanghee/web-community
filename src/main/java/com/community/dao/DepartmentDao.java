package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Department;

public class DepartmentDao {
	private static DepartmentDao instance = new DepartmentDao();
	private DepartmentDao() {}
	public static DepartmentDao getInstance() {
		return instance;
	}
	
	public Department getDepartmentByNo (int no) {
		return (Department)SqlMapper.selectOne("departments.getDepartmentByNo", no);
	}
}
