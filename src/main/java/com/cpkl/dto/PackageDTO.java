package com.cpkl.dto;



import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import oracle.sql.TIMESTAMP;

public class PackageDTO {
	private int num; //패키지 글 번호
	private String title; //패키지 글 제목
	private int pay; //가격
	private String theme; //여행테마
	private int term; //여행기간
	private String start_point; //출발지 ex) 인천=>괌
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm",timezone="GMT+9")
	private TIMESTAMP start_date;
	//private Date start_date; //여행 출발날짜 ex)2020년 9월 23일 22:05
	private String start_plane; //출발항공편[에어부산 BX797편]
	private String end_point; //도착지 ex) 괌=>인천
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm",timezone="GMT+9")
	private TIMESTAMP end_date;
	//yyyy-MM-dd HH:mm
	//private Date end_date; //도착날짜 ex)2020년 9월 26일 06:35
	private String end_plane; //도착항공편[에어부산 BX798편]
	private String hotel; //호텔 : 1인실(+100000원) / 2인실
	private String city; //부산-타이페이(3일)-부산
	private int count;//현재예약한인원 10명
	private int max; //최대 예약 가능한 인원
	private int cut_line; //패키지 최소 인원
	private String content; // 상세내용
	
	
	
	
	
//	public Date getStart_date() {
//		return start_date;
//	}
//	public void setStart_date(Date start_date) {
//		this.start_date = start_date;
//	}
//	public Date getEnd_date() {
//		return end_date;
//	}
//	public void setEnd_date(Date end_date) {
//		this.end_date = end_date;
//	}
	
	
	public TIMESTAMP getStart_date() {
		return start_date;
	}
	public void setStart_date(TIMESTAMP start_date) {
		this.start_date = start_date;
	}
	public TIMESTAMP getEnd_date() {
		return end_date;
	}
	public void setEnd_date(TIMESTAMP end_date) {
		this.end_date = end_date;
	}
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	public String getStart_point() {
		return start_point;
	}
	public void setStart_point(String start_point) {
		this.start_point = start_point;
	}

	
	
	public String getStart_plane() {
		return start_plane;
	}
	public void setStart_plane(String start_plane) {
		this.start_plane = start_plane;
	}
	public String getEnd_point() {
		return end_point;
	}
	public void setEnd_point(String end_point) {
		this.end_point = end_point;
	}

	public String getEnd_plane() {
		return end_plane;
	}
	public void setEnd_plane(String end_plane) {
		this.end_plane = end_plane;
	}
	public String getHotel() {
		return hotel;
	}
	public void setHotel(String hotel) {
		this.hotel = hotel;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getCut_line() {
		return cut_line;
	}
	public void setCut_line(int cut_line) {
		this.cut_line = cut_line;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
