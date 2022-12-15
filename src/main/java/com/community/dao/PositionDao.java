package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Position;

public class PositionDao {
	private static PositionDao instance = new PositionDao();
	private PositionDao() {}
	public static PositionDao getInstance() {
		return instance;
	}
	
	public Position getPositionByNo(int no) {
		return (Position)SqlMapper.selectOne("positions.getPositionByNo", no);
	}
}
