package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Position;
import com.community.vo.Question;

public class PositionDao {
		private static PositionDao instance = new PositionDao();
		private PositionDao() {}
		public static PositionDao getInstance() {
			return instance;
		}
		
		public Position getPositionByNo(int positionNo) {
			return (Position) SqlMapper.selectOne("positions.getPositionByNo", positionNo);
		}
		
		
}
