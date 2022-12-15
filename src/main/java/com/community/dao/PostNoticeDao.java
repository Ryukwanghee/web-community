package com.community.dao;

import java.util.List;

import com.community.dto.PostNoticeDto;
import com.community.util.SqlMapper;

public class PostNoticeDao {

	private static PostNoticeDao instance = new PostNoticeDao();
	private  PostNoticeDao() {}
	public static PostNoticeDao getInstance() {
		return instance;
	}
	
	@SuppressWarnings("unchecked")
	public List<PostNoticeDto>  getPostNoticeByEmpNo(int empNo) {
		return (List<PostNoticeDto>)SqlMapper.selectList("postNotices.getPostNoticeByEmpNo", empNo);
	}
	
	public int getPostNoticeCountByEmpNo(int empNo) {
		return (Integer)SqlMapper.selectOne("postNotices.getPostNoticeCountByEmpNo", empNo);
	}
}
