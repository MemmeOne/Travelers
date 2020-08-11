package com.cpkl.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cpkl.dao.MateDAO;
import com.cpkl.dto.MateCalDTO;
import com.cpkl.dto.MateDTO;
import com.cpkl.dto.MateReplyDTO;
@Service
public class MateService   {
	@Autowired
	private MateDAO matedao;
	
	// 글 전체 목록
	public void mate_board_list(Model model, int page) { // 글 목록 list 출력
		MateDTO dto=new MateDTO();
		System.out.println("board ser 시간 : "+dto.getSavedate());
		System.out.println("board ser title : "+dto.getTitle());
		
		model.addAttribute("mate_list_all", matedao.mate_listall(page));
		model.addAttribute("totPage", matedao.getTotalPage());
		model.addAttribute("commentcount", matedao.commentCount());
		model.addAttribute("commentcount2", matedao.commentCount2());
		
	}
	// 글 전체 목록에서 검색 이거!
//	public void mate_list_search(Model model,int page,String word,String tag) {
		public void mate_list_search(MateDTO matedto,Model model,int page ) {
		//System.out.println("안아작스 ");
		//System.out.println("s search word : "+word);
//		model.addAttribute("mate_list_search", matedao.mate_list_search(page,word,tag ));
		model.addAttribute("mate_list_search", matedao.mate_list_search( matedto,page ));
		model.addAttribute("totPage", matedao.mate_totPageSearch(matedto));
		model.addAttribute("word", matedto.getWord());
		model.addAttribute("tag", matedto.getTag());
		model.addAttribute("mtravel_date_s", matedto.getMtravel_date_s());
		model.addAttribute("mtravel_date_e", matedto.getMtravel_date_e());
		model.addAttribute("mthema",matedto.getMthema());
		model.addAttribute("mroom",matedto.getMroom());
		model.addAttribute("price1",matedto.getPrice1());
		model.addAttribute("price2",matedto.getPrice2());
		model.addAttribute("mgender",matedto.getMgender());
		model.addAttribute("mage",matedto.getMage());
		model.addAttribute("commentcount2", matedao.commentCount2());
		
//		return matedao.mate_listall(page);
	}
	
//	public void mate_search(Model model,MateDTO matedto, int page) {
//	System.out.println("아작스 s search word : "+matedto.getWord());
//		model.addAttribute("mate_search", matedao.mate_search( matedto, page ));
//	}
	
//	public void mate_write_save(String title, String content, String nick,Timestamp savedate) {
//	matedao.mate_write_save(title, content, nick, savedate);
		// 글 쓰기 저장
//		public void mate_write_save(String title, String content, String nick) {
		public void mate_write_save(MateDTO matedto) { // 작성한 글 저장
//		matedao.mate_write_save(title, content, nick);
		matedao.mate_write_save(matedto);
	}
	

	public void mate_cal(MateCalDTO dto) {
		System.out.println("달력 서비스");
		matedao.mate_cal(dto);
	}
	public List<MateDTO> mate_cal2(MateDTO dto  ) {
		List<MateDTO> list=matedao.mate_list_for_cal(dto);
		System.out.println("===s서비스ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡdfasdfasdfa sdf asd fasd=adslfksj");
		System.out.println(list);
		System.out.println(list.get(0).getContent());
		//model.addAttribute("mate_list_for_cal", list);
		//matedao.mate_list_for_cal(dto);
		return list;
	} 
	public void mate_cal_list(MateCalDTO dto) {
		matedao.mate_cal_list(dto);
	}

		
	// 글 내용 조회
	public void mate_content_viewser(Model model, int num ) {
		//Map<String, Object> map=model.asMap();
		//int num=(Integer)map.get("paramnum");
//		String num=(String)map.get("paramnum");
		System.out.println("service num : "+num);
		model.addAttribute("ccc", matedao.mate_content_viewdao(num));
		model.addAttribute("mate_reply_list", matedao.mate_reply_list(num));
		
		model.addAttribute("mate_comment_list",matedao.comment_list(num));
		model.addAttribute("commentcount2", matedao.commentCount2());
		//model.addAttribute("mate_reply_select", matedao.mate_reply_regi02(num));
	}
	public void deadline_finish(MateDTO matedto) {
		matedao.deadline_finish(matedto);
		
	}
	
	// 글 수정
	public void mate_content_modify_update(MateDTO dto, int num) {
		System.out.println("내용 수정 서비스");
		matedao.mate_content_modify_update( dto, num);
	}
	
	// 글 삭제
	public void mate_content_delete( int num) {
		 matedao.mate_content_delete(num);
	}
}
