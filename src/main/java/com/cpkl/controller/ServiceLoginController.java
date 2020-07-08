package com.cpkl.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cpkl.dto.ServiceLoginDTO;
import com.cpkl.service.LoginService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ServiceLoginController {
	@Autowired
	private LoginService service;

	@RequestMapping("login")
	public String login() {
		return "service_login/login";
	}
	@RequestMapping(value="login_chk",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String login_chk(ServiceLoginDTO dto) throws JsonProcessingException {
		ServiceLoginDTO list=service.login_chk(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
}
