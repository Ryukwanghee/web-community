package com.community.dto;

import java.util.Date;

public class QuestionDetailDto {

	private int  no;
	private int boardNo;
	private String title;
	private int writerNo;
	private String empName;
	private int depNo;
	private String deptName;
	private int positionNo;
	private String positionName;
	private String content;
	private String important;
	private int readCount;
	private int commentCount;
	private String deleted;
	private int suggestionCount;
	private Date createdDate;
	private Date updatedDate;
	private Date deletedDate;
	private Integer originalNo;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getWriterNo() {
		return writerNo;
	}
	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public int getDepNo() {
		return depNo;
	}
	public void setDepNo(int depNo) {
		this.depNo = depNo;
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
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public int getSuggestionCount() {
		return suggestionCount;
	}
	public void setSuggestionCount(int suggestionCount) {
		this.suggestionCount = suggestionCount;
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
	public Date getDeletedDate() {
		return deletedDate;
	}
	public void setDeletedDate(Date deletedDate) {
		this.deletedDate = deletedDate;
	}
	public Integer getOriginalNo() {
		return originalNo;
	}
	public void setOriginalNo(Integer originalNo) {
		this.originalNo = originalNo;
	}
	
	@Override
	public String toString() {
		return "QuestionDetailDto [no=" + no + ", boardNo=" + boardNo + ", title=" + title + ", writerNo=" + writerNo
				+ ", empName=" + empName + ", depNo=" + depNo + ", deptName=" + deptName + ", positionNo=" + positionNo
				+ ", positionName=" + positionName + ", content=" + content + ", important=" + important
				+ ", readCount=" + readCount + ", commentCount=" + commentCount + ", deleted=" + deleted
				+ ", suggestionCount=" + suggestionCount + ", createdDate=" + createdDate + ", updatedDate="
				+ updatedDate + ", deletedDate=" + deletedDate + ", originalNo=" + originalNo + "]";
	}
	
	
	
	
	
	
}
