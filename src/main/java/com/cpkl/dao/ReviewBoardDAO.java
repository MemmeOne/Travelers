package com.cpkl.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.cpkl.dto.CommentNumber;
import com.cpkl.dto.FavoriteDTO;
import com.cpkl.dto.ReviewBoardCommentsDTO;
import com.cpkl.dto.ReviewBoardDTO;

@Repository
public class ReviewBoardDAO {
	
	@Autowired
	@Qualifier("review_sqlSession")
	private SqlSession sqlSession;
	public static final String namespace = "Mapper";
	
	public List<ReviewBoardDTO> reviewBoard(String page){
		return sqlSession.selectList(namespace+".reviewboard",page);
	}
	
	public int contentReg(ReviewBoardDTO dto) {
		return sqlSession.insert(namespace+".contentreg", dto);
	}
	
	public ReviewBoardDTO contentView(int num) {
		return sqlSession.selectOne(namespace+".contentview", num);
	}
	
	public void upHit(int num) {
		sqlSession.update(namespace+".uphit", num);
	}
	
	public void delete(int num) {
		sqlSession.delete(namespace+".delete", num);
	}
	
	public void modify(ReviewBoardDTO dto) {
		sqlSession.update(namespace+".modify", dto);
	}
	
	public List<ReviewBoardCommentsDTO> comments(CommentNumber dto){
		return sqlSession.selectList(namespace+".comments", dto); 
	}
	
	public void comment(ReviewBoardCommentsDTO dto) {
		sqlSession.insert(namespace+".comment", dto);
	}
	
	public int totalContent() {
		return sqlSession.selectOne(namespace+".totalcontent");
	}
	
	public List<ReviewBoardDTO> search(Map<String, Object> map){
		return sqlSession.selectList(namespace+".search",map);
	}
	
	
	public int totalSearch(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+".totalsearch", map);
	}
	
	public List<CommentNumber> commentCount() {
		return sqlSession.selectList(namespace+".commentcount");
	}
	
	public void reply(ReviewBoardCommentsDTO dto) {
		sqlSession.insert(namespace+".reply", dto);
	}
	
	public void commentModify(ReviewBoardCommentsDTO dto) {
		sqlSession.update(namespace+".commentmodify", dto);
	}
	
	public void commentDelete(ReviewBoardCommentsDTO dto) {
		sqlSession.delete(namespace+".commentdelete", dto);
	}
	
	public void commentIndentDelete(ReviewBoardCommentsDTO dto) {
		sqlSession.delete(namespace+".commentindentdelete", dto);
	}
	
	public CommentNumber totalComment(int num) {
		return sqlSession.selectOne(namespace+".totalcomment", num);
	}
	
	public void favoriteUp(FavoriteDTO dto) {
		sqlSession.insert(namespace+".favoriteUp", dto);
	}
	
	
	public List<ReviewBoardDTO> favoriteList(int boardnum) {
		return sqlSession.selectList(namespace+".favoriteList", boardnum);
	}
	
	public CommentNumber favorite(FavoriteDTO dto) {
		return sqlSession.selectOne(namespace+".favorite", dto);
	}
	
}
