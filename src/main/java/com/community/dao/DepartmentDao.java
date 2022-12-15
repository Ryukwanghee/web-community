package com.community.dao;


import com.community.util.SqlMapper;
import com.community.vo.Department;

public class DepartmentDao {

	private static DepartmentDao instance = new DepartmentDao();
	private DepartmentDao() {}
	public static DepartmentDao getInstance() {
		return instance;
	}	

	@SuppressWarnings("unchecked")
	public List<Department> getAllDeptartments() {
		return (List<Department>) SqlMapper.selectList("departments.getAllDeptartments");
	}
	
	public Department getDeptartmentByNo(int no) {
		return (Department) SqlMapper.selectOne("departments.getDeptartmentByNo", no);

	}
}
