package com.cpkl.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MateDTO {
	// 글 정보 (제목, 내용, 번호, 조회수, 글 쓴 시간)
	private String title, content;
	private int num, hit;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd",timezone="GMT+9")
	private Timestamp savedate;

	// 글쓴이 닉, 성별, 나이
	String wnick;
	String wgender;
	int wage;

	// 여행 동행 조건
	private String mtravel_date, mthema, mroom, mgender, mexpenses,mage;
	private int  mcnt, price1, price2;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd",timezone="GMT+9")
	private Date mtravel_date_s;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd",timezone="GMT+9")
	private Date mtravel_date_e;
	//private Timestamp mtravel_date_e;
	
	// private int mage;
	// expenses 여행경비는어카지..?

	
	private String deadline;
 
	
	
	// 검색용
	private String word, tag;
	
	//private ArrayList<String>  mthema_arr,  mroom_arr,  mgender_arr, mage_arr;
	
	private int write_save_ok;
	
	public int getWrite_save_ok() {
		return write_save_ok;
	}
	public void setWrite_save_ok(int write_save_ok) {
		this.write_save_ok = write_save_ok;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getMexpenses() {
		return mexpenses;
	}
	public void setMexpenses(String mexpenses) {
		this.mexpenses = mexpenses;
	}
	public int getMcnt() {
		return mcnt;
	}
	public void setMcnt(int mcnt) {
		this.mcnt = mcnt;
	}
	public int getPrice1() {
		return price1;
	}
	public void setPrice1(int price1) {
		this.price1 = price1;
	}
	public int getPrice2() {
		return price2;
	}
	public void setPrice2(int price2) {
		this.price2 = price2;
	}

	//-----------------------
	public Date getMtravel_date_s() {
		return mtravel_date_s;
	}
	public void setMtravel_date_s(Date mtravel_date_s) {
		this.mtravel_date_s = mtravel_date_s;
	}
	public Date getMtravel_date_e() {
		return mtravel_date_e;
	}
	public void setMtravel_date_e(Date mtravel_date_e) {
		this.mtravel_date_e = mtravel_date_e;
	}
	//-----------------------
	
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Timestamp getSavedate() {
		return savedate;
	}
	public void setSavedate(Timestamp savedate) {
		this.savedate = savedate;
	}
	public String getWnick() {
		return wnick;
	}
	public void setWnick(String wnick) {
		this.wnick = wnick;
	}
	public String getWgender() {
		return wgender;
	}
	public void setWgender(String wgender) {
		this.wgender = wgender;
	}
	public int getWage() {
		return wage;
	}
	public void setWage(int wage) {
		this.wage = wage;
	}
	public String getMtravel_date() {
		return mtravel_date;
	}
	public void setMtravel_date(String mtravel_date) {
		this.mtravel_date = mtravel_date;
	}
	public String getMthema() {
		return mthema;
	}
	public void setMthema(String mthema) {
		this.mthema = mthema;
	}
	public String getMroom() {
		return mroom;
	}
	public void setMroom(String mroom) {
		this.mroom = mroom;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMage() {
		return mage;
	}
	public void setMage(String mage) {
		this.mage = mage;
	}
//	public Date getMtravel_date_e() {
//		return mtravel_date_e;
//	}
//	public void setMtravel_date_e(Date mtravel_date_e) {
//		this.mtravel_date_e = mtravel_date_e;
//	}
 


}
