package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.PostNotice;

public class PostNoticeDao {
	public void addNotice(PostNotice notice) {
		SqlMapper.insert("postnotices.addNotice", notice);
	}
	
	public void updateNotice(PostNotice notice) {
		SqlMapper.update("postnotices.updateNotice", notice);
	}
}
