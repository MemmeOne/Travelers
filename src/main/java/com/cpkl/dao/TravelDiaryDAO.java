package com.cpkl.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.cpkl.dto.TravelDiaryDTO;

@Repository
public class TravelDiaryDAO {
	
	@Autowired
	@Qualifier("review_sqlSession")
	private SqlSession sqlSession;
	public static final String namespace = "Mapper";
	
	public List<String> getNation(){
		return sqlSession.selectList(namespace+".nation");
	}
	
	public void travelDiaryReg(TravelDiaryDTO dto) {
		sqlSession.insert(namespace+".travelDiaryReg", dto);
	}
	
	public List<TravelDiaryDTO> travelDiaryList(String nick) {
		return sqlSession.selectList(namespace+".travelDiaryList", nick);
	}
	
}
