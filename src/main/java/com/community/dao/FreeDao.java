package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.util.SqlMapper;
import com.community.vo.Free;


public class FreeDao {
	
	private static FreeDao instance = new FreeDao();
	private FreeDao() {}
	public static FreeDao getInstance () {
		return instance;
	}
	
	@SuppressWarnings("unchecked")
	public List<Free> getFrees(Map<String, Object> param) {
		return (List<Free>)SqlMapper.selectList("frees.getFrees", param);
	}
	
	public Free getFreeByNo(int no) {
		return (Free)SqlMapper.selectOne("frees.getFreeByNo", no);
	}
	
	public int getPostsCountByWriterNo(int writerNo) {
		return (Integer)SqlMapper.selectOne("frees.getPostsCountByWriterNo", writerNo);
	}
	
	public void updateFree(Free free) {
		SqlMapper.update("frees.updateFree", free);
	}
	
	public void insertFree(Free free) {
		SqlMapper.insert("frees.insertFree", free);
	}
	
	public int getTotalRows(Map<String, Object> param) {
		return (Integer)SqlMapper.selectOne("frees.getTotalRows", param);
	}
	
	/**
	 * free의 삭제관련된 것만 업데이트하는 메소드.
	 * @param no
	 */
	public void upateFreeDeleted(int no) {
		SqlMapper.update("frees.upateFreeDeleted", no);
	}
}
