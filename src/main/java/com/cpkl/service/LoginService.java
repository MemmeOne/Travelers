package com.cpkl.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cpkl.dao.ServiceLoginDAO;
import com.cpkl.dto.ServiceLoginDTO;

@Service
public class LoginService {
	@Autowired
	ServiceLoginDAO dao;
	public ServiceLoginDTO login_chk(ServiceLoginDTO dto) {
		ServiceLoginDTO redto=dao.login_chk(dto.getId());
		return redto;
	}
}
