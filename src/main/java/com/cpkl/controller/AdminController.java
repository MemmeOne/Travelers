package com.cpkl.controller;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cpkl.dto.PackageDTO;
import com.cpkl.dto.ReportPostDTO;
import com.cpkl.service.AdminService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	@RequestMapping("admin_page")
	public String admin_page() {
		return "admin/admin_page";
	}
	@RequestMapping("notice_event")
	public String notice_event() {
		return "admin/notice_event";
	}
	@RequestMapping("report_post")
	public String report_post(HttpSession session) {
		service.list(session);
		return "admin/report_post";
	}
	@RequestMapping(value="infodelete_chk",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String infodelete_chk(@RequestParam(value="result") String[] result) throws Exception {
		List<ReportPostDTO> list=service.infodelete_chk(result);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	@RequestMapping(value="reviewdelete_chk",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String reviewdelete_chk(@RequestParam(value="result") String[] result) throws Exception {
		List<ReportPostDTO> list=service.reviewdelete_chk(result);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	@RequestMapping(value="freedelete_chk",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String freedelete_chk(@RequestParam(value="result") String[] result) throws Exception {
		List<ReportPostDTO> list=service.freedelete_chk(result);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	@RequestMapping(value="matedelete_chk",method=RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public String matedelete_chk(@RequestParam(value="result") String[] result) throws Exception {
		List<ReportPostDTO> list=service.matedelete_chk(result);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	
	/* 여행패키지 */
	// 여행패키지 리스트
	@RequestMapping("package_list")
	public String package_list(HttpSession session ) {
		service.package_list(session);
		return "package/package_list";
	}
	// 여행패키지 글 보기
	@RequestMapping("package_post")
	public String package_post(int num,HttpSession session) {
		
		return "package/package_post";
	}
	// 여행패키지 글 쓰기
	@RequestMapping("package_write")
	public String package_write() {
		return "package/package_write";
	}
	// 여행패키지 글 쓰기
	@RequestMapping("package_save")
	public String package_save(PackageDTO dto) {
		System.out.println("컨트롤러");
		String s=dto.getStart_date().replace("T", " ");
		String e=dto.getEnd_date().replace("T", " ");
		dto.setStart_date(s);
		dto.setEnd_date(e);
		//int result=service.package_save(dto);
		service.package_save(dto);
		return "redirect:package_list";
//		if(result==1) {
//			//return "redirect:package_list";
//		}else {
//			//return "redirect:package_write";
//		}
	}
	@RequestMapping("p_write")
	public String p_write(PackageDTO dto) {
		return "package/p_write";
	}
	
	@RequestMapping("p_save") 
		public String p_save(PackageDTO dto) {
		System.out.println("컨트롤러");
		System.out.println("title="+dto.getTitle());

			service.package_save(dto);
			return "package/package_list"; 
		}
	 
	
	// 결제 페이지
	@RequestMapping("payment")
	public String payment(HttpSession session) {
		return "package/payment";
	}
	// 결제 popup - 이니시스 결제창
	@RequestMapping("pay_popup")
	public String pay_popup(HttpSession session) {
		return "package/pay_popup";
	}
	
	
	@RequestMapping("testcard")
	public String testcard(HttpSession session) {
		service.list(session);
		return "package/test";
	}
}
