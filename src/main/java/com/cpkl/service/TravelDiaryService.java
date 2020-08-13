package com.cpkl.service;

import java.util.List;

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
	
	public List<TravelDiaryDTO> travelDiaryList(String nick) {
		return dao.travelDiaryList(nick);
	}
	
	public void travelDiaryMod(int num, Model model) {
		model.addAttribute("nationlist", dao.getNation());
		model.addAttribute("diary", dao.travelDiaryMod(num));
	}
	
	public void travelDiaryModUpdate(TravelDiaryDTO dto) {
		dao.travelDiaryModUpdate(dto);
	}
	
	public void travelDiaryDel(int num) {
		dao.travelDiaryDel(num);
	}
	
	public void nationRank(Model model) {
		model.addAttribute("nationRank", dao.nationRank());
	}
	
}
