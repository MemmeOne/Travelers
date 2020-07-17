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

import com.cpkl.dto.FreeCommentDTO;
import com.cpkl.dto.FreeDTO;

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
	public List<FreeDTO> freeboard(int page){
		map=new HashMap<String, Object>();
		if(page>1) {
			map.put("str",(page-1)*3+1);
			map.put("end",(Integer)map.get("str")+2);
		}else {
			map.put("str",1);
			map.put("end",3);
		}
		list=free_sqlSession.selectList(namespace+".freeboard",map);
		//System.out.println("freeboard : "+list.get(0).getNum());
		return list;
	}
	public int totPage() {
		result=free_sqlSession.selectOne(namespace+".totPage");
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
		} list = free_sqlSession.selectList(namespace+".search",map);
		return list;
	}
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
	public void savedata(FreeDTO dto) {
		int result=free_sqlSession.insert(namespace+".savedata",dto);
		System.out.println("결과 값 : "+result);
	}
	public FreeDTO free_content_view(int num){
		try {
		return free_sqlSession.selectOne(namespace+".list",num);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public FreeDTO free_board_delete(int num) {
		return free_sqlSession.selectOne(namespace+".delete",num);
	}
	public FreeDTO free_modify_view(int num) {
		return free_sqlSession.selectOne(namespace+".list",num);
	}
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
	public void uphit(int num) {
		free_sqlSession.update(namespace+".uphit",num);
	}
	//댓글 리스트
	public List<FreeCommentDTO> comment_list(final int num) {
		comment_list=free_sqlSession.selectList(namespace+".comment_list",num);
		System.out.println("댓글 리스트 가져오기 성공");
		return comment_list;
	}
	//댓글 저장
	public void comment_save(final FreeCommentDTO dto) {
		free_sqlSession.update(namespace+".replyShape",dto);
		System.out.println("댓글 정렬 완료");
		result=free_sqlSession.insert(namespace+".comment_save",dto);
		System.out.println("댓글 저장 완료");
	}
	//댓글 수정
	public void comment_modify(final FreeCommentDTO dto) {
		result=free_sqlSession.insert(namespace+".comment_modify",dto);
		System.out.println("댓글 수정 완료");
	}
	//댓글 삭제
	public void comment_delete(final FreeCommentDTO dto) {
		result=free_sqlSession.insert(namespace+".comment_delete",dto);
	    System.out.println("댓글 삭제 완료");
	}
	//대댓글 저장
	public void comment_reply_save(final FreeCommentDTO dto) {
		result=free_sqlSession.insert(namespace+".comment_reply_save",dto);
	}
}