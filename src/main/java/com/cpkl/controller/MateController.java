package com.cpkl.controller;

import java.sql.Date;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.tag.el.sql.DateParamTag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cpkl.dto.MateDTO;
import com.cpkl.dto.MateReplyDTO;
import com.cpkl.service.MateReplyService;
import com.cpkl.service.MateService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MateController {
	@Autowired
	private MateService mateSer;
	@Autowired
	private MateReplyService mateReplySer;
	
	@RequestMapping("list")
	public String list() {
		return "defualt/list";
	}
	@RequestMapping("write")
	public String write() {
		return "defualt/write";
	}
	@RequestMapping("post")
	public String post() {
		return "defualt/post";
	}

 

	// 글 전체 목록 보기
	@RequestMapping("mate_board_list")
	public String mate_board_listAll(Model model, @RequestParam int page,HttpServletRequest request) {
		// 닉, 관리자 세션 설정
		HttpSession session=request.getSession();
		session.setAttribute("loginGender", "무");
		session.setAttribute("loginAge", 20);
		session.setAttribute("loginNick", "testnick2");
		//session.setAttribute("loginNick", "testnick2");
		//session.setAttribute("admin", "관리자");
		MateDTO dto=new MateDTO();
		System.out.println("board con 시간 : "+dto.getSavedate());
		System.out.println("board con title : "+dto.getTitle());
		mateSer.mate_board_list(model,page);
		return "mate_board/mate_board_list";
	}
	
	// 글 전체 목록에서 검색 이거!
	@RequestMapping("mate_list_search")
	public String mate_list_search(Model model, @RequestParam int page,
			@RequestParam String word, @RequestParam String tag,  
			@RequestParam String mthema,  @RequestParam String mroom, 
			// @RequestParam ArrayList<String> mroom_arr,
			@RequestParam String mgender,  @RequestParam String mage,
//			@RequestParam @DateTimeFormat(pattern="yyyy-MM-dd") Date mtravel_date_s,@RequestParam  @DateTimeFormat(pattern="yyyy-MM-dd") Date mtravel_date_e) {
		@RequestParam  String mtravel_date_s, @RequestParam  String mtravel_date_e,
		@RequestParam int price1, @RequestParam int price2
		
			) throws ParseException {
//		public String mate_list_search(MateDTO matedto,Model model, @RequestParam int page,@RequestParam String word, @RequestParam String tag ) {
//		public String mate_list_search(@RequestParam MateDTO data,Model model, @RequestParam int page  ) {
//		public String mate_list_search(    ) {
//		public String mate_list_search(Model model) {
		System.out.println("안아작스 c");
		//for(String x:mroom_arr) {
		//	System.out.println(x);
		//}
//		System.out.println("c word :"+data.getWord());
//		System.out.println("c tag :"+data.getTag());
		//System.out.println("c search word : "+word);
		//System.out.println(mtrave_date);
		//System.out.println("c search travel date :"+matedto.getMtravel_date());
		MateDTO matedto=new MateDTO();
		matedto.setTag(tag);
		matedto.setWord(word);
		//mthema=mthema.replaceAll(",", "%");
		matedto.setMthema(mthema);
		matedto.setMroom(mroom);
		matedto.setMgender(mgender);
		matedto.setMage(mage);
		matedto.setPrice1(price1);
		matedto.setPrice2(price2);
		//System.out.println("mroom_box :"+mroom_box);
		
		// 날짜=========
		System.out.println("mtravel_date_s :"+mtravel_date_s);
		System.out.println("mtravel_date_e :"+mtravel_date_e);
		SimpleDateFormat trans=new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date_s=trans.parse(mtravel_date_s);
		java.util.Date date_e=trans.parse(mtravel_date_e);
		Date sql_date_s = new Date(date_s.getTime());
		Date sql_date_e = new Date(date_e.getTime());
		System.out.println("mtravel_date_s 변환후:"+sql_date_s);
		matedto.setMtravel_date_s(sql_date_s);
		matedto.setMtravel_date_e(sql_date_e);
		// 날짜=========
		
		mateSer.mate_list_search(matedto,model,page );
		//mateSer.mate_list_search( data,model,page );
		//mateSer.mate_search(model,  matedto, page);
		return "mate_board/mate_list_search";
	}
	
//	@RequestMapping("mate_list_search")
//	public String mate_list_search_page(Model model,MateDTO matedto,  @RequestParam int page,@RequestParam String word, @RequestParam String tag) {
//		return "mate_board/mate_list_search";
//	}
	
	//  글 전체 목록에서 검색 이거! 아작스 받아오는 것
	@RequestMapping(value="mate_search",  produces="application/json;charset=utf-8")
	@ResponseBody
	//public String mate_search(Model model,MateDTO matedto, @RequestParam String word, @RequestParam String tag) throws JsonProcessingException {
		public String mate_search(Model model,MateDTO matedto ) throws JsonProcessingException {
		int page=1;
		String word=matedto.getWord();
		String tag=matedto.getTag();
		//List<MateDTO> list=mateSer.mate_list_search( matedto, model, page);
		System.out.println("아작스 c mate search");
		System.out.println("page :"+page);
		System.out.println("word :"+word);
		System.out.println("tag :"+tag);
		System.out.println("m_travel date_s :"+matedto.getMtravel_date_s());
		
		//for(String x:matedto.getMgender_arr() ) {
		//	System.out.println(x);
		//}
//		System.out.println("model :"+model);
		ObjectMapper mapper=new ObjectMapper();
		String s="";
		String strJson=mapper.writeValueAsString(s);
		return strJson;
		
	}

	// 글 쓰기 창 띄워주기
	@RequestMapping("mate_write_view")
	public String mate_write_view(HttpSession session) {
		String n=(String)session.getAttribute("loginNick");
		System.out.println("로그인 닉 : "+n);
		ArrayList<String> test=new ArrayList<String>();
		test.add("가");
		test.add("나");
		for(int i=0;i<test.size();i++) {
			System.out.println(test.get(i));
		}
		return "mate_board/mate_write_view";
	}
	
	
//	@RequestMapping(value="mate_write_chk",  produces="application/json;charset=utf-8")
//	@ResponseBody
//	public String mate_write_chk(MateDTO matedto,HttpSession session,@RequestParam ArrayList<String> mthema) throws JsonProcessingException {
//		ObjectMapper mapper=new ObjectMapper();
//		String strJson=mapper.writeValueAsString(matedto);
//		return strJson;
//	}
	
	// 글 쓰기 저장
	@RequestMapping(value="mate_write_save",  produces="application/json;charset=utf-8")
	@ResponseBody
	public String mate_write_save(MateDTO matedto,HttpSession session ) throws JsonProcessingException {
		System.out.println("c write save 시작");
//		System.out.println("mroom : "+mroom);
//		ArrayList<String> th=new ArrayList<String>();
//		String ma="";
//		for(String x:mthema) {
//			ma+=x;
//			System.out.println(x);
//		}
//		for(int i=0;i<mthema.length;i++) {
//			th.add(mthema[i]);
//			ma+=mthema[i];
//		}
//		matedto.setMthema(ma);
//		System.out.println("ma ="+ma);
		//System.out.println("mtravel_date : "+mtravel_date);
		//System.out.println("mgender "+mgender);
		//System.out.println(matedto.getMgender());
		//System.out.println(matedto.getMroom());
		//matedto.setNick((String)session.getAttribute("loginNick"));
		//System.out.println("글쓰기 닉 "+matedto.getNick());
		//dto.setNum((Integer)session.getAttribute("bnum"));
		//System.out.println("글작성  여행 테마 넘겨받기 "+thema); // 휴양,맛집 탐방
		//System.out.println("글작성  여행 기간 시작 넘겨받기 "+travel_date_s); //2020-07-06

		//dto.setNum((Integer)session.getAttribute("bnum"));
//	public String mate_write_save(@RequestParam String title,@RequestParam String content,@RequestParam String nick, Timestamp savedate) {
//		public String mate_write_save(@RequestParam String title,HttpServletRequest request,@RequestParam String nick) {
//		public String mate_write_save(HttpServletRequest request) {
//		String title=request.getParameter("title");
//		String content=request.getParameter("content");
//		String nick=request.getParameter("nick");
//		MateDTO dto=new MateDTO();
//		dto.setTitle(title);
//		dto.setContent(content);
//		dto.setNick(nick);
//		System.out.println("num : "+dto.getNum());
//		System.out.println("title : "+dto.getTitle()); 
//		System.out.println("content : "+dto.getContent());
//		System.out.println("nick : "+dto.getNick());
//		System.out.println("savedate : "+dto.getSavedate());
//		System.out.println("hit : "+dto.getHit());
//		System.out.println("ngroup : "+dto.getNgroup());
//		System.out.println("step : "+dto.getStep());
//		System.out.println("indent : "+dto.getIndent());
	
		matedto.setWnick((String)session.getAttribute("loginNick"));
		matedto.setWgender((String)session.getAttribute("loginGender"));
		matedto.setWage((Integer)session.getAttribute("loginAge"));
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(matedto);
		if(matedto.getWrite_save_ok()==1) {
		mateSer.mate_write_save(matedto );
		}  
		return strJson;
//		mateSer.mate_write_save(title, content, nick );
		//return "mate_board_list?page=1";
	}
	
//	// 글 쓴 것 저장 (non-ajax, 조건 검사 안됨)
//	@RequestMapping(value="mate_write_save00" )
//	public String mate_write_save00(MateDTO matedto,HttpSession session ) {
//		 
//		matedto.setWnick((String)session.getAttribute("loginNick"));
//		matedto.setWgender((String)session.getAttribute("loginGender"));
//		matedto.setWage((Integer)session.getAttribute("loginAge"));
//		mateSer.mate_write_save(matedto );
//		return "redirect:mate_board_list?page=1";
//	}


	// 글 내용 조회 (상세보기?)
	@RequestMapping("mate_content_view")
//	public String mate_content_viewc(Model model,@RequestParam int num, MateReplyDTO mreplydto ) {
	public String mate_content_viewc(Model model,@RequestParam int num, HttpServletRequest request) {
//		public String mate_content_view(Model model,@RequestParam String num ) {
		System.out.println("컨트롤러 mate_content_view NUM : "+num);
		//model.addAttribute("paramnum", num);
		HttpSession session=request.getSession();
		session.setAttribute("bnum", num);
		mateSer.mate_content_viewser(model,num);
		MateReplyDTO mateReplydto =new MateReplyDTO();
		mateReplydto.setBnum(num);
		System.out.println("c mate_content_view getBnum: "+mateReplydto.getBnum());
		// mateReplySer.mate_reply_list_1(  model, 0);
		//mateReplySer.mate_reply_save(mreplydto);
		return "mate_board/mate_content_view";
	}
	
	// 동행 글 마감(완료)으로 바꾸기
	@RequestMapping(value="deadline_finish",method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public String deadline_finish(MateDTO matedto) throws JsonProcessingException {
		String d= matedto.getDeadline();
		mateSer.deadline_finish(matedto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(d);
		return strJson;
		
	}
	@RequestMapping("deadline")
	public String mate_content_view(HttpSession session, RedirectAttributes redirect) {
		MateDTO matedto=new MateDTO();
		matedto.setNum((Integer)session.getAttribute("bnum"));
		matedto.setDeadline("완료");
		mateSer.deadline_finish(matedto);
		redirect.addAttribute("num", matedto.getNum());
		return "redirect:mate_content_view";
	}
	
	
	@RequestMapping("mate_content_modify")
	public String mate_content_modify(Model model,HttpSession session ) {
		MateDTO dto=new MateDTO();
		int num=((Integer)session.getAttribute("bnum"));
		mateSer.mate_content_viewser( model, num  );
		return "mate_board/mate_content_modify";
	}
	
	
//	@RequestMapping("mate_content_modify_update")
//	public String mate_content_modify_update(MateDTO dto,HttpSession session)    {
	//return "redirect:mate_content_view?num="+dto.getNum() ;
		@RequestMapping(value="mate_content_modify_update",  produces="application/json;charset=utf-8")
		@ResponseBody
		public String mate_content_modify_update(MateDTO dto,HttpSession session) throws JsonProcessingException {
		dto.setNum((Integer)session.getAttribute("bnum"));
		mateSer.mate_content_modify_update(dto,dto.getNum() ); 
		System.out.println("c mate content modify update num getNum : "+dto.getNum());
		System.out.println("mtravel_date_s "+dto.getMtravel_date_s());
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(dto);
		return strJson;
		
	}
	
	// 글 삭제
	@RequestMapping("mate_content_delete")
	public String mate_content_delete(Model model,@RequestParam int num) {
		//int num=Integer.parseInt(num);
		
		System.out.println("c mate_content_delete requestparam rnum : "+num);
		mateSer.mate_content_delete( num);
		return "redirect:mate_board_list?page=1";
	}
	
	
	
	// 댓글 저장
	@RequestMapping(value="mate_reply_save",method=RequestMethod.POST, produces="application/json;charset=utf-8")
//	@RequestMapping(value="mate_comment", produces="application/json;charset-utf-8")
	@ResponseBody
//	public void methodddd(@RequestParam int bnum, @RequestParam int rnum, @RequestParam String nick, @RequestParam String reply,MateReplyDTO mrdto ) {
//	public void mate_reply_regi02( @RequestParam String nick, @RequestParam String reply,MateReplyDTO mrdto ) {
//	public String mate_reply_regi02( @RequestParam Map<String , Object> param ) throws JsonProcessingException {
//		public String mate_reply_regi02(MateReplyDTO mateReplydto ) throws JsonProcessingException {
 		public String mate_reply_regi02( MateReplyDTO mateReplydto, HttpSession session) throws JsonProcessingException  {
//		System.out.println("====methodddd====");
//		
//		String nick=(String)param.get("nick");
//		String reply=(String)param.get("reply");
//		System.out.println("nick : "+nick);
//		System.out.println("reply : "+reply);
//		
//		MateReplyDTO mateReplydto=new MateReplyDTO();
//		mateReplydto.setNick(nick);
//		mateReplydto.setReply(reply);
////		System.out.println("nick : "+mateReplydto.getNick());
////		System.out.println("reply : "+mateReplydto.getReply());
//		mateReplySer.mate_reply_regi02(mateReplydto);
		
		//-----------------------------
		
//		MateReplyDTO mateReplydto=new MateReplyDTO();
//		mateReplydto.setNick(nick);
//		mateReplydto.setReply(reply);
		System.out.println("댓글 저장 c");
		mateReplydto.setBnum((Integer)session.getAttribute("bnum"));
		mateReplydto.setNick((String)session.getAttribute("loginNick"));
		//System.out.println("컨트롤러 댓글 저장 rgroup : "+mateReplydto.getRgroup());
//		System.out.println("c bnum : "+mateReplydto.getBnum());
//		System.out.println("c rnum 전 : "+mateReplydto.getRnum());
//		int rnum=mateReplydto.getRnum();
//		mateReplydto.setRnum(rnum+1);
//		System.out.println("c rnum 후: "+mateReplydto.getRnum());
		List<MateReplyDTO> list=mateReplySer.mate_reply_regi02(mateReplydto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
		//return mateReplydto.getNick()+"\t"+mateReplydto.getReply();
		
//		mateReplydto.setBnum(bnum);
//		mateReplydto.setRnum(rnum);
//		System.out.println("bnum : "+bnum);
//		System.out.println("rnum : "+rnum);
//		mateReplydto.setNick(nick);
//		mateReplydto.setReply(reply);
//		System.out.println("nick : "+nick);
//		System.out.println("reply : "+reply);
//		mateReplySer.mate_reply_regi(mateReplydto);
	}
	
	
	
	
	// 댓글 수정
	@RequestMapping(value="mate_reply_modify_save", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String mate_reply_modify_save(MateReplyDTO mateReplydto) throws JsonProcessingException {
		List<MateReplyDTO> list=mateReplySer.mate_reply_modify_save(mateReplydto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	
	// 댓글 삭제
	@RequestMapping(value="mate_reply_delete", produces = "application/json;charset=utf-8")
	@ResponseBody
//	public String mate_reply_delete(MateReplyDTO mateReplydto, @RequestParam int numtest) throws JsonProcessingException {
		public String mate_reply_delete(MateReplyDTO mateReplydto) throws JsonProcessingException {
//		System.out.println("c reply delete rnum 전 : "+mateReplydto.getRnum());
		//mateReplydto.setBnum((Integer)session.getAttribute("bnum")); // 필요없음...
		//System.out.println("c reply delete rbnum 후 : "+mateReplydto.getRnum());
		//System.out.println("c mate_reply_delete param int num : "+rnum);
		//System.out.println("c mate_content_delete requestparam numtest : "+numtest);
		List<MateReplyDTO> list=mateReplySer.mate_reply_delete(mateReplydto );
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	
	// 대댓글 저장
	@RequestMapping(value="mate_reply_reply_save",method=RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String mate_reply_reply_save(MateReplyDTO mateReplydto, HttpSession session) throws JsonProcessingException {
		System.out.println("대댓 내용 :"+mateReplydto.getReply());
		System.out.println("대댓 step :"+mateReplydto.getStep());
		mateReplydto.setNick((String)session.getAttribute("loginNick"));
		List<MateReplyDTO> list=mateReplySer.mate_reply_reply_sav(mateReplydto);
		ObjectMapper mapper=new ObjectMapper();
		String strJson=mapper.writeValueAsString(list);
		return strJson;
	}
	
	
	
	
//	@RequestMapping(value="reply_regi",produces="application/json;charset-utf-8")
//	@ResponseBody
//	public void mate_reply_regi(MateReplyDTO mrdto)   {
//		ObjectMapper mapper=new ObjectMapper();
//		//String strJson=mapper.writeValueAsString(mrdto);
//		  mrdto=mapper.readValue(json, new TypeReference<MateReplyDTO>() {});
//		
//	}
	///--------------------------------
//	public void test() {
//		System.out.println("test 잘 출력되는가");
//	}
//	@RequestMapping("mate_comment")
//	public String mate_comment02( ) {
//		return "mate_board/mate_comment";
//	}
	///--------------------------------

//	@RequestMapping(value="mate_comment", 
//			produces="application/json;charset-utf-8")
//	@ResponseBody
//	public String mate_comment(MateReplyDTO mrdto) throws JsonProcessingException {
//		ObjectMapper mapper=new ObjectMapper();
//		String strJson = mapper.writeValueAsString(mrdto);
//			return strJson;
//	}
	
	
//	@GetMapping("mate_comment")
//	public String mate_comment02() {
//		System.out.println("mate_comment02");
//		return "mate_board/mate_comment";
//	}
//	
	/// -----------------
	

	
	
	//
	@RequestMapping("mate_reply")
	public String mate_reply() {
		return "mate_board/mate_reply";
	}
	
	@RequestMapping("reply")
	public String reply() {
		return "mate_board/reply";
	}
	
	
//	@RequestMapping(value="mate_reply", produces="application/json;charset-utf-8")
//	@ResponseBody
//	public String mate_reply_list(MateReplyDTO mateReplydto) throws JsonProcessingException {
//		List<MateReplyDTO> list=mateReplySer.mate_reply_list_1(mateReplydto,0);
//		ObjectMapper mapper=new ObjectMapper();
//		String strJson=mapper.writeValueAsString(mateReplydto);
//		return strJson;
//	}
	///--------------------------------
//	@RequestMapping("comment")
//	public String comment(Model model, MateReplyDTO mateReplydto ) {
//		//MateReplyDTO dto=new MateReplyDTO();
//		//System.out.println("con 시간 : "+mateReplydto.getSavedate());
//		System.out.println("con  닉  : "+mateReplydto.getNick());
//		mateReplySer.mate_reply_list_1(  model, 0);
//		return "mate_board/comment";
//	}
	///--------------------------------
	
}
