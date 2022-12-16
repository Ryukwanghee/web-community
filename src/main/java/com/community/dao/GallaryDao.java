package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.dto.PostDto;
import com.community.util.SqlMapper;


public class GallaryDao {
	
	@SuppressWarnings("unchecked")
	public List<PostDto> getGallary(Map<String, Object> param){
		return (List<PostDto>) SqlMapper.selectList("gallaries.getGallary", param);
	}
	
	public int getTotalRows(Map<String, Object> param) {
		return (Integer) SqlMapper.selectOne("gallaries.getTotalRows", param);
	}
	
	public PostDto getPostByNo(int no) {
		return (PostDto) SqlMapper.selectOne("gallaries.getPostByNo", no);
	}
	
	public void updateCount(PostDto post) {
		SqlMapper.update("gallaries.updateCount", post);
	}
	
	public void updateGallary(PostDto post) {
		SqlMapper.update("gallaries.updateFileShare", post);
	}
}