package com.community.vo;


import java.util.Date;

public class Board { // 게시판 목록 정보

	private int no;
	private String name;
	private String Description;
	private int seq;
	private String readOption;
	private String writeOption;
	private String deleted;
	private Date createdDate;
	private Date updatedDate;
	private Date deletedDate;
	private Integer boardNo;	//상위게시판 번호
	
	public Board() {}

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
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
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

	public Integer getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}


	
}
