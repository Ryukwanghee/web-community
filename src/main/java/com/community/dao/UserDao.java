package com.community.dao;


import com.community.util.SqlMapper;
import com.community.vo.User;


public class UserDao {

	public User getUserById(String id) {
		return (User) SqlMapper.selectOne("users.getUserById", id);
	}
	
	public User getUserByEmail(String email) {
		return (User) SqlMapper.selectOne("users.getUserByEmail", email);
	}
	
	public void insertUser(User user) {
		SqlMapper.insert("users.insertUser", user);
	}
}
