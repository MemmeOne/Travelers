package com.cpkl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cpkl.dto.FreeCommentDTO;
import com.cpkl.dto.FreeDTO;
import com.cpkl.service.FreeService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class FreeController {
	@Autowired
	private FreeService service;
	@RequestMapping("free_board_list")
	public String free_board_list(Model model,@RequestParam int page) {
		System.out.println(page);
		service.free_board_list(model, page);
		return "free_board/free_board_list";
	}
	@RequestMapping("free_search")
	public String free_search(Model model,@RequestParam String tag,
			@RequestParam String word, @RequestParam int page) {
		service.search(model, tag, word, page);
		return "free_board/free_search";
	}
	@RequestMapping("free_write_list")
	public String free_write_list(Model model) {
		return "free_board/free_write_list";
	}
	@RequestMapping("savedata")
	public String savedata(FreeDTO dto) {
		System.out.println("num : "+dto.getNum());
		System.out.println("nick : "+dto.getNick());
		System.out.println("title : "+dto.getTitle());
		System.out.println("content : "+dto.getContent());
		System.out.println("savedate : "+dto.getSavedate());
		System.out.println("hit : "+dto.getHit());
		System.out.println("step : "+dto.getStep());
		System.out.println("indent : "+dto.getIndent());
		service.savedata(dto);
		return "redirect:free_board_list?page=1";
	}
	@RequestMapping("free_content_view")
	public String free_content_view(Model model,@RequestParam int num) {
	    service.free_content_view(model,num);
		return "free_board/free_content_view";
	}
	@RequestMapping("free_modify_view")
	public String free_modify_view(Model model,@RequestParam int num) {
		service.free_modify_view(model,num);
		return "free_board/free_modify_view";
	}
	@RequestMapping("free_board_delete")
	public String free_board_delete(Model model,@RequestParam int num) {
		service.free_board_delete(model,num);
		return "redirect:free_board_list?page=1";
	}
	@RequestMapping("updatedata")
	public String updatedata(FreeDTO dto) {
		System.out.println(dto.toString());
		try {
		service.updatedata(dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:free_board_list?page=1";
	}
	//댓글
	@RequestMapping(value="free_comment_save",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String free_comment_save(FreeCommentDTO dto) throws JsonProcessingException {
		List<FreeCommentDTO> list=service.comment_save(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	@RequestMapping(value="free_comment_modify",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String free_comment_modify(FreeCommentDTO dto) throws JsonProcessingException {
		List<FreeCommentDTO> list=service.comment_modify(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	@RequestMapping(value="free_comment_delete",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String free_comment_delete(FreeCommentDTO dto) throws JsonProcessingException {
		List<FreeCommentDTO> list=service.comment_delete(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	@RequestMapping(value="free_comment_reply_save",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String free_comment_reply_save(FreeCommentDTO dto) throws JsonProcessingException {
		List<FreeCommentDTO> list=service.comment_reply_save(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
}
