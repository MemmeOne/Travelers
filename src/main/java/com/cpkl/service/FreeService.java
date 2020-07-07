package com.cpkl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cpkl.dao.FreeDAO;
import com.cpkl.dto.FreeDTO;

@Service
//서비스가 jsp페이지와 연결?..
//addAttribute: jsp에 뒷메소드의 리턴값을 앞 lists에 넣겠다.
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
}
