package com.cpkl.dto;

public class FavoriteDTO {

	private int boardnum;
	private int num;
	private String userid;
	
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
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
		return "FavoriteDTO [boardnum=" + boardnum + ", num=" + num + ", userid=" + userid + "]";
	}
	
}
