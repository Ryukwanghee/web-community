package com.community.dto;

import java.util.Date;

public class TempDto {
	int tempNo;
	String postTitle;
	String postContent;
	String postImportant;
	Date postCreatedDate;
	int boardNo;
	int empNo;
	
	public int getTempNo() {
		return tempNo;
	}
	public void setTempNo(int tempNo) {
		this.tempNo = tempNo;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
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
	public Date getPostCreatedDate() {
		return postCreatedDate;
	}
	public void setPostCreatedDate(Date postCreatedDate) {
		this.postCreatedDate = postCreatedDate;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	
	
}
