package com.cpkl.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import com.cpkl.dto.FreeDTO;

@Repository
public class FreeDAO {
	@Autowired
	private SqlSession sqlSession;
	public static final String namespace="com.cpkl.mybatis.myMapper";
	private Map map;
	private List<FreeDTO> list;
	private int result;
	public List<FreeDTO> freeboard(int page){
		map=new HashMap<String, Object>();
		if(page>1) {
			map.put("str",(page-1)*3+1);
			map.put("end",(Integer)map.get("str")+2);
		}else {
			map.put("str",1);
			map.put("end",3);
		}
		list=sqlSession.selectList(namespace+".freeboard",map);
		//System.out.println("freeboard : "+list.get(0).getNum());
		return list;
	}
	public int totPage() {
		result=sqlSession.selectOne(namespace+".totPage");
		System.out.println("totPage : "+result);
		return result;
	}
	public List<FreeDTO> search(String tag, String word, int page){
		map=new HashMap<String, Object>();
		map.put("tag",tag);
		map.put("word",word);
		if(page>1) {
			map.put("str",(Integer)(page-1)*3+1);
			map.put("end", (Integer)map.get("str")+2);
		}else {
			map.put("str",1);
			map.put("end",3);
		} list = sqlSession.selectList(namespace+".search",map);
		return list;
	}
	public int totPageSearch(String tag, String word) {
		map=new HashMap<String, Object>();
		map.put("tag",tag);
		map.put("word",word);
		result=sqlSession.selectOne(namespace+".totPageSearch",map);
		System.out.println("totPageSearch : "+result);
	return result;
	}
	public List<FreeDTO> free_board_list(int page){
		List<FreeDTO> dto= sqlSession.selectList(namespace+".listAll",page);
		
		return dto;
	}
	public void savedata(FreeDTO dto) {
		int result=sqlSession.insert(namespace+".savedata",dto);
		System.out.println("결과 값 : "+result);
	}
	public FreeDTO free_content_view(int num){
		try {
		return sqlSession.selectOne(namespace+".list",num);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public FreeDTO free_board_delete(int num) {
		return sqlSession.selectOne(namespace+".delete",num);
	}
	public FreeDTO free_modify_view(int num) {
		return sqlSession.selectOne(namespace+".list",num);
	}
	public void updatedata(FreeDTO dto) {
		System.out.println("====="+dto+"=====");
		System.out.println("====="+dto.getNum()+"=====");
		System.out.println("====="+dto.getTitle()+"=====");
		System.out.println("====="+dto.getContent()+"=====");
		try {
			sqlSession.update(namespace+".updatedata",dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void uphit(int num) {
		sqlSession.update(namespace+".uphit",num);
	}
}