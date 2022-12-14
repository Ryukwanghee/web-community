package com.community.dto;

import java.util.Date;

public class PostNoticeDto {
	int noticeNo;
	int noticePostNo;
	int noticeSendEmpNo;
	int noticeReceiveEmpNo;
	String noticeContent;
	String noticeReadingStatus;
	String noticeDeleted;
	Date noticeCreatedDate;
	Date noticeUpdatedDate;
	Date noticeDeletedDate;
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public int getNoticePostNo() {
		return noticePostNo;
	}
	public void setNoticePostNo(int noticePostNo) {
		this.noticePostNo = noticePostNo;
	}
	public int getNoticeSendEmpNo() {
		return noticeSendEmpNo;
	}
	public void setNoticeSendEmpNo(int noticeSendEmpNo) {
		this.noticeSendEmpNo = noticeSendEmpNo;
	}
	public int getNoticeReceiveEmpNo() {
		return noticeReceiveEmpNo;
	}
	public void setNoticeReceiveEmpNo(int noticeReceiveEmpNo) {
		this.noticeReceiveEmpNo = noticeReceiveEmpNo;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeReadingStatus() {
		return noticeReadingStatus;
	}
	public void setNoticeReadingStatus(String noticeReadingStatus) {
		this.noticeReadingStatus = noticeReadingStatus;
	}
	public String getNoticeDeleted() {
		return noticeDeleted;
	}
	public void setNoticeDeleted(String noticeDeleted) {
		this.noticeDeleted = noticeDeleted;
	}
	public Date getNoticeCreatedDate() {
		return noticeCreatedDate;
	}
	public void setNoticeCreatedDate(Date noticeCreatedDate) {
		this.noticeCreatedDate = noticeCreatedDate;
	}
	public Date getNoticeUpdatedDate() {
		return noticeUpdatedDate;
	}
	public void setNoticeUpdatedDate(Date noticeUpdatedDate) {
		this.noticeUpdatedDate = noticeUpdatedDate;
	}
	public Date getNoticeDeletedDate() {
		return noticeDeletedDate;
	}
	public void setNoticeDeletedDate(Date noticeDeletedDate) {
		this.noticeDeletedDate = noticeDeletedDate;
	}
	
	
}
