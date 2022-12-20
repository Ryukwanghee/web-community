package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.util.SqlMapper;
import com.community.vo.Notice;

public class NoticeDao {
	
	private static NoticeDao instance = new NoticeDao();
	private NoticeDao() {}
	public static NoticeDao getInstance() {
		return instance;
	}
	
	public void insertNotice(Notice notice) {
		SqlMapper.insert("notices.insertNotice" , notice);
	}
	
	@SuppressWarnings("unchecked")
	public List<Notice> getNotices(Map<String, Object> param) {
		return (List<Notice>)SqlMapper.selectList("notices.getNotices", param);
	}

	public int getTotalRows() {
		return (Integer) SqlMapper.selectOne("notices.getTotalRows");
	}
	
	public Notice getNoticeByNo(int postNo) {
		return (Notice) SqlMapper.selectOne("notices.getNoticeByNo", postNo);
	}
	
	public void updateNotice(Notice notice) {
		SqlMapper.update("notices.updateNotice", notice);
	}
	
	public int getNoticeCountByReceiveNo(int receiveNo) {
		return (Integer) SqlMapper.selectOne("notices.getNoticeCountByReceiveNo", receiveNo);
	}
}
