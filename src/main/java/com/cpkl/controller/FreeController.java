package com.cpkl.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cpkl.dto.CommentNumber;
import com.cpkl.dto.FavoriteDTO;
import com.cpkl.dto.FreeCommentDTO;
import com.cpkl.dto.FreeDTO;
import com.cpkl.dto.ReportPostDTO;
import com.cpkl.service.FreeService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
/* 자유 게시판 컨트롤러 */
@Controller
public class FreeController {
	@Autowired
	private FreeService service;
	@Autowired
	private HttpSession session;
	/* 게시판 기본 기능 */
	// 자유 게시판 전체 글 목록 가져오기 기능
	@RequestMapping("free_board_list")
	public String free_board_list(Model model,@RequestParam int page) {
		System.out.println(page);
		service.free_board_list(model, page);
		service.favoriteList(model);
		Date cdate = new Date();
		session.setAttribute("cdate", cdate);
		System.out.println(model);
		return "free_board/free_board_list";
	}
	// 자유 게시판 글 검색 목록 가져오기 기능
	@RequestMapping("free_search")
	public String free_search(Model model,@RequestParam String tag,
			@RequestParam String word, @RequestParam int page) {
		service.search(model, tag, word, page);
		service.favoriteList(model);
		return "free_board/free_search";
	}
	// 자유 게시판 글 작성 페이지
	@RequestMapping("free_write_list")
	public String free_write_list(Model model) {
		return "free_board/free_write_list";
	}
	// 자유 게시판 글 저장 기능
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
	// 자유 게시판 글 상세보기 기능
	@RequestMapping("free_content_view")
	public String free_content_view(Model model,@RequestParam int num) {
	    service.free_content_view(model,num);
		return "free_board/free_content_view";
	}
	// 자유 게시판 글 수정 페이지
	@RequestMapping("free_modify_view")
	public String free_modify_view(Model model,@RequestParam int num) {
		service.free_modify_view(model,num);
		return "free_board/free_modify_view";
	}
	// 자유 게시판 글 수정 기능
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
	// 자유 게시판 글 삭제 기능
	@RequestMapping("free_board_delete")
	public String free_board_delete(Model model,@RequestParam int num) {
		service.free_board_delete(model,num);
		return "redirect:free_board_list?page=1";
	}
	/* 댓글 기능 */
	// 댓글 저장 기능
	@RequestMapping(value="free_comment_save",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String free_comment_save(FreeCommentDTO dto) throws JsonProcessingException {
		List<FreeCommentDTO> list=service.comment_save(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	// 댓글 수정 기능
	@RequestMapping(value="free_comment_modify",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String free_comment_modify(FreeCommentDTO dto) throws JsonProcessingException {
		List<FreeCommentDTO> list=service.comment_modify(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	// 댓글 삭제 기능
	@RequestMapping(value="free_comment_delete",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String free_comment_delete(FreeCommentDTO dto) throws JsonProcessingException {
		List<FreeCommentDTO> list=service.comment_delete(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	// admin 댓글 삭제 기능
	@RequestMapping(value="free_comment_delete_admin",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String comment_delete_admin(FreeCommentDTO dto) throws JsonProcessingException {
		List<FreeCommentDTO> list=service.comment_delete_admin(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	// 대댓글 저장 기능
	@RequestMapping(value="free_comment_reply_save",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String free_comment_reply_save(FreeCommentDTO dto) throws JsonProcessingException {
		List<FreeCommentDTO> list=service.comment_reply_save(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	//추천
	@RequestMapping(value="free_favoriteUp", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String favoriteUp(FavoriteDTO dto) {
		service.favoriteUp(dto);
		return null;
	}
	//추천 취소
	@RequestMapping(value="free_favoriteDown", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String favoriteDown(FavoriteDTO dto) {
		service.favoriteDown(dto);
		return null;
	}
	//추천 수
	@RequestMapping(value="free_favorite", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String favorite(FavoriteDTO dto) throws JsonProcessingException {
		CommentNumber cn = service.favorite(dto);
		System.out.println("DTO:"+dto);
		System.out.println(service.favorite(dto));
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(cn);
		return json;
	}
}