package com.community.dto;

import java.util.Date;

public class CommentDto {
	int commentNo;
	int commentEmpNo;
	String commentContent;
	String commentDeleted;
	Date commentCreatedDate;
	Date commentUpdatedDate;
	Date commentDeletedDate;
	int commentPostNo;
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getCommentEmpNo() {
		return commentEmpNo;
	}
	public void setCommentEmpNo(int commentEmpNo) {
		this.commentEmpNo = commentEmpNo;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentDeleted() {
		return commentDeleted;
	}
	public void setCommentDeleted(String commentDeleted) {
		this.commentDeleted = commentDeleted;
	}
	public Date getCommentCreatedDate() {
		return commentCreatedDate;
	}
	public void setCommentCreatedDate(Date commentCreatedDate) {
		this.commentCreatedDate = commentCreatedDate;
	}
	public Date getCommentUpdatedDate() {
		return commentUpdatedDate;
	}
	public void setCommentUpdatedDate(Date commentUpdatedDate) {
		this.commentUpdatedDate = commentUpdatedDate;
	}
	public Date getCommentDeletedDate() {
		return commentDeletedDate;
	}
	public void setCommentDeletedDate(Date commentDeletedDate) {
		this.commentDeletedDate = commentDeletedDate;
	}
	public int getCommentPostNo() {
		return commentPostNo;
	}
	public void setCommentPostNo(int commentPostNo) {
		this.commentPostNo = commentPostNo;
	}
	
	
	
	
}
