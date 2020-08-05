package com.cpkl.dao;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import com.cpkl.dto.PackageDTO;
import com.cpkl.dto.ReportPostDTO;

@Repository
public class AdminDAO {
	@Autowired
	@Qualifier("admin_sqlSession")
	private SqlSession admin_sqlSession;
	public static final String namespace="com.cpkl.admin_mybatis.myMapper";
	/* 트랜잭션 */
	@Autowired
	@Resource(name="admin_transactionTemplate")
	private TransactionTemplate transactionTemplate;
	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
	}
	/* Admin Page 기능 */
	// 
	List<ReportPostDTO> infodto=new ArrayList<ReportPostDTO>();
	List<ReportPostDTO> matedto=new ArrayList<ReportPostDTO>();
	List<ReportPostDTO> reviewdto=new ArrayList<ReportPostDTO>();
	List<ReportPostDTO> freedto=new ArrayList<ReportPostDTO>();
	public void list(HttpSession session) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					infodto=admin_sqlSession.selectList(namespace+".report_infolist");
					matedto=admin_sqlSession.selectList(namespace+".report_matelist");
					reviewdto=admin_sqlSession.selectList(namespace+".report_reviewlist");
					freedto=admin_sqlSession.selectList(namespace+".report_freelist");
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(infodto!=null) {
			session.setAttribute("info", infodto);
		}
		if(matedto!=null) {
			session.setAttribute("mate", matedto);
		}
		if(reviewdto!=null) {
			session.setAttribute("review", reviewdto);
		}
		if(freedto!=null) {
			session.setAttribute("free", freedto);
		}
	}
	public List<ReportPostDTO> infodelete_chk(final String[] result) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					for(String n:result) {
						admin_sqlSession.selectList(namespace+".infodelete_chk_board",n);
						admin_sqlSession.selectList(namespace+".infodelete_chk_comment",n);
						admin_sqlSession.selectList(namespace+".infodelete_chk_reportpost",n);
					}
					infodto=admin_sqlSession.selectList(namespace+".report_infolist");
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return infodto;
	}
	public List<ReportPostDTO> reviewdelete_chk(final String[] result) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					for(String n:result) {
						admin_sqlSession.selectList(namespace+".reviewdelete_chk_board",n);
						admin_sqlSession.selectList(namespace+".reviewdelete_chk_comment",n);
						admin_sqlSession.selectList(namespace+".reviewdelete_chk_reportpost",n);
					}
					reviewdto=admin_sqlSession.selectList(namespace+".report_reviewlist");
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return reviewdto;
	}
	public List<ReportPostDTO> freedelete_chk(final String[] result) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					for(String n:result) {
						admin_sqlSession.selectList(namespace+".freedelete_chk_board",n);
						admin_sqlSession.selectList(namespace+".freedelete_chk_comment",n);
						admin_sqlSession.selectList(namespace+".freedelete_chk_reportpost",n);
					}
					freedto=admin_sqlSession.selectList(namespace+".report_freelist");
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return freedto;
	}
	public List<ReportPostDTO> matedelete_chk(final String[] result) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					for(String n:result) {
						admin_sqlSession.selectList(namespace+".matedelete_chk_board",n);
						admin_sqlSession.selectList(namespace+".matedelete_chk_comment",n);
						admin_sqlSession.selectList(namespace+".matedelete_chk_reportpost",n);
					}
					matedto=admin_sqlSession.selectList(namespace+".report_matelist");
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return matedto;
	}
	
	List<PackageDTO> package_list;
	public List<PackageDTO> package_list() {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					package_list=admin_sqlSession.selectList(namespace+".package_list");
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return package_list;
	}
	int result;
	public int package_save(final PackageDTO dto) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					result=admin_sqlSession.insert(namespace+".package_save",dto);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
