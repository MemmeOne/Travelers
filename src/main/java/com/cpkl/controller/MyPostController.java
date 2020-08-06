package com.cpkl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cpkl.service.MyPostService;


@Controller
public class MyPostController {
	@Autowired
	private MyPostService service;
	@RequestMapping("myPost")
	public String myPost_mate(Model model,@RequestParam int page,@RequestParam String nick) {
		service.mate_post(model, page, nick);
		return "service_login/myPost";
	}
	@RequestMapping("myPost_info")
	public String myPost_info(Model model,@RequestParam int page,@RequestParam String nick) {
		service.info_post(model, page, nick);
		return "service_login/myPost_info";
	}
	@RequestMapping("myPost_review")
	public String myPost_review(Model model,@RequestParam int page,@RequestParam String nick) {
		service.review_post(model, page, nick);
		return "service_login/myPost_review";
	}
	@RequestMapping("myPost_free")
	public String myPost_free(Model model,@RequestParam int page,@RequestParam String nick) {
		service.free_post(model, page, nick);
		return "service_login/myPost_free";
	}
}
