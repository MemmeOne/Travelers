package com.cpkl.dao;
import javax.annotation.Resource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;
import com.cpkl.dto.ServiceLoginDTO;

@Repository
public class ServiceLoginDAO {
	@Autowired
	@Resource(name="servicelogin_sqlSession")
	private SqlSession servicelogin_sqlSession;
	public static final String namespace="com.cpkl.ServiceLogin_mybatis.myMapper";
	private ServiceLoginDTO dto;
	private String result;
	/* 트랜잭션 */
	@Autowired
	@Resource(name="servicelogin_transactionTemplate")
	private TransactionTemplate transactionTemplate;
	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
	}
	// 로그인 정보 가져오기
	public String login_chk(final String id, String pwd) {
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
		if (dto!=null) {
			if(dto.getPwd().equals(pwd)) {
				result=id;
			}else {
				result="비밀번호가 틀렸습니다!";
			}
		}else {
			result="없는 아이디 입니다!";
		}
		return result;
	}
	// 이메일 중복 확인
	public ServiceLoginDTO email_chk(final String email) {
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
	public ServiceLoginDTO id_chk(final String id) {
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
	public ServiceLoginDTO nick_chk(final String usernick) {
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
	public String insert_user(final ServiceLoginDTO dto) {
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
}