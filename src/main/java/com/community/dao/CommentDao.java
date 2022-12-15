package com.community.dao;

import java.util.List;



import com.community.dto.CommentDto;

import com.community.util.SqlMapper;
import com.community.vo.Comment;

public class CommentDao {


	public void insertComment(Comment comment) {
		SqlMapper.insert("comments.insertComment", comment);
	}
	
	@SuppressWarnings("unchecked")
	public List<Comment> getCommentsByPostNo(int postNo) {
		return (List<Comment>) SqlMapper.selectList("comments.getCommentsByPostNo", postNo);
	}

	public void addComment(Comment comment) {
		SqlMapper.insert("comments.addComment", comment);
	}
	
	@SuppressWarnings("unchecked")
	public List<CommentDto> getCommentsByNo(int postNo) {
		return (List<CommentDto>) SqlMapper.selectList("comments.getCommentsByNo", postNo);
	}
	
	public Comment getCommentByCommentNo(int commentNo) {
		return (Comment) SqlMapper.selectOne("comments.getCommentByCommentNo", commentNo);
	}
	
	public void deleteComment(Comment comment) {
		SqlMapper.update("comments.deleteComment", comment);
	}


}
