package com.community.vo;

public class Department {
	
	private int no;
	private int name;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getName() {
		return name;
	}
	public void setName(int name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "Department [no=" + no + ", name=" + name + "]";
	}
	
	
}
