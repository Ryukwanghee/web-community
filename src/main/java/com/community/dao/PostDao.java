package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Post;

public class PostDao {
	
	public void insertPost(Post post) {
		SqlMapper.insert("posts.insertPost", post);
	}

}
