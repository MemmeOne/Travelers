package com.cpkl.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import com.cpkl.dto.CommentNumber;
import com.cpkl.dto.FavoriteDTO;
import com.cpkl.dto.FreeCommentDTO;
import com.cpkl.dto.FreeDTO;
import com.cpkl.dto.InfoDTO;
/* 자유 게시판 DAO */
import com.cpkl.dto.ReportPostDTO;
@Repository
public class FreeDAO {
	@Autowired
	@Qualifier("free_sqlSession")
	@Resource(name="free_sqlSession")
	private SqlSession free_sqlSession;
	public static final String namespace="com.cpkl.mybatis.myMapper";
	private Map map;
	private List<FreeDTO> list;
	private List<FreeCommentDTO> comment_list;
	private int result;
	/* 게시판 기본 기능 */
	// 자유 게시판 전체 글 목록 가져오기 기능
	public List<FreeDTO> freeboard(int page){
		map=new HashMap<String, Object>();
		if(page>1) {
			map.put("str",(page-1)*10+1);
			map.put("end",(Integer)map.get("str")+9);
		}else {
			map.put("str",1);
			map.put("end",10);
		}
		list=free_sqlSession.selectList(namespace+".freeboard",map);
		//System.out.println("freeboard : "+list.get(0).getNum());
		return list;
	}
	//공지 글 가져오기
	public List<FreeDTO> notis_list() {
		list=free_sqlSession.selectList(namespace+".notis_list");
				return list;
	}
	// 자유 게시판 전체 글 수 가져오기 기능
	public int totPage() {
		result=free_sqlSession.selectOne(namespace+".totPage");
		System.out.println("totPage : "+result);
		return result;
	}
	// 자유 게시판 글 검색 목록 가져오기 기능
	public List<FreeDTO> search(String tag, String word, int page){
		map=new HashMap<String, Object>();
		map.put("tag",tag);
		map.put("word",word);
		if(page>1) {
			map.put("str",(Integer)(page-1)*10+1);
			map.put("end", (Integer)map.get("str")+9);
		}else {
			map.put("str",1);
			map.put("end",10);
		} list = free_sqlSession.selectList(namespace+".search",map);
		return list;
	}
	// 자유 게시판 검색 된 글 수 가져오기 기능
	public int totPageSearch(String tag, String word) {
		map=new HashMap<String, Object>();
		map.put("tag",tag);
		map.put("word",word);
		result=free_sqlSession.selectOne(namespace+".totPageSearch",map);
		System.out.println("totPageSearch : "+result);
	return result;
	}
	public List<FreeDTO> free_board_list(int page){
		List<FreeDTO> dto= free_sqlSession.selectList(namespace+".listAll",page);
		
		return dto;
	}
	// 자유 게시판 글 저장 기능
	public void savedata(FreeDTO dto) {
		int result=free_sqlSession.insert(namespace+".savedata",dto);
		System.out.println("결과 값 : "+result);
	}
	// 자유 게시판 글 상세보기 기능
	public FreeDTO free_content_view(int num){
		try {
		return free_sqlSession.selectOne(namespace+".list",num);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	// 자유 게시판 글 삭제 기능
	public FreeDTO free_board_delete(int num) {
		return free_sqlSession.selectOne(namespace+".delete",num);
	}
	// 자유 게시판 글 수정 페이지
	public FreeDTO free_modify_view(int num) {
		return free_sqlSession.selectOne(namespace+".list",num);
	}
	// 자유 게시판 글 수정 기능
	public void updatedata(FreeDTO dto) {
		System.out.println("====="+dto+"=====");
		System.out.println("====="+dto.getNum()+"=====");
		System.out.println("====="+dto.getTitle()+"=====");
		System.out.println("====="+dto.getContent()+"=====");
		try {
			free_sqlSession.update(namespace+".updatedata",dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 자유 게시판 조회수 기능
	public void uphit(int num) {
		free_sqlSession.update(namespace+".uphit",num);
	}
	/* 댓글 기능 */
	//댓글 리스트 가져오기 기능
	public List<FreeCommentDTO> comment_list(final int num) {
		comment_list=free_sqlSession.selectList(namespace+".comment_list",num);
		System.out.println("댓글 리스트 가져오기 성공");
		return comment_list;
	}
	//댓글 저장 기능
	public void comment_save(final FreeCommentDTO dto) {
		free_sqlSession.update(namespace+".replyShape",dto);
		System.out.println("댓글 정렬 완료");
		result=free_sqlSession.insert(namespace+".comment_save",dto);
		System.out.println("댓글 저장 완료");
	}
	//댓글 수정 기능
	public void comment_modify(final FreeCommentDTO dto) {
		result=free_sqlSession.insert(namespace+".comment_modify",dto);
		System.out.println("댓글 수정 완료");
	}
	//댓글 삭제 기능
	public void comment_delete(final FreeCommentDTO dto) {
		dto.setContent("<b>삭제된 댓글입니다.</b>");
		result=free_sqlSession.insert(namespace+".comment_delete",dto);
	    System.out.println("댓글 삭제 완료");
	}
	//admin 댓글 삭제 기능
	public void comment_delete_admin(final FreeCommentDTO dto) {
		dto.setContent("삭제된 댓글입니다.");
		result=free_sqlSession.insert(namespace+".comment_delete_admin",dto);
	}
		
	//대댓글 저장 기능
	public void comment_reply_save(final FreeCommentDTO dto) {
		result=free_sqlSession.insert(namespace+".comment_reply_save",dto);
		System.out.println("대댓글 저장 완료");
	}
	//대댓글 삭제 기능
	/*
	  public void comment_step_delete(final FreeCommentDTO dto) {
	  free_sqlSession.delete(namespace+".comment_step_delete", dto);
	  System.out.println("대댓글 삭제 완료"); }
	 */
	
	//댓글 수 표시 기능
	public List<CommentNumber> commentCount(){
		return free_sqlSession.selectList(namespace+".commentcount");
	}
	//추천 클릭 시 
	public void favoriteUp(FavoriteDTO dto) {
		free_sqlSession.insert(namespace+".favoriteUp", dto);
	}
	//추천 취소
	public void favoriteDown(FavoriteDTO dto) {
		free_sqlSession.delete(namespace+".favoriteDown", dto);
	}
	
	public List<CommentNumber> favoriteList() {
		return free_sqlSession.selectList(namespace+".favoriteList");
	}
	
	public CommentNumber favorite(FavoriteDTO dto) {
		return free_sqlSession.selectOne(namespace+".favorite", dto);
	}
	
	public List<FavoriteDTO> postFavoriteList(int num){
		return free_sqlSession.selectList(namespace+".postFavoriteList", num);
	}
}