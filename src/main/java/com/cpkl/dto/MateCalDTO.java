package com.cpkl.dto;

import java.sql.Date;

public class MateCalDTO {
	private int calid;
	private String title,
	description,
	username,
	type_cate,
	backgroundColor,
	textColor;
	private boolean allDay;
	private Date start_date,end_date;
	public int getCalid() {
		return calid;
	}
	public void setCalid(int calid) {
		this.calid = calid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getType_cate() {
		return type_cate;
	}
	public void setType_cate(String type_cate) {
		this.type_cate = type_cate;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public boolean isAllDay() {
		return allDay;
	}
	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	
	
}
