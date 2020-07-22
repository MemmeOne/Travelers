package com.cpkl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cpkl.dto.ReviewBoardCommentsDTO;
import com.cpkl.dto.TravelDiaryDTO;
import com.cpkl.service.TravelDiaryService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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
		return "travel_diary/close";
	}
	
	@RequestMapping("travelDiary")
	public String travelDiary() {
		return "travel_diary/diary";
	}
	
	@RequestMapping(value="travelDiaryList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String travelDiary(@RequestParam String nick) throws JsonProcessingException {
 		List<TravelDiaryDTO> list = tds.travelDiaryList(nick);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	
}
