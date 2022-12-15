package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Notice;

public class NoticeDao {
	public void addNotice(Notice notice) {
		SqlMapper.insert("notices.addNotice", notice);
	}
	
	public void updateNotice(Notice notice) {
		SqlMapper.update("notices.updateNotice", notice);
	}
}
