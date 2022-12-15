package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Department;

public class DepartmentDao {

	public Department getDepartmentByNo(int departmentNo) {
		return (Department) SqlMapper.selectOne("departments.getDepartmentByNo", departmentNo);
	}
}
