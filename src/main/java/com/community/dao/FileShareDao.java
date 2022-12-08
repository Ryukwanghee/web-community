package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.util.SqlMapper;
import com.community.vo.Employee;
import com.community.vo.FileShare;
import com.community.vo.Post;

public class FileShareDao {
	
	@SuppressWarnings("unchecked")
	public List<Post> getFileShares(Map<String, Object> param){
		return (List<Post>) SqlMapper.selectList("fileshares.getFileShares", param);
	}
	
	public int getTotalRows() {
		return (Integer) SqlMapper.selectOne("fileshares.getTotalRows");
	}
	
	public Employee getEmployeeByNo(int no) {
		return (Employee) SqlMapper.selectOne("fileshares.getEmployeeByNo", no);
	}
	
	public Employee getEmployeeByName(String name) {
		return (Employee) SqlMapper.selectOne("fileshares.getEmployeeByName", name);
	}
}
