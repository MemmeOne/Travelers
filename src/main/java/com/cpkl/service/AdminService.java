package com.cpkl.service;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cpkl.dao.AdminDAO;
import com.cpkl.dto.ReportPostDTO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO dao;

	public void list(HttpSession session) {
		dao.list(session);
	}

	public List<ReportPostDTO> infodelete_chk(String[] result) {
		List<ReportPostDTO> list=dao.infodelete_chk(result);
		return list;
	}

	public List<ReportPostDTO> reviewdelete_chk(String[] result) {
		List<ReportPostDTO> list=dao.reviewdelete_chk(result);
		return list;
	}

	public List<ReportPostDTO> freedelete_chk(String[] result) {
		List<ReportPostDTO> list=dao.freedelete_chk(result);
		return list;
	}

	public List<ReportPostDTO> matedelete_chk(String[] result) {
		List<ReportPostDTO> list=dao.matedelete_chk(result);
		return list;
	}

}
