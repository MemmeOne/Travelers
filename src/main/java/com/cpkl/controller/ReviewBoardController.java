package com.cpkl.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cpkl.dto.ReviewBoardCommentsDTO;
import com.cpkl.dto.ReviewBoardDTO;
import com.cpkl.dto.UserDTO;
import com.cpkl.service.ReviewBoardService;

@Controller
public class ReviewBoardController {

	@Autowired
	private ReviewBoardService rbs;
	@Autowired
	private HttpSession session;
		
	@RequestMapping("reviewboard")
	public String reviewBoard(@RequestParam int page,Model model) {
		rbs.reviewBoard(page, model);
		UserDTO user = new UserDTO();
		user.setId("aa"); user.setName("aa");
		session.setAttribute("user", user);
		Date cdate = new Date();
		session.setAttribute("cdate", cdate);
		return "reviewboard";
	}
	
	@RequestMapping("contentwrite")
	public String contentWrite() {
		return "contentwrite";
	}
	
	@RequestMapping("contentreg")
	public String contentWrite(ReviewBoardDTO dto) {
		rbs.contentReg(dto);
		return "redirect:reviewboard?page=1";
	}
	
	@RequestMapping("contentview")
	public String contentView(@RequestParam int id, Model model) {
		rbs.contentView(id, model);
		return "contentview";
	}
	
	@RequestMapping("delete")
	public String delete(@RequestParam int id) {
		rbs.delete(id);
		return "redirect:reviewboard?page=1";
	}
	
	@RequestMapping("contentmodify")
	public String contentModify(@RequestParam int id, Model model) {
		rbs.contentView(id, model);
		return "contentmodify";
	}
	
	@RequestMapping("modify")
	public String modify(ReviewBoardDTO dto) {
		rbs.modify(dto);
		return "redirect:reviewboard?page=1";
	}
	

	@RequestMapping("comment")
	public String comment(ReviewBoardCommentsDTO dto, RedirectAttributes ra) {
		rbs.comment(dto);
		ra.addAttribute("id", dto.getId());
		return "redirect:contentview";
	}
}
