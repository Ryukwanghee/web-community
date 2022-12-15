package com.community.vo;

import java.util.Date;


public class Notice {
	

	private int postNo;				// 게시글번호
	private int boardNo;			// 게시판번호
	private String title;			// 게시글제목
	private int writerNo;			// 작성자번호
	private String content;			// 게시글내용
	private String important;		// 중요게시글 여부
	private int readCount;			// 조회수
	private int suggestionCount;	// 추천수
	private int commentCount;		// 댓글갯수
	private String deleted;			// 게시글삭제 여부
	private Date createdDate;		// 등록일
	private Date updatedDate;		// 수정일
	private Date deletedDate;		// 삭제일
	private int originalNo;			// 원글번호

	
	
	
	public Notice() {}




	public int getPostNo() {
		return postNo;
	}




	public void setPostNo(int postNo) {
		this.postNo = postNo;
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




	public int getSuggestionCount() {
		return suggestionCount;
	}




	public void setSuggestionCount(int suggestionCount) {
		this.suggestionCount = suggestionCount;
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




	public int getOriginalNo() {
		return originalNo;
	}




	public void setOriginalNo(int originalNo) {
		this.originalNo = originalNo;
	}




	@Override
	public String toString() {
		return "Notice [postNo=" + postNo + ", boardNo=" + boardNo + ", title=" + title + ", writerNo=" + writerNo
				+ ", content=" + content + ", important=" + important + ", readCount=" + readCount
				+ ", suggestionCount=" + suggestionCount + ", commentCount=" + commentCount + ", deleted=" + deleted
				+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", deletedDate=" + deletedDate
				+ ", originalNo=" + originalNo + "]";
	}









	


	
	
	


	
	
	



public class Notice {
	
	private int no; 				// 알림 번호
	private int postNo;				// 게시글 번호
	private int sendEmpNo;			// 송신자 직원번호
	private int receiveEmpNo;		// 수신자 직원번호
	private String content;			// 알림 내용
	private String readingStatus;	// 알림 열람 여부
	private String deleted;			// 알림 삭제 여부
	private Date createdDate;		// 등록일
	private Date updatedDate;		// 수정일
	private Date deletedDate;		// 삭제일
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getSendEmpNo() {
		return sendEmpNo;
	}
	public void setSendEmpNo(int sendEmpNo) {
		this.sendEmpNo = sendEmpNo;
	}
	public int getReceiveEmpNo() {
		return receiveEmpNo;
	}
	public void setReceiveEmpNo(int receiveEmpNo) {
		this.receiveEmpNo = receiveEmpNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReadingStatus() {
		return readingStatus;
	}
	public void setReadingStatus(String readingStatus) {
		this.readingStatus = readingStatus;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
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
}
