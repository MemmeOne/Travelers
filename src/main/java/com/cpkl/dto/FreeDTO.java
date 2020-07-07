package com.cpkl.dto;

import java.sql.Timestamp;

public class FreeDTO {
	private int num;
	private String nick, title, content;
	private Timestamp savedate;
	private int hit, numgroup, step, indent;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
	@Override
	public String toString() {
		return "FreeDTO [num=" + num + ", nick=" + nick + ", title=" + title + ", content=" + content + ", savedate="
				+ savedate + ", hit=" + hit + ", numgroup=" + numgroup + ", step=" + step + ", indent=" + indent + "]";
	}
}
