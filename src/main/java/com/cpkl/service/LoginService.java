package com.cpkl.service;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
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
	// 아이디 찾기. 이메일로 아이디 가져오기
	public String get_id(String useremail) {
		result=dao.get_id(useremail);
		return result;
	}
	// 아이디 찾기. 이메일로 아이디 가져오기
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
				dto.setPwd(code);
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
	// 비밀번호 변경 및 로그아웃
	public String change_pwd_save(TrevelersDTO dto, HttpSession session) {
		dao.change_pwd_save(dto);
		session.removeAttribute("loginUser");
		return null;
	}
}
