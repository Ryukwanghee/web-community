package com.community.vo;

public class Position {
	
	private int no;     		// 직위번호
	private String name;		// 직원명
	private int seq;	        // 직위출력순서
	
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
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	@Override
	public String toString() {
		return "Positions [no=" + no + ", name=" + name + ", seq=" + seq + "]";
	}
	
	
}
