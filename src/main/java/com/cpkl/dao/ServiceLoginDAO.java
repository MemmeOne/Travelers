package com.cpkl.dao;
import javax.annotation.Resource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;
import com.cpkl.dto.TrevelersDTO;

@Repository
public class ServiceLoginDAO {
	@Autowired
	@Resource(name="servicelogin_sqlSession")
	private SqlSession servicelogin_sqlSession;
	public static final String namespace="com.cpkl.ServiceLogin_mybatis.myMapper";
	private TrevelersDTO dto;
	private String result;
	/* 트랜잭션 */
	@Autowired
	@Resource(name="servicelogin_transactionTemplate")
	private TransactionTemplate transactionTemplate;
	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
	}
	// 로그인 정보 가져오기
	public TrevelersDTO login_chk(final String id, String pwd) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					dto=servicelogin_sqlSession.selectOne(namespace+".login_chk", id);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	// 이메일 중복 확인
	public TrevelersDTO email_chk(final String email) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					dto=servicelogin_sqlSession.selectOne(namespace+".email_chk", email);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	// 아이디 중복 확인
	public TrevelersDTO id_chk(final String id) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					dto=servicelogin_sqlSession.selectOne(namespace+".login_chk", id);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	// 닉네임 중복 확인
	public TrevelersDTO nick_chk(final String usernick) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					dto=servicelogin_sqlSession.selectOne(namespace+".nick_chk", usernick);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public String insert_user(final TrevelersDTO dto) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					servicelogin_sqlSession.selectOne(namespace+".insert_user", dto);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void delete_User(final TrevelersDTO dto) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					servicelogin_sqlSession.selectOne(namespace+".delete_User", dto);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}