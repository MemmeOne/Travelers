package com.cpkl.service;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.cpkl.dao.ServiceLoginDAO;
import com.cpkl.dto.EmailDTO;
import com.cpkl.dto.TrevelersDTO;

@Service
public class LoginService {
	@Autowired
	private ServiceLoginDAO dao;
	private String result;
	@Autowired
	private EmailSender emailSender;
	@Inject
	PasswordEncoder passwordEncoder;
	
	private Map<String, HttpSession> sessions = new HashMap<String, HttpSession>();

	// 로그인
	public String login_chk(TrevelersDTO dto, HttpSession session) {
		TrevelersDTO dtoresult=dao.login_chk(dto.getId());
		if (dtoresult!=null) {
			if(passwordEncoder.matches(dto.getPwd(), dtoresult.getPwd())) {
				if(sessions.get(dto.getId()) == null) {
					result=dto.getId();
					session.setAttribute("loginUser", dtoresult);
					sessions.put(dto.getId(), session);
				}else {
					sessions.get(dto.getId()).invalidate();
					sessions.remove(dto.getId());
					result=dto.getId();
					session.setAttribute("loginUser", dtoresult);
				}
			}else {
				result="비밀번호가 틀렸습니다!";
			}
		}else {
			result="없는 아이디 입니다!";
		}
		return result;
	}
//	public String login_chk(TrevelersDTO dto, HttpSession session) {
//		TrevelersDTO dtoresult=dao.login_chk(dto.getId());
//		if (dtoresult!=null) {
//			if(passwordEncoder.matches(dto.getPwd(), dtoresult.getPwd())) { //암호화 안된게 앞
//				System.out.println("비밀번호 일치");
//				session.setAttribute("loginUser", dtoresult);
//				result=dto.getId();
//	        }else {
//	        	result="비밀번호가 틀렸습니다!";
//	        }
//		} else
//			result="없는 아이디 입니다!";
//		return result;
//	}
	// 아이디 찾기. 이메일로 아이디 가져오기
	public String get_id(String useremail) {
		result=dao.get_id(useremail);
		return result;
	}
	// 비밀번호 찾기. 이메일로 임시비밀번호 발급
	public String send_pwd(TrevelersDTO dto) {
		result=dao.get_pwd(dto);
		if (result.equals("아이디없음")) {
			result="아이디없음";
			return result;
		}else {
			//인증코드 생성
			char[] characterTable =  { //62개
					'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 
					'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
					'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
					'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 
					'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };
			int[] num=new int[8];
			String code="";
			for(int n:num) {
				n = (int) ( Math.random() * 62 );
				code+=characterTable[n];
			}
			EmailDTO email = new EmailDTO();
			String reciver = dto.getEmail(); //유저가 입력한 이메일
			String subject = "[Travelers] 임시 비밀번호 전송";
			String content = "<div style='display: inline-block; width: 500px; margin: 0 auto; font-size: 14px; border-top: 1px solid #a5a1a0; "
					+"border-bottom: 1px solid #a5a1a0; padding: 5px 0; font-size: 30px;'> Trevelers </div>"
					+"<div style='padding: 10px 0 25px 0; font-size: 15px; color: #221815; letter-spacing: 0;'> Authentication code : </div>"
					+"<div style='font-size: 20px; color: #221815; letter-spacing: 0;'><b>"+code+"</b></div><br>"
					+"<a href='http://localhost:8895/controller/login'>로그인 페이지 바로가기</a>";
			email.setReciver(reciver);
			email.setSubject(subject);
			email.setContent(content);
			try {
				emailSender.SendEmail(email);
				dto.setPwd(security(code));
				dao.update_pwd(dto);
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
			return code;
		}
	}
	// 회원 정보 수정
	public void update_user(TrevelersDTO dto, HttpSession session) {
		dao.update_user(dto);
		TrevelersDTO dtoresult=dao.change_session_value(dto.getId());
		session.setAttribute("loginUser", dtoresult);
	}
	// 회원 탈퇴
	public void delete_User(TrevelersDTO dto, HttpSession session) {
		dao.delete_User(dto);
		session.removeAttribute("loginUser");
	}
	// 비밀번호 변경 및 로그아웃
	public String change_pwd_save(TrevelersDTO dto, HttpSession session) {
		try {
			TrevelersDTO dtoresult=dao.login_chk(dto.getId());
			if(passwordEncoder.matches(dto.getPwd(), dtoresult.getPwd())) { //암호화 안된게 앞
				result="기존 비밀번호입니다.\n다른 비밀번호를 입력해주세요.";
	        }else {
				dto.setPwd(security(dto.getPwd()));
	        	result="비밀번호를 변경했습니다.";
	        	dao.change_pwd_save(dto);
				session.removeAttribute("loginUser");
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// 비밀번호 암호화
	public String security(String pwd) throws Exception {
		String encPassword = passwordEncoder.encode(pwd);
		return encPassword;
	}
	// 본인확인을 위한 비밀번호 체크 페이지
	public String chk_dbpwd(TrevelersDTO dto) {
		TrevelersDTO dtoresult=dao.login_chk(dto.getId());
		if(passwordEncoder.matches(dto.getPwd(), dtoresult.getPwd())) { //암호화 안된게 앞
			System.out.println("비밀번호 일치");
			result=dto.getId();
        }else {
        	result="비밀번호가 틀렸습니다!";
        }
		return result;
	}
}
