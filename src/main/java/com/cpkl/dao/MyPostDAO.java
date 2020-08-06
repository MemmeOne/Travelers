package com.cpkl.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.cpkl.dto.FreeDTO;
import com.cpkl.dto.InfoDTO;
import com.cpkl.dto.MateDTO;
import com.cpkl.dto.ReviewBoardDTO;

@Repository
public class MyPostDAO {
	@Autowired
	@Qualifier("free_sqlSession")
	@Resource(name="free_sqlSession")
	private SqlSession free_sqlSession;
	public static final String namespace="com.cpkl.mybatis.myMapper";
	private Map map;
	private List<MateDTO> mate_list;
	private List<FreeDTO> free_list;
	private List<InfoDTO> info_list;
	private List<ReviewBoardDTO> review_list;
	private int result;
	
	public List<MateDTO> mate_post(int page,String nick){
		mate_list=free_sqlSession.selectList(namespace+".mate_post",nick);
		return mate_list;
	}
	public List<FreeDTO> free_post(int page,String nick){
		free_list=free_sqlSession.selectList(namespace+".free_post",nick);
		return free_list;
	}

	public List<InfoDTO> info_post(int page,String nick){
		info_list=free_sqlSession.selectList(namespace+".info_post",nick);
		return info_list;
	}
	public List<ReviewBoardDTO> review_post(int page,String nick){
		review_list=free_sqlSession.selectList(namespace+".review_post",nick);
		return review_list;
	}
}
