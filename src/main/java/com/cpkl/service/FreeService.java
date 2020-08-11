package com.cpkl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cpkl.dao.FreeDAO;
import com.cpkl.dto.CommentNumber;
import com.cpkl.dto.FavoriteDTO;
import com.cpkl.dto.FreeCommentDTO;
import com.cpkl.dto.FreeDTO;
import com.cpkl.dto.InfoCommentDTO;
import com.cpkl.dto.ReportPostDTO;
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
		model.addAttribute("notis_list",dao.notis_list());
		model.addAttribute("commentcount",dao.commentCount());
		System.out.println(dao.commentCount());
	}
	// 자유 게시판 글 검색 목록 가져오기 기능
	public void search(Model model, String tag, String word, int page) {
		model.addAttribute("lists", dao.search(tag, word, page));
		model.addAttribute("totPage",dao.totPageSearch(tag, word));
		model.addAttribute("notis_list",dao.notis_list());
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
	   model.addAttribute("lists",dao.free_content_view(num));
	   model.addAttribute("comment_list",dao.comment_list(num));
	   model.addAttribute("favoriteList", dao.postFavoriteList(num));
	   model.addAttribute("commentcount",dao.commentCount());
	}
	public void uphit(int num) {
		dao.uphit(num);
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
	// 댓글 전체 목록 가져오기
		public List<FreeCommentDTO> free_getCommentList(FreeCommentDTO dto) {
			return dao.comment_list(dto.getNumgroup());
		}
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
		dao.comment_delete(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	// admin 댓글 삭제 기능
	public List<FreeCommentDTO> comment_delete_admin(FreeCommentDTO dto) {
		dao.comment_delete_admin(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	// 댓글 삭제 기능
	/*
	  public List<FreeCommentDTO> comment_delete(FreeCommentDTO dto) {
	  if(dto.getStep() == 0) { dao.comment_delete(dto); }else {
	  dao.comment_step_delete(dto); } return dao.comment_list(dto.getNumgroup()); }
	 */
	// 대댓글 저장 기능
	public List<FreeCommentDTO> comment_reply_save(FreeCommentDTO dto) {
		dao.comment_reply_save(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	//추천
	public void favoriteUp(FavoriteDTO dto) {
		dao.favoriteUp(dto);
	}
	//추천 취소
	public void favoriteDown(FavoriteDTO dto) {
		dao.favoriteDown(dto);
	}
	//게시글 별 추천 수
	public void favoriteList(Model model) {
		model.addAttribute("favoriteList", dao.favoriteList());
	}
	//게시글의 추천 수
	public CommentNumber favorite(FavoriteDTO dto) {
		return dao.favorite(dto);
	}
}

