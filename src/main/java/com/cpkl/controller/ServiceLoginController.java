package com.cpkl.controller;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cpkl.dto.TrevelersDTO;
import com.cpkl.service.LoginService;
import com.cpkl.service.RegisterService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ServiceLoginController {
	@Autowired
	private LoginService logingservice;
	@Autowired
	private RegisterService regservice;
	
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
	public String login_chk(TrevelersDTO dto, HttpSession session) throws JsonProcessingException {
		String result=logingservice.login_chk(dto, session);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(result);
		return strJson;
	}
	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		return "service_login/login";
	}
	
	/* 회원가입 기능 */
	// 이용약관 & 개인정보처리방침 동의 페이지
	@RequestMapping("reg_tos")
	public String reg_tos() {
		return "service_login/reg_tos";
	}
	// 회원가입 페이지
	@RequestMapping("reg")
	public String reg() {
		return "service_login/reg";
	}
	/* 회원가입 유효성 검사 */
	// 이메일 인증코드 보내기
	private String email_code;
	@RequestMapping(value="send_email",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String send_email(@RequestParam(value="email") String useremail) throws Exception {
		email_code=regservice.send_email(useremail);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(email_code);
		return strJson;
	}
	// 이메일 인증코드 확인
	@RequestMapping(value="code_chk",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String code_chk(@RequestParam(value="usercode") String usercode) throws Exception {
		String result=regservice.code_chk(email_code, usercode);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(result);
		return strJson;
	}
	// email 중복 확인
	@RequestMapping(value="email_chk",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String email(@RequestParam(value="email") String email) throws JsonProcessingException {
		String result=regservice.email_chk(email);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(result);
		return strJson;
	}
	// 아이디 중복 확인
	@RequestMapping(value="id_chk",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String id_chk(@RequestParam(value="userid") String userid) throws JsonProcessingException {
		String result=regservice.id_chk(userid);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(result);
		return strJson;
	}
	// 닉네임 중복 확인
	@RequestMapping(value="nick_chk",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String nick_chk(@RequestParam(value="usernick") String usernick) throws JsonProcessingException {
		String result=regservice.nick_chk(usernick);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(result);
		return strJson;
	}
	// 닉네임 중복 확인
	@RequestMapping(value="insert_user",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insert_user(TrevelersDTO dto) throws JsonProcessingException {
		regservice.insert_user(dto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString("회원가입");
		return strJson;
	}
	/* 마이페이지 기능 */
	// 마이페이지 연결
	@RequestMapping("mypage")
	public String mypage() {
		return "service_login/mypage";
	}
	// 회원정보 수정
	@RequestMapping("chageUserInfo")
	public String chageUserInfo() {
		return "service_login/chageUserInfo";
	}
	// 회원탈퇴 페이지
	@RequestMapping("withdrawal")
	public String withdrawal() {
		return "service_login/withdrawal";
	}
	// 회원탈퇴 기능
	@RequestMapping(value="delete_User",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String delete_User(TrevelersDTO dto, HttpSession session) throws JsonProcessingException {
		regservice.delete_User(dto,session);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString("회원가입");
		return strJson;
	}
	
	
}
