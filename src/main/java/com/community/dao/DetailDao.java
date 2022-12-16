package com.community.dao;

import com.community.dto.DetailDto;
import com.community.util.SqlMapper;

public class DetailDao {
	
	private static DetailDao instance = new DetailDao();
	private DetailDao() {}
	public static DetailDao getInstance() {
		return instance;
	}
	
	public DetailDto getDetailByNo(int postNo) {
		return (DetailDto)SqlMapper.selectOne("details.getDetailByNo", postNo);
	}
}
