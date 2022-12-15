package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.util.SqlMapper;
import com.community.vo.Board;

public class BoardDao {

	private static BoardDao instance = new BoardDao();
	private BoardDao() {}
	public static BoardDao getInstance() {
		return instance;
	}
	
	public int getBoardByNo(int no) {
		return (Integer) SqlMapper.selectOne("boards.getBoardByNo", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<Board> getBoards() {
		return (List<Board>) SqlMapper.selectList("boards.getBoards");
	}
}
