package com.cpkl.service;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import com.cpkl.dao.InfoDAO;
import com.cpkl.dto.InfoCommentDTO;
import com.cpkl.dto.InfoDTO;
import com.cpkl.dto.ReportPostDTO;

/* 정보 게시판 서비스  */
@Service
public class InfoService {
	@Autowired
	private InfoDAO dao;
	/* 게시판 기본 기능 */
	// 정보 게시판 전체 글 목록 가져오기 기능
	public void listAll(Model model, int page) {
		model.addAttribute("info_list",dao.listAll(page));
		model.addAttribute("totPage",dao.totPage());
	}
	// 정보 게시판 글 검색 목록 가져오기 기능
	public void search(Model model, String tag, String word, int page) {
		model.addAttribute("info_list",dao.search(tag, word, page));
		model.addAttribute("totPage",dao.totPageSearch(tag, word));
		model.addAttribute("tag",tag);
		model.addAttribute("word",word);
	}
	// 정보 게시판 글 저장 기능
	public int info_save(InfoDTO dto) {
		return dao.info_save(dto);
	}
	// 정보 게시판 글 상세보기 기능
	public void info_post(int num,Model model) {
		dao.info_uphit(num);
		model.addAttribute("info_post",dao.info_post(num));
		model.addAttribute("comment_list",dao.comment_list(num));
	}
	// 정보 게시판 글 수정 기능
	public int info_modify(InfoDTO dto) {
		return dao.info_modify(dto);
	}
	// 정보 게시판 글 삭제 기능
	public int info_delete(int num) {
		return dao.info_delete(num);
	}
	/* 댓글 기능 */
	// 댓글 저장 기능
	public List<InfoCommentDTO> comment_save(InfoCommentDTO dto) {
		dao.comment_save(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	// 댓글 수정 기능
	public List<InfoCommentDTO> comment_modify(InfoCommentDTO dto) {
		dao.comment_modify(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	// 댓글 삭제 기능
	public List<InfoCommentDTO> comment_delete(InfoCommentDTO dto) {
		dao.comment_delete(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	// admin 댓글 삭제 기능
	public List<InfoCommentDTO> comment_delete_admin(InfoCommentDTO dto) {
		dao.comment_delete_admin(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	// 대댓글 저장 기능
	public List<InfoCommentDTO> comment_reply_save(InfoCommentDTO dto) {
		dao.comment_reply_save(dto);
		return dao.comment_list(dto.getNumgroup());
	}
	public String report(ReportPostDTO dto) {
		return dao.report(dto);
	}
}
