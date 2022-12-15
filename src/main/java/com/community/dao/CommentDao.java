package com.community.dao;

import java.util.List;

import com.community.util.SqlMapper;
import com.community.vo.Comment;

public class CommentDao {

	public void insertComment(Comment comment) {
		SqlMapper.insert("comments.insertComment", comment);
	}
	
	@SuppressWarnings("unchecked")
	public List<Comment> getCommentByQuestionNo(int questionNo) {
		return (List<Comment>) SqlMapper.selectList("comments.getCommentByQuestionNo" , questionNo);
	}
	
	public void deleteComment(int commentNo) {
		SqlMapper.delete("comments.deleteComment", commentNo);
	}
}
