package com.cpkl.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.cpkl.dao.ReviewBoardDAO;
import com.cpkl.dto.ReviewBoardCommentsDTO;
import com.cpkl.dto.ReviewBoardDTO;

@Service
public class ReviewBoardService {

	@Autowired
	ReviewBoardDAO dao;
	
	public void reviewBoard(String page, Model model) {
		model.addAttribute("list", dao.reviewBoard(page));
		model.addAttribute("commentcount", dao.commentCount());
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
	
	public List<ReviewBoardCommentsDTO> comments(int id) {
		return dao.comments(id);
	}
	
	public void comment(ReviewBoardCommentsDTO dto) {
		dao.comment(dto);
	}
	
	public void reviewBoard(Map<String,	Object> map, Model model) {
		model.addAttribute("list", dao.search(map));
		model.addAttribute("commentcount", dao.commentCount());
		int totalpage = (dao.totalSearch(map)/10);
		if(dao.totalContent()%10 != 0) {
			totalpage = (dao.totalSearch(map)/10)+1;
		}
		model.addAttribute("totalpage", totalpage);
	}
	
}
