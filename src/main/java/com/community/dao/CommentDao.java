package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.vo.Comment;
import com.community.dto.CommentDto;
import com.community.util.SqlMapper;

public class CommentDao {
	
	private static CommentDao instance = new CommentDao();
	private CommentDao() {}
	public static CommentDao getInstance() {
		return instance;
	}
	
	public void addComment(Comment comment) {
		SqlMapper.insert("comments.addComment", comment);
	}
	
	
	public void insertComment(Comment comment) {
		SqlMapper.insert("comments.insertComment", comment);
	}
	
	@SuppressWarnings("unchecked")
	public List<Comment> getCommentsByPostNo(int postNo) {
		return (List<Comment>) SqlMapper.selectList("comments.getCommentsByPostNo", postNo);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<CommentDto> getCommentsByNo(int postNo) {
		return (List<CommentDto>) SqlMapper.selectList("comments.getCommentsByNo", postNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Comment> getCommentByQuestionNo(int questionNo) {
		return (List<Comment>) SqlMapper.selectList("comments.getCommentByQuestionNo" , questionNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Comment> getComments(int postNo){
		return (List<Comment>)SqlMapper.selectList("comments.getComments", postNo);
	}
	
	public Comment getCommentBycommentNo(int commentNo) {
		return (Comment)SqlMapper.selectOne("comments.getCommentBycommentNo", commentNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Comment> getmyComments(Map<String, Object> param){
		return (List<Comment>)SqlMapper.selectList("comments.getmyComments", param);
	}
	
	public void deleteComment(Comment comment) {
		SqlMapper.update("comments.deleteComment", comment);
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
	
	public void updateComment(Comment comment) {
		SqlMapper.update("comments.updateComment", comment);
	}
	
}
