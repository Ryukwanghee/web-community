package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.util.SqlMapper;
import com.community.vo.Notice;
import com.community.vo.TempPost;

public class TempPostDao {

	public void insertTempPost(TempPost temppost) {
		SqlMapper.insert("temppost.insertTempPost" , temppost);
	}
	
	@SuppressWarnings("unchecked")
	public List<TempPost> getTemps(Map<String, Object> param) {
		return (List<TempPost>)SqlMapper.selectList("temppost.getTemps", param);
	}

	public int getTotalRows(Map<String, Object> param) {
		return (Integer) SqlMapper.selectOne("temppost.getTotalRows", param);
	}
	
	public Notice getNoticeByNo(int boardNo) {
		return (Notice) SqlMapper.selectOne("temppost.getBoardByNo", boardNo);
	}
	
	public void updateNotice(Notice notice) {
		SqlMapper.update("temppost.updateBoard", notice);
	}
}
