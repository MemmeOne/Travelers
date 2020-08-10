package com.cpkl.service;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cpkl.dao.AdminDAO;
import com.cpkl.dto.PackageDTO;
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
	
	/* 여행패키지 */
	// 여행패키지 리스트
	public void package_list(HttpSession session) {
		List<PackageDTO> list=dao.package_list();
		session.setAttribute("package_list", list);
	}

//	public int package_save(PackageDTO dto) {
//		int result=dao.package_save(dto);
//		return result;
//	}
	public void package_save(PackageDTO dto) {
		System.out.println("서비스");
		 dao.package_save(dto);
	}

}
