package com.cpkl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cpkl.service.ReviewBoardService;

@Controller
public class ReviewBoardController {

	@Autowired
	ReviewBoardService rbs;
	
	@RequestMapping("reviewboard/{num}")
	public String reviewboard(@PathVariable int num,Model model) {
		rbs.reviewBoard(num, model);
		return "reviewboard";
	}
	
}
