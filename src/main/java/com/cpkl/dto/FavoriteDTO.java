package com.cpkl.dto;

public class FavoriteDTO {
	private int num;
	private String userid;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "FavoriteDTO [num=" + num + ", userid=" + userid + "]";
	}
}
