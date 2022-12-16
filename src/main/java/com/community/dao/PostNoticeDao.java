package com.community.dao;

import java.util.List;

import com.community.util.SqlMapper;
import com.community.vo.PostNotice;

public class PostNoticeDao {
	private static PostNoticeDao instance = new PostNoticeDao();
	private  PostNoticeDao() {}
	public static PostNoticeDao getInstance() {
		return instance;
	}
	
	public void addNotice(PostNotice notice) {
		SqlMapper.insert("postnotices.addNotice", notice);
	}
	
	@SuppressWarnings("unchecked")
	public List<PostNotice>  getPostNoticeByEmpNo(int empNo) {
		return (List<PostNotice>)SqlMapper.selectList("postNotices.getPostNoticeByEmpNo", empNo);
	}
	
	public int getPostNoticeCountByEmpNo(int empNo) {
		return (Integer)SqlMapper.selectOne("postNotices.getPostNoticeCountByEmpNo", empNo);
	}
	
	public void updateNotice(PostNotice notice) {
		SqlMapper.update("postnotices.updateNotice", notice);
	}
	
	
}
