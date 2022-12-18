package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Post;

public class PostDao {
	
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
	
	public Integer getnextPostNo() {
		return (Integer) SqlMapper.selectOne("posts.getnextPostNo");
	}
}
