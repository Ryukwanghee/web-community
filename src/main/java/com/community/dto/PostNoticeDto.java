package com.community.dto;

import java.util.Date;

public class PostNoticeDto {
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
	private String title;			// post title
	private String sendEmpName;
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSendEmpName() {
		return sendEmpName;
	}
	public void setSendEmpName(String sendEmpName) {
		this.sendEmpName = sendEmpName;
	}
	
	
}
