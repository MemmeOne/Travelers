package com.cpkl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.cpkl.dao.InfoDAO;
import com.cpkl.dto.InfoCommentDTO;
import com.cpkl.dto.InfoDTO;

@Service
public class InfoService {
	@Autowired
	@Qualifier("infoDAO")
	private InfoDAO dao;
	public void listAll(Model model, int page) {
		model.addAttribute("info_list",dao.listAll(page));
		model.addAttribute("totPage",dao.totPage());
	}
	public void search(Model model, String tag, String word, int page) {
		model.addAttribute("info_list",dao.search(tag, word, page));
		model.addAttribute("totPage",dao.totPageSearch(tag, word));
		model.addAttribute("tag",tag);
		model.addAttribute("word",word);
	}
	public int info_save(InfoDTO dto) {
		return dao.info_save(dto);
	}
	public void info_post(int num,Model model) {
		dao.info_uphit(num);
		model.addAttribute("info_post",dao.info_post(num));
		model.addAttribute("comment_list",dao.comment_list(num));
	}
	public List<InfoCommentDTO> comment_save(InfoCommentDTO dto) {
		dao.comment_save(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	public List<InfoCommentDTO> comment_modify(InfoCommentDTO dto) {
		dao.comment_modify(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	public List<InfoCommentDTO> comment_delete(InfoCommentDTO dto) {
		dao.comment_delete(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	public int info_modify(InfoDTO dto) {
		return dao.info_modify(dto);
	}
	public int info_delete(int num) {
		return dao.info_delete(num);
	}
}
