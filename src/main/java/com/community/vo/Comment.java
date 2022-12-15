package com.community.vo;

import java.util.Date;

public class Comment {
	
	private int no;
	private int empNo;
	private String content;
	private String deleted;
	private Date createdDate;
	private Date updatedDate;
	private Date deletedDate;
	private int postNo;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	
	@Override
	public String toString() {
		return "Comment [no=" + no + ", empNo=" + empNo + ", content=" + content + ", deleted=" + deleted
				+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", deletedDate=" + deletedDate
				+ ", postNo=" + postNo + "]";
	}
	
	
}
