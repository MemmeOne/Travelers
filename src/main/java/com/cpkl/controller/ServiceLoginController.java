package com.cpkl.controller;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	/* 로그인 기능 */
	// 로그인 페이지 연결
	@RequestMapping("login")
	public String login() {
		return "service_login/login";
	}
	// 로그인 유효성 검사
	@RequestMapping(value="login_chk",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String login_chk(ServiceLoginDTO dto, HttpSession session) throws JsonProcessingException {
//		ServiceLoginDTO list=service.login_chk(dto);
//		ObjectMapper mapper=new ObjectMapper();
//		String strJson=mapper.writeValueAsString(list);
		String result=service.login_chk(dto, session);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(result);
		return strJson;
	}
	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "service_login/login";
	}
	
	/* 회원가입 기능 */
	@RequestMapping("reg")
	public String reg() {
		return "service_login/reg";
	}
	// 회원가입 유효성 검사
	@RequestMapping(value="id_chk",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String id_chk(ServiceLoginDTO dto) throws JsonProcessingException {
		String result=service.id_chk(dto.getId());
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(result);
		return strJson;
	}
	@RequestMapping(value="reg_chk",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String reg_chk(ServiceLoginDTO dto) throws JsonProcessingException {
		service.reg_chk(dto);
//		ServiceLoginDTO list=service.login_chk(dto);
//		ObjectMapper mapper=new ObjectMapper();
//		String strJson=mapper.writeValueAsString(list);
		String result=service.reg_chk(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(result);
		return strJson;
	}
}
