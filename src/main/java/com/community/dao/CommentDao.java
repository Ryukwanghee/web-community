package com.community.dao;

import java.util.List;

import com.community.dto.CommentDto;
import com.community.util.SqlMapper;

public class CommentDao {
	
	private static CommentDao instance = new CommentDao();
	private CommentDao() {}
	public static CommentDao getInstance() {
		return instance;
	}
	
	public void insertComment(CommentDto commentDto) {
		SqlMapper.insert("comments.insertComment", commentDto);
	}
	
	@SuppressWarnings("unchecked")
	public List<CommentDto> getComments(int postNo){
		return (List<CommentDto>)SqlMapper.selectList("comments.getComments", postNo);
	}
	
	public CommentDto getCommentBycommentNo(int commentNo) {
		return (CommentDto)SqlMapper.selectOne("comments.getCommentBycommentNo", commentNo);
	}
	
	/**
	 * 게시글번호로 해당게시글의 댓글 갯수를 구하는 메소드
	 * @param commentPostNo
	 * @return
	 */
	public int getCommentsCount(int commentPostNo) {
		return (Integer)SqlMapper.selectOne("comments.getCommentsCount", commentPostNo);
	}
	
	public int getCommentsCountByEmpNo(int commentEmpNo) {
		return (Integer)SqlMapper.selectOne("comments.getCommentsCountByEmpNo", commentEmpNo);
	}
	
	public void updateComment(int commentNo) {
		SqlMapper.update("comments.updateComment", commentNo);
	}
	
	public void updateCommentDeleted (int commentNo) {
		SqlMapper.update("comments.updateCommentDeleted", commentNo);
	}
}
