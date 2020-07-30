package com.cpkl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cpkl.dao.FreeDAO;
import com.cpkl.dto.CommentNumber;
import com.cpkl.dto.FreeCommentDTO;
import com.cpkl.dto.FreeDTO;
/* 자유 게시판 서비스 */
@Service
public class FreeService {
	@Autowired
	private FreeDAO dao;
	/* 게시판 기본 기능 */
	// 자유 게시판 전체 글 목록 가져오기 기능
	public void free_board_list(Model model,int page) {
		model.addAttribute("lists",dao.freeboard(page));
		model.addAttribute("totPage",dao.totPage());
		model.addAttribute("commentcount",dao.commentCount());
		System.out.println(dao.commentCount());
	}
	// 자유 게시판 글 검색 목록 가져오기 기능
	public void search(Model model, String tag, String word, int page) {
		model.addAttribute("lists", dao.search(tag, word, page));
		model.addAttribute("totPage",dao.totPageSearch(tag, word));
		model.addAttribute("commentcount",dao.commentCount());
		model.addAttribute("tag",tag);
		model.addAttribute("word",word);
	}
	// 자유 게시판 글 작성 기능
	public void free_write_list(int num, Model model) {
		model.addAttribute("lists",dao.free_board_list(num));
	}
	// 자유 게시판 글 저장 기능
	public void savedata(FreeDTO dto) {
		dao.savedata(dto);
	}
	// 자유 게시판 글 상세보기 기능
	public void free_content_view(Model model,int num) {
		dao.uphit(num);
	   model.addAttribute("lists",dao.free_content_view(num));
	   model.addAttribute("comment_list",dao.comment_list(num));
	}
	// 자유 게시판 글 삭제 기능
	public void free_board_delete(Model model,int num) {
	   dao.free_board_delete(num);
	}
	// 자유 게시판 글 수정 페이지
	public void free_modify_view(Model model,int num) {
		model.addAttribute("lists",dao.free_modify_view(num));
	}
	// 자유 게시판 글 수정 기능
	public void updatedata(FreeDTO dto) {
		dao.updatedata(dto);
		System.out.println(dto);
	}
	/* 댓글 기능 */
	// 댓글 저장 기능
	public List<FreeCommentDTO> comment_save(FreeCommentDTO dto) {
		dao.comment_save(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	// 댓글 수정 기능
	public List<FreeCommentDTO> comment_modify(FreeCommentDTO dto) {
		dao.comment_modify(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	// 댓글 삭제 기능
	public List<FreeCommentDTO> comment_delete(FreeCommentDTO dto) {
		if(dto.getStep() == 0) {
			dao.comment_delete(dto);
		}else {
			dao.comment_indent_delete(dto);
		}
		return dao.comment_list(dto.getNumgroup());
	}
	// 대댓글 저장 기능
	public List<FreeCommentDTO> comment_reply_save(FreeCommentDTO dto) {
		dao.comment_reply_save(dto);
		return dao.comment_list(dto.getNumgroup());
	}
}

