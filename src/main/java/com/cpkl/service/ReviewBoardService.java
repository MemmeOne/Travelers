package com.cpkl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cpkl.dao.ReviewBoardDAO;

@Service
public class ReviewBoardService {

	@Autowired
	ReviewBoardDAO dao;
	
	public void reviewBoard(int num, Model model) {
		model.addAttribute("list", dao.reviewBoard(num));
	}
	
}
