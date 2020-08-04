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

import com.cpkl.dto.InfoCommentDTO;
import com.cpkl.dto.InfoDTO;
import com.cpkl.dto.ReportPostDTO;

/* 정보 게시판 DAO  */
@Repository
public class InfoDAO {
	@Autowired
	@Qualifier("info_sqlSession")
//	@Resource(name="info_sqlSession")
	private SqlSession info_sqlSession;
	public static final String namespace="com.cpkl.info_mybatis.myMapper";
	private List<InfoDTO> list;
	private List<InfoCommentDTO> comment_list;
	private InfoDTO dto;
	private int result;
	private Map map;
	/* 트랜잭션 */
	@Autowired
	@Resource(name="info_transactionTemplate")
	private TransactionTemplate transactionTemplate;
	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
	}
	/* 게시판 기본 기능 */
	// 정보 게시판 전체 글 목록 가져오기 기능
	public List<InfoDTO> listAll(final int page) {
		map=new HashMap<String, Object>();
		if(page>1) {
			map.put("str", (page-1)*10+1);
			map.put("end", (Integer)map.get("str")+9);
		}else {
			map.put("str", 1);
			map.put("end", 10);
		}
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					list=info_sqlSession.selectList(namespace+".listAll",map);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//정보 게시판 전체 글 수 가져오기 기능
	public int totPage() {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=info_sqlSession.selectOne(namespace+".totPage");
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// 정보 게시판 글 검색 목록 가져오기 기능
	public List<InfoDTO> search(String tag, String word, int page) {
		map=new HashMap<String, Object>();
		map.put("tag", tag);
		map.put("word", word);
		if(page>1) {
			map.put("str", (Integer)(page-1)*10+1);
			map.put("end", (Integer)map.get("str")+9);
		}else {
			map.put("str", 1);
			map.put("end", 10);
		}
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					list=info_sqlSession.selectList(namespace+".search",map);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 정보 게시판 검색 된 글 수 가져오기 기능
	public int totPageSearch(String tag, String word) {
		map=new HashMap<String, Object>();
		map.put("tag", tag);
		map.put("word", word);
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=info_sqlSession.selectOne(namespace+".totPageSearch",map);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// 정보 게시판 글 저장 기능
	public int info_save(final InfoDTO dto) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=info_sqlSession.insert(namespace+".info_save",dto);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// 정보 게시판 글 상세보기 기능
	public InfoDTO info_post(final int num) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					dto=info_sqlSession.selectOne(namespace+".info_post", num);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	// 정보 게시판 조회수 기능
	public void info_uphit(final int num) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					info_sqlSession.update(namespace+".info_uphit", num);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 정보 게시판 글 수정 기능
	public int info_modify(final InfoDTO dto) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=info_sqlSession.update(namespace+".info_modify",dto);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// 정보 게시판 글 삭제 기능
	public int info_delete(final int num) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=info_sqlSession.delete(namespace+".info_delete",num);
					info_sqlSession.delete(namespace+".info_delete_comment",num);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}	

	/* 댓글 기능 */
	// 댓글 리스트 가져오기 기능
	public List<InfoCommentDTO> comment_list(final int num) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					comment_list=info_sqlSession.selectList(namespace+".comment_list",num);
					System.out.println("댓글 리스트 가져오기 성공");
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return comment_list;
	}
	// 댓글 저장 기능
	public void comment_save(final InfoCommentDTO dto) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					info_sqlSession.update(namespace+".replyShape",dto);
					result=info_sqlSession.insert(namespace+".comment_save",dto);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 댓글 수정 기능
	public void comment_modify(final InfoCommentDTO dto) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=info_sqlSession.insert(namespace+".comment_modify",dto);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 댓글 삭제 기능
	public void comment_delete(final InfoCommentDTO dto) {
		dto.setContent("<b>삭제된 댓글입니다.</b>");
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=info_sqlSession.insert(namespace+".comment_delete",dto);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	// admin 댓글 삭제 기능
	public void comment_delete_admin(final InfoCommentDTO dto) {
		dto.setContent("삭제된 댓글입니다.");
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=info_sqlSession.insert(namespace+".comment_delete_admin",dto);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 대댓글 저장 기능
	public void comment_reply_save(final InfoCommentDTO dto) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=info_sqlSession.insert(namespace+".comment_reply_save",dto);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String report(final ReportPostDTO dto2) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=info_sqlSession.insert(namespace+".report",dto2);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(result);
		if(result==1) {
			return "신고 성공";
		}else {
			return "신고 실패";
		}
	}
}