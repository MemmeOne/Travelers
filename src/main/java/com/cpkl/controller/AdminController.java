package com.cpkl.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
