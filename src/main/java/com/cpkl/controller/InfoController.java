package com.cpkl.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cpkl.dto.InfoCommentDTO;
import com.cpkl.dto.InfoDTO;
import com.cpkl.service.InfoService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/* 정보 게시판 컨트롤러  */
@Controller
public class InfoController {
	@Autowired
	private InfoService service;
	
	/* 게시판 기본 기능 */
	// 정보 게시판 전체 글 목록 가져오기 기능
	@RequestMapping("info_list")
	public String info_list(Model model, @RequestParam int page) {
		service.listAll(model,page);
		return "sharing_info/info_list";
	}
	// 정보 게시판 글 검색 목록 가져오기 기능
	@RequestMapping("info_search")
	public String info_search(Model model, @RequestParam String tag,
			@RequestParam String word, @RequestParam int page) {
		service.search(model, tag, word, page);
		return "sharing_info/info_search";
	}
	// 정보 게시판 글 작성 페이지
	@RequestMapping("info_write")
	public String info_write() {
		return "sharing_info/info_write";
	}
	// 정보 게시판 글 저장 기능
	@RequestMapping("info_save")
	public String info_save(InfoDTO dto) {
		int result=service.info_save(dto);
		if(result==1) {
			return "redirect:info_list?page=1";
		}else {
			return "redirect:info_write";
		}
	}
	// 정보 게시판 글 상세보기 기능
	@RequestMapping("info_post")
	public String save(@RequestParam int num,Model model) {
		service.info_post(num,model);
		return "sharing_info/info_post";
	}
	// 정보 게시판 글 수정 페이지
	@RequestMapping("info_rewrite")
	public String info_rewrite(@RequestParam int num, Model model) {
		service.info_post(num,model);
		return "sharing_info/info_rewrite";
	}
	// 정보 게시판 글 수정 기능
	@RequestMapping("info_modify")
	public String info_modify(InfoDTO dto) {
		int result=service.info_modify(dto);
		if(result==1) {
			return "redirect:info_post?num="+dto.getNum();
		}else {
			return "redirect:info_rewrite?num="+dto.getNum();
		}
	}
	// 정보 게시판 글 삭제 기능
	@RequestMapping("info_delete")
	public String info_delete(@RequestParam int num) {
		int result=service.info_delete(num);
		if(result==1) {
			return "redirect:info_list?page=1";
		}else {
			return "redirect:info_post?num="+num;
		}
	}
	/* 댓글 기능 */
	// 댓글 저장 기능
	@RequestMapping(value="info_comment_save",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String info_comment_save(InfoCommentDTO dto) throws JsonProcessingException {
		List<InfoCommentDTO> list=service.comment_save(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	// 댓글 수정 기능
	@RequestMapping(value="info_comment_modify",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String info_comment_modify(InfoCommentDTO dto) throws JsonProcessingException {
		List<InfoCommentDTO> list=service.comment_modify(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	// 댓글 삭제 기능
	@RequestMapping(value="info_comment_delete",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String info_comment_delete(InfoCommentDTO dto) throws JsonProcessingException {
		List<InfoCommentDTO> list=service.comment_delete(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	// admin 댓글 삭제 기능
	@RequestMapping(value="comment_delete_admin",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String comment_delete_admin(InfoCommentDTO dto) throws JsonProcessingException {
		List<InfoCommentDTO> list=service.comment_delete_admin(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	// 대댓글 저장 기능
	@RequestMapping(value="info_comment_reply_save",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String info_comment_reply_save(InfoCommentDTO dto) throws JsonProcessingException {
		List<InfoCommentDTO> list=service.comment_reply_save(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
}
