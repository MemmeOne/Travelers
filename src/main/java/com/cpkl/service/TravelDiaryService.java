package com.cpkl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cpkl.dao.TravelDiaryDAO;
import com.cpkl.dto.TravelDiaryDTO;

@Service
public class TravelDiaryService {

	@Autowired
	TravelDiaryDAO dao;
	
	public void getNation(Model model) {
		model.addAttribute("nationlist", dao.getNation());
	}
	
	public void travelDiaryReg(TravelDiaryDTO dto) {
		dao.travelDiaryReg(dto);
	}
	
	public void travelDiaryList(String nick, Model model) {
		model.addAttribute("travelDiaryList", dao.travelDiaryList(nick));
	}
}
