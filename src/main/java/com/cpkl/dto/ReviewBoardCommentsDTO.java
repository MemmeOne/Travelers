package com.cpkl.dto;

import java.sql.Timestamp;

public class ReviewBoardCommentsDTO {
	
	private int id;
	private String cname;
	private String comments;
	private Timestamp savedate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Timestamp getSavedate() {
		return savedate;
	}
	public void setSavedate(Timestamp savedate) {
		this.savedate = savedate;
	}
	
	@Override
	public String toString() {
		return "ReviewBoardCommentsDTO [id=" + id + ", cname=" + cname + ", comments=" + comments + ", savedate="
				+ savedate + "]";
	}
	
}
