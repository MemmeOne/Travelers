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
import com.cpkl.dto.ServiceLoginDTO;

@Repository
public class ServiceLoginDAO {
	@Autowired
	private SqlSession sqlSession;
	public static final String namespace="com.cpkl.ServiceLoing_mybatis.myMapper";
	private ServiceLoginDTO dto;
	/* 트랜잭션 */
	@Autowired
	private TransactionTemplate transactionTemplate;
	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
	}
	// 로그인 정보 가져오기
	public ServiceLoginDTO login_chk(final String id) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					dto=sqlSession.selectOne(namespace+".login_chk", id);
				}
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}