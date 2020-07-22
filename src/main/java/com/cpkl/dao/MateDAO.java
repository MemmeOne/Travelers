package com.cpkl.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cpkl.dto.MateDTO;
import com.cpkl.dto.MateReplyDTO;

@Repository
public class MateDAO {
	@Autowired
	@Resource(name="mate_sqlSession")
	private SqlSession mate_sqlsession;

	public MateDAO() {
		System.out.println("mateDAO 생성자");
	}

	public static final String namespace = "com.cpkl.mybatis.mateMapper";
	
	// 게시글 개수
	public int getTotalPage() {
		int tot= mate_sqlsession.selectOne(namespace+".mate_list_totalPage");
		return tot;
	}
	
	// 글 전체 목록
	public List<MateDTO> mate_listall(int page) {
		MateDTO dto=new MateDTO();
		System.out.println("board dao 시간 : "+dto.getSavedate());
		System.out.println("board dao title : "+dto.getTitle());
		HashMap<String , Object> map=new HashMap<String, Object>();
		if(page==1) {
			map.put("start", 1);
			map.put("end", 3);
		} else {
			map.put("start", page*3-2);
			map.put("end", page*3);
		}
		return mate_sqlsession.selectList(namespace + ".mate_listAll",map);
	}
	// 글 전체 목록에서 검색 이거!
//	public List<MateDTO> mate_list_search(int page,String word,String tag) {
		public List<MateDTO> mate_list_search(MateDTO matedto,int page ) {
		HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("start",  page*3-2);
			map.put("end", page*3);
			map.put("word", matedto.getWord());
			map.put("tag", matedto.getTag());
			//map.put("word2", "목");
			
			// 여행 기간
			map.put("mtravel_date_s", matedto.getMtravel_date_s());
			map.put("mtravel_date_e", matedto.getMtravel_date_e());
			
			// 테마
			String[] mthema_box =matedto.getMthema().split(",");
			for(int i=0;i<mthema_box.length;i++) {
				map.put("mthema"+i,mthema_box[i]);
			}
			if(mthema_box.length!=4) {
				for(int i=mthema_box.length;i<4;i++) {
					map.put("mthema"+i,"-");
				}
			}
			// 숙소
			String[] mroom_box =matedto.getMroom().split(",");
				for(int i=0;i<mroom_box.length;i++) {
					map.put("mroom"+i,mroom_box[i]);
				}
				if(mroom_box.length!=4) {
					for(int i=mroom_box.length;i<4;i++) {
						map.put("mroom"+i,"-");
					}
				}
			// 1일 경비
			map.put("price1",matedto.getPrice1());
			map.put("price2",matedto.getPrice2());
			
			// 동행자 성별
			String[] mgender_box =matedto.getMgender().split(",");
				for(int i=0;i<mgender_box.length;i++) {
					map.put("mgender"+i,mgender_box[i]);
				}
				if(mgender_box.length!=4) {
					for(int i=mgender_box.length;i<4;i++) {
						map.put("mgender"+i,"-");
					}
				}
			// 동행자 나이
			String[] mage_box =matedto.getMage().split(",");
			for(int i=0;i<mage_box.length;i++) {
				map.put("mage"+i,mage_box[i]);
			}
			if(mage_box.length!=5) {
				for(int i=mage_box.length;i<4;i++) {
					map.put("mage"+i,"-");
				}
			}
			//-------------------------
			Iterator<String> keys=map.keySet().iterator();
			while(keys.hasNext()) {
				String key=keys.next();
				System.out.println("key : "+key+"\t value : "+map.get(key));
			}
			//-----------------------------
		return mate_sqlsession.selectList(namespace+".mate_search",map );
	}
	
	public int mate_totPageSearch(MateDTO matedto) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("word", matedto.getWord());
		map.put("tag", matedto.getTag());
		//map.put("word2", "목");
		
		// 여행 기간
		map.put("mtravel_date_s", matedto.getMtravel_date_s());
		map.put("mtravel_date_e", matedto.getMtravel_date_e());
		
		// 테마
		String[] mthema_box =matedto.getMthema().split(",");
		for(int i=0;i<mthema_box.length;i++) {
			map.put("mthema"+i,mthema_box[i]);
		}
		if(mthema_box.length!=4) {
			for(int i=mthema_box.length;i<4;i++) {
				map.put("mthema"+i,"-");
			}
		}
		// 숙소
		String[] mroom_box =matedto.getMroom().split(",");
			for(int i=0;i<mroom_box.length;i++) {
				map.put("mroom"+i,mroom_box[i]);
			}
			if(mroom_box.length!=4) {
				for(int i=mroom_box.length;i<4;i++) {
					map.put("mroom"+i,"-");
				}
			}
		// 1일 경비
		map.put("price1",matedto.getPrice1());
		map.put("price2",matedto.getPrice2());
		
		// 동행자 성별
		String[] mgender_box =matedto.getMgender().split(",");
			for(int i=0;i<mgender_box.length;i++) {
				map.put("mgender"+i,mgender_box[i]);
			}
			if(mgender_box.length!=4) {
				for(int i=mgender_box.length;i<4;i++) {
					map.put("mgender"+i,"-");
				}
			}
		// 동행자 나이
		String[] mage_box =matedto.getMage().split(",");
		for(int i=0;i<mage_box.length;i++) {
			map.put("mage"+i,mage_box[i]);
		}
		if(mage_box.length!=5) {
			for(int i=mage_box.length;i<4;i++) {
				map.put("mage"+i,"-");
			}
		}
		

		//-------------------------
		System.out.println("안아작스 dao search ");
		Iterator<String> keys=map.keySet().iterator();
		while(keys.hasNext()) {
			String key=keys.next();
			System.out.println("key : "+key+"\t value : "+map.get(key));
		}
		//-----------------------------
	return mate_sqlsession.selectOne(namespace+".totPageSearch", map);
		
	}
		
		

		
		
	//
//	public List<MateDTO> mate_search(MateDTO matedto, int page) {
//		HashMap<String, Object> map=new HashMap<String, Object>();
//			map.put("start",  page*3-2);
//			map.put("end", page*3);
//			map.put("word", matedto.getWord());
//			map.put("word2", "목");
//			map.put("tag", matedto.getTag());
//			//map.put("mtravel_date", matedto.getMtravel_date());
//			//-------------------------
//			System.out.println("아작스 dao mate_search  ");
//			Iterator<String> keys=map.keySet().iterator();
//			while(keys.hasNext()) {
//				String key=keys.next();
//				System.out.println("key : "+key+"\t value : "+map.get(key));
//			}
//			//-----------------------------
//		return mate_sqlsession.selectList(namespace+".mate_search",map );
//	}
	// 글 내용 보기
//	public List<MateDTO> mate_content_viewdao(int num) {
//	public List<MateDTO> mate_content_view(String num) {
	public MateDTO mate_content_viewdao(int num) {
	System.out.println("mate_content_viewdao dao ");
	mate_sqlsession.update(namespace+".mate_board_uphit", num);
	return mate_sqlsession.selectOne(namespace + ".mate_content_view", num);
}


//	public void mate_write_save(String title, String content, String nick,Timestamp savedate) {
	public void mate_write_save(MateDTO matedto) {
//	public void mate_write_save(String title, String content, String nick) {
		mate_sqlsession.insert(namespace + ".mate_write_save", matedto);
	}
	// 댓글 리스트
	public List<MateReplyDTO> mate_reply_list_1(int bnum) {
		List<MateReplyDTO> dto=new ArrayList<MateReplyDTO>();
		dto=mate_sqlsession.selectList(namespace+".mate_reply_select" );
		for(MateReplyDTO e:dto) {
			System.out.println("dao 시간 : "+e.getSavetime());
			System.out.println("dao  닉  : "+e.getNick());
		}
		return mate_sqlsession.selectList(namespace+".mate_reply_select" );
	}

	// 동행 모집 마감으로 전환
		public void deadline_finish(MateDTO matedto) {
			mate_sqlsession.update(namespace+".deadline_finish",matedto);
		}
		
		//--------------------------------------------------------
		public void mate_reply_save(MateReplyDTO mreplydto) {
			System.out.println("reply dao");
			 mate_sqlsession.insert(namespace+".mate_reply", mreplydto);
		}
		//--------
//		public void mate_reply_regi01(MateReplyDTO dto) {
//			System.out.println("dao mate_reply_regi");
//			mate_sqlsession.insert(namespace+".mate_reply",  dto);
//		}
		// 이거! 댓글 저장!
		public void mate_reply_regi02(MateReplyDTO mateReplydto) {
			System.out.println("dao mate_reply_regi02");
			mate_sqlsession.update(namespace+".mate_replyShape",mateReplydto);
			mate_sqlsession.insert(namespace+".mate_reply",  mateReplydto);
		}
		// 댓글 목록 보여주기
		public List<MateReplyDTO> mate_reply_list(int bnum) {
			System.out.println("dao mate_reply_list bnum : "+bnum);
			return mate_sqlsession.selectList(namespace+".mate_reply_select",bnum);
		}
		// 댓글 수정
		public void mate_reply_modify_save(MateReplyDTO mateReplydto) {
			mate_sqlsession.update(namespace+".mate_reply_modify_save", mateReplydto);
		}
		//댓글 삭제
		public void mate_reply_delete(MateReplyDTO mateReplydto) {
			mate_sqlsession.delete(namespace+".mate_reply_delete",mateReplydto);
		}
		
		// 글 수정
		public void mate_content_modify_update(MateDTO dto, int num) {
			mate_sqlsession.update(namespace+".mate_content_modify", dto);
		}
		//--------글 삭제
		public void mate_content_delete( int num) {
//			System.out.println("delete dao bnum : "+ mateReplydto.getBnum());
//			System.out.println("delete dao rnum : "+ mateReplydto.getRnum());
			mate_sqlsession.delete(namespace+".mate_write_delete",num );
		}
		// 대댓글 저장
		public void mate_reply_reply_save(MateReplyDTO mateReplydto) {
			System.out.println("dao 대댓 step :"+mateReplydto.getStep());
			mate_sqlsession.insert(namespace+".mate_reply_reply_save", mateReplydto);
		}
}
