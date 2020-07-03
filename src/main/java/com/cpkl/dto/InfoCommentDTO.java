package com.cpkl.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class InfoCommentDTO {
	private String nick, content;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Timestamp savedate;
	private int numgroup, step, indent;
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
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
}
