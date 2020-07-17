package com.cpkl.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cpkl.dao.MateDAO;
import com.cpkl.dto.MateReplyDTO;

@Service
public class MateReplyService {
	@Autowired
	private MateDAO matedao;
	public void mate_reply_save(MateReplyDTO mreplydto) {
		matedao.mate_reply_save(mreplydto);
	}
	//-----------
//	public void mate_reply_regi(MateReplyDTO dto) {
//		matedao.mate_reply_regi01(dto);
//	}
	// 이거 댓글 저장
	public List<MateReplyDTO> mate_reply_regi02(MateReplyDTO mateReplydto){
		matedao.mate_reply_regi02(mateReplydto);
		return matedao.mate_reply_list(mateReplydto.getBnum());
	}
	
	// 댓글 수정
	public List<MateReplyDTO> mate_reply_modify_save(MateReplyDTO mateReplydto) {
		matedao.mate_reply_modify_save(mateReplydto);
		return matedao.mate_reply_list(mateReplydto.getBnum());
	}
	
	// 댓글 삭제
	public List<MateReplyDTO> mate_reply_delete(MateReplyDTO mateReplydto  ) {
		matedao.mate_reply_delete(mateReplydto );
		return matedao.mate_reply_list(mateReplydto.getBnum());
	}
	
	public void mate_reply_list_1(  Model model, int bnum) {
		List<MateReplyDTO> dto=new ArrayList<MateReplyDTO>();
		dto=matedao.mate_reply_list_1(bnum);
		for(MateReplyDTO e:dto) {
			System.out.println("ser 시간 : "+e.getSavetime());
			System.out.println("ser  닉  : "+e.getNick());
		}
		model.addAttribute("aa", dto);
	}
	
	// 대댓글 저장
	public List<MateReplyDTO> mate_reply_reply_sav(MateReplyDTO mateReplydto) {
		matedao.mate_reply_reply_save(mateReplydto);
		return matedao.mate_reply_list(mateReplydto.getBnum());
	}
	
//	public List<MateReplyDTO>  mate_reply_list(MateReplyDTO mateReplydto, int num)  {
//		List<MateReplyDTO> list=matedao.mate_reply_list(mateReplydto,0);
//		return list;
//		
//		
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
