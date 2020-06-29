package com.cpkl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cpkl.dao.ReviewBoardDAO;
import com.cpkl.dto.ReviewBoardCommentsDTO;
import com.cpkl.dto.ReviewBoardDTO;

@Service
public class ReviewBoardService {

	@Autowired
	ReviewBoardDAO dao;
	
	public void reviewBoard(int num, Model model) {
		model.addAttribute("list", dao.reviewBoard(num));
		int totalpage = (dao.totalContent()/10);
		if(dao.totalContent()%10 != 0) {
			totalpage = (dao.totalContent()/10)+1;
		}
		model.addAttribute("totalpage", totalpage);
	}
	
	public void contentReg(ReviewBoardDTO dto) {
		dao.contentReg(dto);
	}
	
	public void contentView(int id,Model model) {
		dao.upHit(id);
		model.addAttribute("content", dao.contentView(id));
		model.addAttribute("comments", dao.comments(id));

	}
	
	public void delete(int id) {
		dao.delete(id);
	}
	
	public void modify(ReviewBoardDTO dto) {
		dao.modify(dto);
	}
	
	public void comments(int id, Model model) {
	}
	
	public void comment(ReviewBoardCommentsDTO dto) {
		dao.comment(dto);
	}
}
