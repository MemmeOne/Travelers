package com.cpkl.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cpkl.dto.ReviewBoardDTO;

@Repository
public class ReviewBoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	public static final String namespace = "Mapper";
	
	public List<ReviewBoardDTO> reviewBoard(int num){
		return sqlSession.selectList(namespace+".reviewboard",num);
	}
}
