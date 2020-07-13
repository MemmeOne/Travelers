package com.cpkl.service;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cpkl.dao.ServiceLoginDAO;
import com.cpkl.dto.TrevelersDTO;

@Service
public class LoginService {
	@Autowired
	private ServiceLoginDAO dao;
	private String result;
	public String login_chk(TrevelersDTO dto, HttpSession session) {
		TrevelersDTO dtoresult=dao.login_chk(dto.getId(),dto.getPwd());

		if (dtoresult!=null) {
			if(dtoresult.getPwd().equals(dto.getPwd())) {
				result=dto.getId();
				session.setAttribute("loginUser", dtoresult);
			}else {
				result="비밀번호가 틀렸습니다!";
			}
		}else {
			result="없는 아이디 입니다!";
		}
		return result;
	}
}
