package com.cpkl.dto;

public class CommentNumber {
	private int num;
	private int count;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "CommentNumber [num=" + num + ", count=" + count + "]";
	}
	
	
}
