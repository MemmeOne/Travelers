package com.cpkl.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cpkl.dao.MateDAO;
import com.cpkl.dto.MateDTO;
import com.cpkl.dto.MateReplyDTO;
@Service
public class MateService   {
	@Autowired
	private MateDAO matedao;
	// 글 목록
	public void mate_board_list(Model model, int page) { // 글 목록 list 출력
		MateDTO dto=new MateDTO();
		System.out.println("board ser 시간 : "+dto.getSavedate());
		System.out.println("board ser title : "+dto.getTitle());
		
		model.addAttribute("mate_list_all", matedao.mate_listall(page));
		model.addAttribute("totPage", matedao.getTotalPage());
	
	}
	
	public void mate_list_search(Model model,int page,String word,String tag) {
		System.out.println("s search word : "+word);
		model.addAttribute("mate_list_search", matedao.mate_list_search(page,word,tag ));
	}
	
//	public void mate_write_save(String title, String content, String nick,Timestamp savedate) {
//	matedao.mate_write_save(title, content, nick, savedate);
		// 글 쓰기 저장
//		public void mate_write_save(String title, String content, String nick) {
		public void mate_write_save(MateDTO matedto) { // 작성한 글 저장
//		matedao.mate_write_save(title, content, nick);
		matedao.mate_write_save(matedto);
	}
	
	// 글 내용 보기
	public void mate_content_viewser(Model model, int num ) {
		//Map<String, Object> map=model.asMap();
		//int num=(Integer)map.get("paramnum");
//		String num=(String)map.get("paramnum");
		System.out.println("service num : "+num);
		model.addAttribute("ccc", matedao.mate_content_viewdao(num));
		model.addAttribute("mate_reply_list", matedao.mate_reply_list(num));
		//model.addAttribute("mate_reply_select", matedao.mate_reply_regi02(num));
	}
	public void deadline_finish(MateDTO matedto) {
		matedao.deadline_finish(matedto);
		
	}
	
	// 글 수정
	public void mate_content_modify_update(MateDTO dto, int num) {
		matedao.mate_content_modify_update( dto, num);
	}
	
	// 글 삭제
	public void mate_content_delete( int num) {
		 matedao.mate_content_delete(num);
	}
}
