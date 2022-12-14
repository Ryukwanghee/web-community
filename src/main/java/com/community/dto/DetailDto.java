package com.community.dto;

import java.util.Date;
	
		//deptno랑 deptname도 가져와야됨.
public class DetailDto {
	int postNo;
	int postBoardNo;
	String postTitle;
	int postWriterNo;
	String empName;
	int positionNo;
	String positionName;
	String postContent;
	String postImportant;
	int postReadCount;
	int postSuggestionCount;
	int postCommentCount;
	String postDeleted;
	Date postCreatedDate;
	Date postDeletedDate;
	int empDeptNo;
	String deptName;
	
	public int getPostDeptNo() {
		return empDeptNo;
	}
	public void setPostDeptNo(int empDeptNo) {
		this.empDeptNo = empDeptNo;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public int getPositionNo() {
		return positionNo;
	}
	public void setPositionNo(int positionNo) {
		this.positionNo = positionNo;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getPostBoardNo() {
		return postBoardNo;
	}
	public void setPostBoardNo(int postBoardNo) {
		this.postBoardNo = postBoardNo;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public int getPostWriterNo() {
		return postWriterNo;
	}
	public void setPostWriterNo(int postWriterNo) {
		this.postWriterNo = postWriterNo;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPostImportant() {
		return postImportant;
	}
	public void setPostImportant(String postImportant) {
		this.postImportant = postImportant;
	}
	public int getPostReadCount() {
		return postReadCount;
	}
	public void setPostReadCount(int postReadCount) {
		this.postReadCount = postReadCount;
	}
	public int getPostSuggestionCount() {
		return postSuggestionCount;
	}
	public void setPostSuggestionCount(int postSuggestionCount) {
		this.postSuggestionCount = postSuggestionCount;
	}
	public int getPostCommentCount() {
		return postCommentCount;
	}
	public void setPostCommentCount(int postCommentCount) {
		this.postCommentCount = postCommentCount;
	}
	public String getPostDeleted() {
		return postDeleted;
	}
	public void setPostDeleted(String postDeleted) {
		this.postDeleted = postDeleted;
	}
	public Date getPostCreatedDate() {
		return postCreatedDate;
	}
	public void setPostCreatedDate(Date postCreatedDate) {
		this.postCreatedDate = postCreatedDate;
	}
	public Date getPostDeletedDate() {
		return postDeletedDate;
	}
	public void setPostDeletedDate(Date postDeletedDate) {
		this.postDeletedDate = postDeletedDate;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	
	
}
