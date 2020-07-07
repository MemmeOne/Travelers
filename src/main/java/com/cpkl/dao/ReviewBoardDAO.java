package com.cpkl.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cpkl.dto.CommentNumber;
import com.cpkl.dto.ReviewBoardCommentsDTO;
import com.cpkl.dto.ReviewBoardDTO;

@Repository
public class ReviewBoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	public static final String namespace = "Mapper";
	
	public List<ReviewBoardDTO> reviewBoard(String page){
		return sqlSession.selectList(namespace+".reviewboard",page);
	}
	
	public int contentReg(ReviewBoardDTO dto) {
		return sqlSession.insert(namespace+".contentreg", dto);
	}
	
	public ReviewBoardDTO contentView(int id) {
		return sqlSession.selectOne(namespace+".contentview", id);
	}
	
	public void upHit(int id) {
		sqlSession.update(namespace+".uphit", id);
	}
	
	public void delete(int id) {
		sqlSession.delete(namespace+".delete", id);
	}
	
	public void modify(ReviewBoardDTO dto) {
		sqlSession.update(namespace+".modify", dto);
	}
	
	public List<ReviewBoardCommentsDTO> comments(int id){
		return sqlSession.selectList(namespace+".comments", id); 
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
	
}
