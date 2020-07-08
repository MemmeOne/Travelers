package com.cpkl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cpkl.dao.FreeDAO;
import com.cpkl.dto.FreeCommentDTO;
import com.cpkl.dto.FreeDTO;

@Service
public class FreeService {
	@Autowired
	private FreeDAO dao;
	public void free_board_list(Model model,int page) {
		model.addAttribute("lists",dao.freeboard(page));
		model.addAttribute("totPage",dao.totPage());
	}
	public void search(Model model, String tag, String word, int page) {
		model.addAttribute("lists", dao.search(tag, word, page));
		model.addAttribute("totPage",dao.totPageSearch(tag, word));
		model.addAttribute("tag",tag);
		model.addAttribute("word",word);
	}
	public void free_write_list(int num, Model model) {
		model.addAttribute("lists",dao.free_board_list(num));
	}
	public void savedata(FreeDTO dto) {
		dao.savedata(dto);
	}
	public void free_content_view(Model model,int num) {
		dao.uphit(num);
	   model.addAttribute("lists",dao.free_content_view(num));
	}
	public void free_board_delete(Model model,int num) {
	   dao.free_board_delete(num);
	}
	public void free_modify_view(Model model,int num) {
		model.addAttribute("lists",dao.free_modify_view(num));
	}
	public void updatedata(FreeDTO dto) {
		dao.updatedata(dto);
		System.out.println(dto);
	}
	public List<FreeCommentDTO> comment_save(FreeCommentDTO dto) {
		dao.comment_save(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	public List<FreeCommentDTO> comment_modify(FreeCommentDTO dto) {
		dao.comment_modify(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	public List<FreeCommentDTO> comment_delete(FreeCommentDTO dto) {
		dao.comment_delete(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	public List<FreeCommentDTO> comment_reply_save(FreeCommentDTO dto) {
		dao.comment_reply_save(dto);
		return dao.comment_list(dto.getNumgroup());
	}
}
