package com.cpkl.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TravelDiaryDTO {
	String nick;
	String nation;
	String city;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",timezone="GMT+9")
	Date startdate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",timezone="GMT+9")
	Date enddate;
	String memo;
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
}
