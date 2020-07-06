package com.cpkl.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReviewBoardCommentsDTO {
	
	private int id;
	private int num;
	private int numgroup;
	private int step;
	private String cname;
	private String comments;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Timestamp savedate;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNum() {
		return num;
	}



	public void setNum(int num) {
		this.num = num;
	}

	public int getNumgroup() {
		return numgroup;
	}

	public void setNumgroup(int numgroup) {
		this.numgroup = numgroup;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
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
