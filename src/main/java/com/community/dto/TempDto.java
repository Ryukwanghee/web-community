package com.community.dto;

import java.util.Date;

public class TempDto {

	private int tempNo;	// 임시게시판번호
	private int boardNo;	// 게시판 번호
	private int empNo;	// 임시게시판 사원번호 로 작성자 이름 가져오게
	private String boardName;	//게시판 이름
	private String title;	//임시게시판 제목
	private String empName;	// 조인함수로 임시게시판의 empNo를 통해 Employee불러오기
	private Date createdDate;
	private Date updatedDate;
	private int DeptNo;	//employees
	private String DeptName;
	private String content;
	private int postReadCount;
	private int postReviewCount;
	private String important;
	private String fileName;
	private int recommendCount;	//temp의 recommendCount
	
	public TempDto() {}

	public int getTempNo() {
		return tempNo;
	}

	public void setTempNo(int tempNo) {
		this.tempNo = tempNo;
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

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}


	public int getDeptNo() {
		return DeptNo;
	}

	public void setDeptNo(int deptNo) {
		DeptNo = deptNo;
	}

	public String getDeptName() {
		return DeptName;
	}

	public void setDeptName(String deptName) {
		DeptName = deptName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getImportant() {
		return important;
	}

	public void setImportant(String important) {
		this.important = important;
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
