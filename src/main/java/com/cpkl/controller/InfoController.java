package com.cpkl.controller;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cpkl.dto.CommentNumber;
import com.cpkl.dto.FavoriteDTO;
import com.cpkl.dto.InfoCommentDTO;
import com.cpkl.dto.InfoDTO;
import com.cpkl.dto.ReportPostDTO;
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
	public String save(@RequestParam int num,Model model, HttpServletRequest request, HttpServletResponse response) {
		service.info_post(num,model);
		Cookie[] cookies = request.getCookies();
		Cookie upHit = null;
		if(cookies != null && cookies.length > 0) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("info"+num)) {
					upHit = cookie;
				}
			}
		}
		if(upHit == null) {
			Cookie cookie = new Cookie("info"+num, "upHit");
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
			service.upHit(num);
		}
		service.info_post(num, model);
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
	@RequestMapping(value="info_getCommentList",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String info_getCommentList(InfoCommentDTO dto) throws JsonProcessingException {
		List<InfoCommentDTO> list=service.info_getCommentList(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
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
	// 글 신고
	@RequestMapping(value="report",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String report(ReportPostDTO dto) throws JsonProcessingException {
		String result=service.report(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(result);
		return strJson;
	}
	/* 추천 */
	// 추천하기
	@RequestMapping(value="info_favoriteUp", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String favoriteUp(FavoriteDTO dto) {
       service.favoriteUp(dto);
       return null;
    }
    // 추천취소
    @RequestMapping(value="info_favoriteDown", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String favoriteDown(FavoriteDTO dto) {
    	System.out.println("DTO:"+dto);
       service.favoriteDown(dto);
       return null;
    }
    // 추천수 가져오기
    @RequestMapping(value="info_favorite", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String favorite(FavoriteDTO dto) throws JsonProcessingException {
       CommentNumber cn = service.favorite(dto);
       ObjectMapper mapper = new ObjectMapper();
       String json = mapper.writeValueAsString(cn);
       return json;
    }
}
