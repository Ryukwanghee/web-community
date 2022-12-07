package com.community.dao;

import java.util.List;

import com.community.util.SqlMapper;
import com.community.vo.Free;

public class FreeDao {
	
	@SuppressWarnings("unchecked")
	public List<Free> getAllFree() {
		return (List<Free>)SqlMapper.selectList("frees.getAllFree");
	}
	
	public Free getFreeByNo(int no) {
		return (Free)SqlMapper.selectOne("frees.getFreeByNo", no);
	}
	
	public void updateFree(Free free) {
		SqlMapper.update("updateFree", free);
	}
}
