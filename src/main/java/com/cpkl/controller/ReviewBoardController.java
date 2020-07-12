package com.cpkl.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cpkl.dto.CommentNumber;
import com.cpkl.dto.ReviewBoardCommentsDTO;
import com.cpkl.dto.ReviewBoardDTO;
import com.cpkl.dto.UserDTO;
import com.cpkl.service.ReviewBoardService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ReviewBoardController {

	@Autowired
	private ReviewBoardService rbs;
	@Autowired
	private HttpSession session;
		
	@RequestMapping("reviewboard")
	public String reviewBoard(HttpServletRequest request, Model model) {
		String page = request.getParameter("page");
		String searchtype = (String) request.getParameter("searchtype");
		String search = (String) request.getParameter("search");
		if(search == null) {
			rbs.reviewBoard(page, model);
		}else {
			Map<String,	Object> map = new HashMap<String, Object>();
			map.put("page", page);
			map.put("searchtype", searchtype);
			map.put("search", search);
			rbs.reviewBoard(map, model);
		}
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
	

	@RequestMapping(value="comment", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String comment(ReviewBoardCommentsDTO dto) {
		rbs.comment(dto);
		return null;
	}
	
	@RequestMapping(value="comments", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String comments(CommentNumber dto) throws JsonProcessingException {
		List<ReviewBoardCommentsDTO> list = rbs.comments(dto);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@RequestMapping(value="reply", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String reply(ReviewBoardCommentsDTO dto) {
		rbs.reply(dto);
		return null;
	}
	
	@RequestMapping(value="commentmodify", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String commentModify(ReviewBoardCommentsDTO dto) {
		rbs.commentModify(dto);
		return null;
	}
	
	@RequestMapping(value="commentdelete", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String commentDelete(ReviewBoardCommentsDTO dto) {
		rbs.commentDelete(dto);
		return null;
	}
	
	@RequestMapping(value="totalcomment", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String totalComment(@RequestParam int id) throws JsonProcessingException{
		CommentNumber cn = rbs.totalComment(id);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(cn);
		return json;
	}
}
