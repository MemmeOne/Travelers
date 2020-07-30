package com.cpkl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cpkl.dao.ReviewBoardDAO;
import com.cpkl.dto.CommentNumber;
import com.cpkl.dto.FavoriteDTO;
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
	
	public void contentView(int num,Model model) {
		dao.upHit(num);
		model.addAttribute("content", dao.contentView(num));
	}
	
	public void delete(int num) {
		dao.delete(num);
	}
	
	public void modify(ReviewBoardDTO dto) {
		dao.modify(dto);
	}
	
	public List<ReviewBoardCommentsDTO> comments(CommentNumber dto) {
		return dao.comments(dto);
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
	
	public void reply(ReviewBoardCommentsDTO dto) {
		dao.reply(dto);
	}
	
	public void commentModify(ReviewBoardCommentsDTO dto) {
		dao.commentModify(dto);
	}
	
	public void commentDelete(ReviewBoardCommentsDTO dto) {
		if(dto.getIndent() == 0) {
			dao.commentDelete(dto);
		}else {
			dao.commentIndentDelete(dto);
		}
	}
	
	public CommentNumber totalComment(int num) {
		return dao.totalComment(num);
	}
	
	public void favoriteUp(FavoriteDTO dto) {
		dao.favoriteUp(dto);
	}
	
	public void favoriteList(int boardnum, Model model) {
		model.addAttribute("favoriteList", dao.favoriteList(boardnum));
	}
	
	public CommentNumber favorite(FavoriteDTO dto) {
		return dao.favorite(dto);
	}
}
