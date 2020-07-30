package com.cpkl.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReviewBoardCommentsDTO {
	
	private int num;
	private int cnum;
	private int numgroup;
	private int indent;
	private String cnick;
	private String comments;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone="GMT+9")
	private Timestamp savedate;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public int getNumgroup() {
		return numgroup;
	}
	public void setNumgroup(int numgroup) {
		this.numgroup = numgroup;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public String getCnick() {
		return cnick;
	}
	public void setCnick(String cnick) {
		this.cnick = cnick;
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
	
	
	
	
}
