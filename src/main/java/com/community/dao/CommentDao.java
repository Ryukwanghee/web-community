package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.dto.CommentDto;
import com.community.util.SqlMapper;
import com.community.vo.Comment;

public class CommentDao {
	
	private static CommentDao instance = new CommentDao();
	private CommentDao() {}
	public static CommentDao getInstance() {
		return instance;
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
	
	@SuppressWarnings("unchecked")
	public List<Comment> getCommentByQuestionNo(int questionNo) {
		return (List<Comment>) SqlMapper.selectList("comments.getCommentByQuestionNo" , questionNo);
	}
	
	public void deleteComment(Comment comment) {
		SqlMapper.update("comments.deleteComment", comment);
	}
	
	public int getCommentCountByEmpNo(int empNo) {
		return (Integer) SqlMapper.selectOne("comments.getCommentCountByEmpNo", empNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Comment> getComments(Map<String, Object> param) {
		return (List<Comment>) SqlMapper.selectList("comments.getComments", param);
	}
	

}
