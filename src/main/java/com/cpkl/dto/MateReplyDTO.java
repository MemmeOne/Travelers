package com.cpkl.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MateReplyDTO {
	int bnum, rnum;
	int rgroup, step;
	
	public int getRgroup() {
		return rgroup;
	}

	public void setRgroup(int rgroup) {
		this.rgroup = rgroup;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

//	public int getIndent() {
//		return indent;
//	}
//
//	public void setIndent(int indent) {
//		this.indent = indent;
//	}

	String nick, reply;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Timestamp savetime;

	public Timestamp getSavetime() {
		return savetime;
	}

	public void setSavetime(Timestamp savetime) {
		this.savetime = savetime;
	}

	 public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

}
