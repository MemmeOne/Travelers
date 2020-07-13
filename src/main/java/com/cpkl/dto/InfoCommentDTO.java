package com.cpkl.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class InfoCommentDTO {
	private int cnum, numgroup, commentgroup, step;
	private String nick, content;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm",timezone="GMT+9")
	private Timestamp savedate;
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
	public int getCommentgroup() {
		return commentgroup;
	}
	public void setCommentgroup(int commentgroup) {
		this.commentgroup = commentgroup;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getSavedate() {
		return savedate;
	}
	public void setSavedate(Timestamp savedate) {
		this.savedate = savedate;
	}
}
