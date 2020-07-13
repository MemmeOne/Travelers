package com.cpkl.service;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.cpkl.dao.ServiceLoginDAO;
import com.cpkl.dto.ServiceLoginDTO;

@Service
public class LoginService {
	@Autowired
	private ServiceLoginDAO dao;
	private String result;
	public String login_chk(ServiceLoginDTO dto, HttpSession session) {
		result=dao.login_chk(dto.getId(),dto.getPwd());
		if(result.equals(dto.getId())) {
			session.setAttribute("user", result);
		}
		return result;
	}
}
