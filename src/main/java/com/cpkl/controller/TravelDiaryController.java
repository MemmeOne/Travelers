package com.cpkl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cpkl.dto.TravelDiaryDTO;
import com.cpkl.service.TravelDiaryService;

@Controller
public class TravelDiaryController {
	
	@Autowired
	TravelDiaryService tds;
	
	@RequestMapping("form")
	public String form(Model model) {
		tds.getNation(model);
		return "travel_diary/form";
	}
	
	@RequestMapping("travelDiaryReg")
	public String travelDiaryReg(TravelDiaryDTO dto) {
		tds.travelDiaryReg(dto);
		return "forward:travelDiary";
	}
	
	@RequestMapping("travelDiary")
	public String travelDiary(@RequestParam String nick, Model model) {
		tds.travelDiaryList(nick, model);
		return "travel_diary/diary";
	}
	
	
}
