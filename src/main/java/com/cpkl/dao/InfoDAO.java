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

import com.cpkl.dto.InfoCommentDTO;
import com.cpkl.dto.InfoDTO;

@Repository
public class InfoDAO {
	@Autowired
	private SqlSession sqlSession;
	public static final String namespace="com.cpkl.info_mybatis.myMapper";
	private List<InfoDTO> list;
	private List<InfoCommentDTO> comment_list;
	private InfoDTO dto;
	private int result;
	private Map map;
	/* 트랜잭션 */
	@Autowired
	private TransactionTemplate transactionTemplate;
	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
	}
	// 전체 글 목록 가져오기
	public List<InfoDTO> listAll(final int page) {
		map=new HashMap<String, Object>();
		if(page>1) {
			map.put("str", (page-1)*3+1);
			map.put("end", (Integer)map.get("str")+2);
		}else {
			map.put("str", 1);
			map.put("end", 3);
		}
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					list=sqlSession.selectList(namespace+".listAll",map);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 전체 글 수
	public int totPage() {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=sqlSession.selectOne(namespace+".totPage");
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 검색된 글 목록 가져오기
	public List<InfoDTO> search(String tag, String word, int page) {
		map=new HashMap<String, Object>();
		map.put("tag", tag);
		map.put("word", word);
		if(page>1) {
			map.put("str", (Integer)(page-1)*3+1);
			map.put("end", (Integer)map.get("str")+2);
		}else {
			map.put("str", 1);
			map.put("end", 3);
		}
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					list=sqlSession.selectList(namespace+".search",map);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 검색 된 글 수
	public int totPageSearch(String tag, String word) {
		map=new HashMap<String, Object>();
		map.put("tag", tag);
		map.put("word", word);
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=sqlSession.selectOne(namespace+".totPageSearch",map);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 글 게시
	public int info_save(final InfoDTO dto) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=sqlSession.insert(namespace+".info_save",dto);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// 글 내용 가져오기
	public InfoDTO info_post(final int num) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					dto=sqlSession.selectOne(namespace+".info_post", num);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	// 조회수
	public void info_uphit(final int num) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					sqlSession.update(namespace+".info_uphit", num);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 댓글 리스트
	public List<InfoCommentDTO> comment_list(final int num) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					comment_list=sqlSession.selectList(namespace+".comment_list",num);
					System.out.println("댓글 리스트 가져오기 성공");
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return comment_list;
	}
	// 댓글 저장
	public void comment_save(final InfoCommentDTO dto) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=sqlSession.insert(namespace+".comment_save",dto);
					System.out.println("댓글 저장 완료");
					sqlSession.update(namespace+".replyShape",dto);
					System.out.println("댓글 정렬 완료");
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 댓글 수정
	public void comment_modify(final InfoCommentDTO dto) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=sqlSession.insert(namespace+".comment_modify",dto);
					System.out.println("댓글 수정 완료");
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 댓글 삭제
	public void comment_delete(final InfoCommentDTO dto) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=sqlSession.insert(namespace+".comment_delete",dto);
					System.out.println("댓글 삭제 완료");
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 글 수정
	public int info_modify(final InfoDTO dto) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=sqlSession.update(namespace+".info_modify",dto);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// 글 삭제
	public int info_delete(final int num) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=sqlSession.delete(namespace+".info_delete",num);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void comment_reply_save(final InfoCommentDTO dto) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=sqlSession.delete(namespace+".comment_reply_save",dto);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}