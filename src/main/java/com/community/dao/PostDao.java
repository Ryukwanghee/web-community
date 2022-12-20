package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.dto.PostDto;
import com.community.util.SqlMapper;
import com.community.vo.Post;

public class PostDao {
	
	private static PostDao instance = new PostDao();
	private PostDao() {}
	public static PostDao getInstance() {
		return instance;
	}
	
	public void insertPost(Post post) {
		SqlMapper.insert("posts.insertPost", post);
	}
	
	public void updatePost(Post post) {
		SqlMapper.update("posts.updatePost", post);
	}
	
	public Post getPostByNo(int no) {
		return (Post) SqlMapper.selectOne("posts.getPostByNo", no);
	}
	
	public void deletePost(Post post) {
		SqlMapper.update("posts.deletePost", post);
	}
	
	public int getPostCountByEmpNo(int writerNo) {
		return (Integer) SqlMapper.selectOne("posts.getPostCountByEmpNo", writerNo);
	}
	
	public int getTotalRows(Map<String, Object> param) { 
		 return (Integer) SqlMapper.selectOne("posts.getTotalRows", param); 
	}
	
	@SuppressWarnings("unchecked")
	public List<PostDto> getPosts(Map<String, Object> param){
		return (List<PostDto>) SqlMapper.selectList("posts.getPosts", param);
	}
}
