package com.community.vo;

import java.util.Date;

public class Board {
	int no;
	String name;
	String description;
	int seq;
	String readOption;
	String writeOption;
	String boardDeleted;
	Date createdDate;
	Date updatedDate;
	Date deletedDate;
	int parentBoardNo;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getReadOption() {
		return readOption;
	}
	public void setReadOption(String readOption) {
		this.readOption = readOption;
	}
	public String getWriteOption() {
		return writeOption;
	}
	public void setWriteOption(String writeOption) {
		this.writeOption = writeOption;
	}
	public String getBoardDeleted() {
		return boardDeleted;
	}
	public void setBoardDeleted(String boardDeleted) {
		this.boardDeleted = boardDeleted;
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
	public int getParentBoardNo() {
		return parentBoardNo;
	}
	public void setParentBoardNo(int parentBoardNo) {
		this.parentBoardNo = parentBoardNo;
	}
	
	
}
