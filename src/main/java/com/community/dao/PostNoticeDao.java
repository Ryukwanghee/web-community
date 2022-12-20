package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.dto.PostNoticeDto;
import com.community.util.SqlMapper;
import com.community.vo.PostNotice;

public class PostNoticeDao {
	
	private static PostNoticeDao instance = new PostNoticeDao();
	private PostNoticeDao() {}
	public static PostNoticeDao getInstance() {
		return instance;
	}
	public void addPostNotice(PostNotice notice) {
		SqlMapper.insert("postnotices.addPostNotice", notice);
	}
	
	public void updatePostNotice(PostNotice notice) {
		SqlMapper.update("postnotices.updatePostNotice", notice);
	}
	
	public PostNotice getPostNoticeByEmpNo(int empNo) {
		return (PostNotice) SqlMapper.selectOne("postnotices.getPostNoticeByEmpNo", empNo); 
	}
	
	public int getPostCount(int empNo) {
		return (Integer) SqlMapper.selectOne("postnotices.getPostCount", empNo);
	}
	
	public int getTotalRows(Map<String, Object> param) {
		return (Integer) SqlMapper.selectOne("postnotices.getTotalRows", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<PostNoticeDto> getPostNotices(Map<String, Object> param) {
		return (List<PostNoticeDto>) SqlMapper.selectList("postnotices.getPostNotices", param);
	}
}
