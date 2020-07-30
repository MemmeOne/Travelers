package com.cpkl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cpkl.dto.MateReplyDTO;
import com.cpkl.service.MateReplyService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MateReplyController {

	
	
	
	
	
//	public String mate_board_reply(MateReplyDTO mate_reply_dto) {
//		return mate_reply_dto.getNum()+" : "+mate_reply_dto.getNick()+" : "+mate_reply_dto.getReply();
//	}
}
