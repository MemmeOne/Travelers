package com.cpkl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cpkl.dao.MyPostDAO;

@Service
public class MyPostService {
	@Autowired
	private MyPostDAO dao;
	public void mate_post(Model model,int page,String nick) {
		model.addAttribute("mate_list",dao.mate_post(page, nick));
		System.out.println("자유게시판 글 수  : "+dao.mate_post(page, nick));
	}
	public void free_post(Model model,int page,String nick) {
		model.addAttribute("free_list",dao.free_post(page, nick));
		System.out.println("자유게시판 글 수  : "+dao.free_post(page, nick));
	}
	public void info_post(Model model,int page,String nick) {
		model.addAttribute("info_list",dao.info_post(page, nick));
		System.out.println("정보게시판 글 수 : "+dao.info_post(page, nick));
	}
	public void review_post(Model model,int page,String nick) {
		model.addAttribute("review_list",dao.review_post(page, nick));
		System.out.println("리뷰게시판 글 수 : "+dao.review_post(page, nick));
	}

}
