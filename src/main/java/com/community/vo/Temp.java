package com.community.vo;

import java.util.Date;

public class Temp {

	private int tempNo;
	private String title;
	private String content;
	private String important;
	private Date createdDate;
	private int boardNo;
	private int empNo;
	private int postReadCount;
	private int postReviewCount;
	private int recommendCount;
	private String fileName;
	
	public Temp() {}
	public Temp(int tempNo, int empNo) {
		this.tempNo = tempNo;
		this.empNo = empNo;
	}

	public int getTempNo() {
		return tempNo;
	}

	public void setTempNo(int tempNo) {
		this.tempNo = tempNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImportant() {
		return important;
	}

	public void setImportant(String important) {
		this.important = important;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
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
	public int getPostReadCount() {
		return postReadCount;
	}
	public void setPostReadCount(int postReadCount) {
		this.postReadCount = postReadCount;
	}
	public int getPostReviewCount() {
		return postReviewCount;
	}
	public void setPostReviewCount(int postReviewCount) {
		this.postReviewCount = postReviewCount;
	}

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getRecommendCount() {
		return recommendCount;
	}
	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}
	
	
	
}
