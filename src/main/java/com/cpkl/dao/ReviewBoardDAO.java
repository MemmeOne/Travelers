package com.cpkl.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cpkl.dto.ReviewBoardCommentsDTO;
import com.cpkl.dto.ReviewBoardDTO;

@Repository
public class ReviewBoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	public static final String namespace = "Mapper";
	
	public List<ReviewBoardDTO> reviewBoard(int num){
		return sqlSession.selectList(namespace+".reviewboard",num);
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
	
}
