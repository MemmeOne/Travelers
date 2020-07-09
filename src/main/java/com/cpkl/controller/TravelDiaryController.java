package com.cpkl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TravelDiaryController {
	
	@RequestMapping("form")
	public String form(Model model) {
		
		return "travel_diary/form";
	}
	
}
