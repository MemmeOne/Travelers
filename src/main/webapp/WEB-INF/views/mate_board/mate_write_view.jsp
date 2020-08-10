<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 동행 찾기 글 작성 중</title>
<style type="text/css">
#list{border-collapse:collapse;}
#write {border-collapse:collapse; }
#hidden{display:none;} 
</style>
<script src="resources/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
function cal_save(mtravel_date_s,mtravel_date_3,wnick) {
	console.log("달력저장버튼도눌림")
	var cal_data={mtravel_date_s:mtravel_date_s,mtravel_date_e:mtravel_date_e,wnick:wnick}
	$.ajax({
		url:"",
		type:"POST",
		data:cal_data,
		success:function(data) {
		 
		},
		error:function(request, status, error) {
				console.log("실패");
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
 
}



function write_save() {
	var title =$("#title").val();
	var content=$("#content").val();

	var mtravel_date=$("input[name=mtravel_date]:checked").val();
	var mtravel_date_s=$("input[name=mtravel_date_s]").val();
	var mtravel_date_e=$("input[name=mtravel_date_e]").val();
	console.log(mtravel_date_s)
	let today=new Date();
	console.log(today)
	let t=today.getFullYear()+"-"+(today.getMonth()+1)+"-"+today.getDate();
	console.log(t)
	if(mtravel_date_s=="") {
		mtravel_date_s="2000-01-01";
	}
	if(mtravel_date_e=="") {
		mtravel_date_e="2000-01-01";
	}
	console.log("mtravel_date_s="+mtravel_date_s)
	var date_s=new Array();
	date_s=mtravel_date_s.split("-");
	for(var i=0;i<date_s.length;i++) {
		console.log(date_s[i])
	}
	//date_s[0]=mtravel_date_s.substring(0,3)
	//date_s[1]=mtravel_date_s.substring(5,6)
	//date_s[2]=mtravel_date_s.substring(7,8)
	//date_s[0]="2020"
	//date_s[1]="07"
	//date_s[2]="31"
	console.log(date_s[0])
	console.log(date_s[1])
	console.log(date_s[2])
	
	var wnick="${loginUser.nick}"
	console.log("wnick="+wnick)
	var wgender="${loginUser.gender}"
	console.log("wgender="+wgender)
	var age="${loginUser.birth}"
	console.log("age="+ age)	
	//let age_date=new Date(2019,1,3)
	let age_date=new Date(age.substring(0,4),age.substring(5,6),age.substring(8,9))
	console.log(age_date)
	console.log(age_date.getFullYear());
	var age_year=age_date.getFullYear()
	var t1=today.getFullYear();
	var t2=today.getMonth()+1;
	var t3=today.getDate();

	var myage=t1-age_year+1
	var wage
	if(20<=myage||myage<30) {wage=20} 
	else if(30<=myage||myage<40) {wage=30} 
	else if(40<=myage||myage<50) {wage=40} 
	else if(50<=myage||myage<60) {wage=50} 
	else if(60<=myage) {wage=60} 
	
	console.log("wage="+wage)
	console.log("date_s[0]"+date_s[0])
	console.log("t1"+t1)
	var chk=0;

	if(date_s[0]==t1) {
		if(date_s[1]==t2) {
			if(date_s[2]<=t3) {
				//alert("1 여행 기간을 제대로 입력해주세요!")
				chk=1;
			}
		} else if(date_s[1]<t2) {
			//alert("2 여행 기간을 제대로 입력해주세요!")
			chk=1;
		}
	} else if(date_s[0]<t1) {
		//alert("3 여행 기간을 제대로 입력해주세요!")
		chk=1;
	}
	//if(mtravel_date_s<t ) {
	//		alert("오늘 이전 t");
	//} else {
	//	alert("오늘 이전 아님")
	//}
	
	//if(mtravel_date_s<today ) {
		// 날짜가 오늘 이전, 여행 시작날보다 끝날이 더 이전, 여행 날짜를 입력하지 않은 경우
	//		alert("오늘 이전 today");
	//}  else {
	//	alert("오늘 이전 아님 today")
	//}
	
	//if(mtravel_date_s>mtravel_date_e) {
	//	alert("시작날짜보다 끝 날짜가 더 이전")
	//} else {
	//	alert("아님")
	//}
	//if(mtravel_date_s>mtravel_date_e) {
	//	alert("여행 일정 오류")
	//}
    //if(mtravel_date_s<today ) {alert("오늘 이전    날짜를 제대로 입력해주세요!");}
	//if(mtravel_date_s>mtravel_date_e) {alert("s>e   날짜를 제대로 입력해주세요!");}
	
	
	//var mthema;
	//$("input[name=mthema]:checked").each(functitleon() {
	//	mthema=$(this).val();
	//})
	//var mthema=$("input[name=mthema]:checked").val();
	//var mthema=$(".mthema_chk");
	//for(int i=0;i<mthema.length;i++) {
		//if(mthema[i].checked==true) {}}
	
	var mthema_arr=new Array();
	$("input:checkbox[name=mthema]:checked").each(function() {
		mthema_arr.push($(this).val());
		console.log(mthema_arr)
	})
	var mthema="";
	mthema_arr.forEach(function(item, index){
		console.log(item,index);
		mthema+=item
		if(index!=mthema_arr.length-1){
			mthema+=", "
			}
	})
 
	console.log("mthema :"+mthema)
	//if(mthema=="") {
	//	alert("테마입력")
	//}
	
	var mage_arr=new Array();
	$("input:checkbox[name=mage]:checked").each(function() {
		mage_arr.push($(this).val());
		console.log(mage_arr)
	})
	var mage="";
	mage_arr.forEach(function(item, index){
		console.log(item,index);
		mage+=item
		if(index!=mage_arr.length-1){
			mage+=", "
			}
	})
	console.log("mage:"+mage)
	
	//if(mage=="") {
	//	alert("    sdas  원하는 동행 나이를 입력해주세요")
	//}  
	var mroom=$("input[name=mroom]:checked").val();
	var mgender=$("input[name=mgender]:checked").val();
	var mcnt=$("input[name=mcnt]").val();
	if(mcnt=="") {
		mcnt=0;
	}
	var mexpenses=$("input[name=mexpenses]:checked").val();
	var price1=$("input[name=price1]").val();
	var price2=$("input[name=price2]").val();

	var p1=$("input[name=price1]").val();
	var p2=$("input[name=price2]").val();
	console.log("p1="+p1)
	var price1=p1.replace(/,/gi,"");
	var price2=p2.replace(/,/gi,"");
	console.log("price1="+price1)
	
	if(price1=="") {
		price1=0;
	}
	if(price2=="") {
		price2=0;
	}
	var deadline="모집중";
	console.log("mcnt :"+mcnt)
	console.log("mexpenses :"+mexpenses)
	console.log("price1 :"+price1)
	console.log("price2 :"+price2)
	
	var write_save_ok=0;
	
	if (title=="") {
		alert("제목을 입력해주세요")
	} else if(mtravel_date_s>mtravel_date_e||mtravel_date_s=="2000-01-01"||mtravel_date_e=="2000-01-01") {
		// 날짜가 오늘 이전, 여행 시작날보다 끝날이 더 이전, 여행 날짜를 입력하지 않은 경우
		alert("여행 기간을 제대로 입력해주세요!");
	} else if(chk==1) {
		alert("여행 기간을 제대로 입력해주세요!");
	}
	else if(mthema=="") {
		alert("원하는 여행 테마를 입력해주세요")
	}
	else if(mroom=="") {
		alert("원하는 숙소 종류를 입력해주세요")
	}
	else if(mgender=="") {
		alert("원하는 동행 성별을 입력해주세요")
	}
	else if(mage=="") {
		alert("원하는 동행 나이를 입력해주세요")
	} else {
		write_save_ok=1;
	}

	var total={title:title ,content:content,mtravel_date:mtravel_date,mtravel_date_s:mtravel_date_s,mtravel_date_e:mtravel_date_e,
		mthema:mthema,mroom:mroom,mgender:mgender,mage:mage, mcnt:mcnt, mexpenses:mexpenses, price1:price1,price2:price2,deadline:deadline,
		write_save_ok:write_save_ok, wnick:wnick,wgender:wgender,wage:wage}
	console.log("여기부터");
	console.log("title :"+title);
	console.log("content :"+content);
	console.log("mtravel_date :"+mtravel_date);
	console.log("mtravel_date_s :"+mtravel_date_s);
	console.log(mtravel_date_s+1);
	console.log("mtravel_date_e :"+mtravel_date_e);
	console.log("mthema :"+mthema);
	console.log("mroom:"+mroom);
	console.log("mgende :"+mgender);
	console.log("mage :"+mage);
	console.log("mcnt :"+mcnt)
	console.log("mexpenses :"+mexpenses)
	console.log("price1 :"+price1)
	console.log("price2 :"+price2)
	//write_save(total)
	
		$.ajax({
			url:"mate_write_save",
			type:"POST",
			data:total,
			success:function(data) {
				console.log("성공"); 
				//location.href="mate_write_save00";
				if(write_save_ok==1) {
				//cal_save(mtravel_date_s,mtravel_date_e,wnick)
				location.href="mate_board_list?page=1"; 
				}
			},
			error:function(request, status, error) {
					console.log("실패");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	 
}

</script>
</head>
<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<body class="is-preload"> 
	<%@ include file="../default/header.jsp"%>
 
<style>
.checks {position: relative;}

.checks input[type="checkbox"] {  /* 실제 체크박스는 화면에서 숨김 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0
}
.checks input[type="checkbox"] + label {
  display: inline-block;
  position: relative;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}
.checks input[type="checkbox"] + label:before {  /* 가짜 체크박스 */
  content: ' ';
  display: inline-block;
  width: 21px;  /* 체크박스의 너비를 지정 */
  height: 21px;  /* 체크박스의 높이를 지정 */
  line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */
  margin: -2px 8px 0 0;
  text-align: center; 
  vertical-align: middle;
  background: #fafafa;
  border: 1px solid #cacece;
  border-radius : 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}
.checks input[type="checkbox"] + label:active:before,
.checks input[type="checkbox"]:checked + label:active:before {
  box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
}

.checks input[type="checkbox"]:checked + label:before {  /* 체크박스를 체크했을때 */ 
  content: '\2714';  /* 체크표시 유니코드 사용 */
  color: #99a1a7;
  text-shadow: 1px 1px #fff;
  border-color: #adb8c0;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
}
.checks.etrans input[type="checkbox"] + label {
  padding-left: 30px;
}
.checks.etrans input[type="checkbox"] + label:before {
  position: absolute;
  left: 0;
  top: 0;
  margin-top: 0;
  opacity: .6;
  box-shadow: none;
  border-color: #6cc0e5;
  -webkit-transition: all .12s, border-color .08s;
  transition: all .12s, border-color .08s;
}

.checks.etrans input[type="checkbox"]:checked + label:before {
  position: absolute;
  content: "";
  width: 10px;
  top: -5px;
  left: 5px;
  border-radius: 0;
  opacity:1; 
  background: transparent;
  border-color:transparent #6cc0e5 #6cc0e5 transparent;
  border-top-color:transparent;
  border-left-color:transparent;
  -ms-transform:rotate(45deg);
  -webkit-transform:rotate(45deg);
  transform:rotate(45deg);
}

.no-csstransforms .checks.etrans input[type="checkbox"]:checked + label:before {
  /*content:"\2713";*/
  content: "\2714";
  top: 0;
  left: 0;
  width: 21px;
  line-height: 21px;
  color: #6cc0e5;
  text-align: center;
  border: 1px solid #6cc0e5;
}
input[type=checkbox]:checked + label  {
	background-color: transparent;
}
input[type=checkbox] {
	display:none;
}
</style>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<!--  <form id="frm" action="">-->
					<div class="checks etrans" style="margin: 0 auto;">

 					
						<!--  
						<table style=" font-size:0.9em;">
							<tr>
								<td>기간</td>
								<td>
									<input type="date" id="mtravel_date_s_chk" name="mtravel_date_s_chk" max="9999-12-31" style="color: black; font-size:0.9em;">
									 ~ 
									<input type="date" id="mtravel_date_e_chk" name="mtravel_date_e_chk" max="9999-12-31" style="color: black; font-size:0.9em;">
									<input type="checkbox" id="mtravel_date1" name="mtravel_date" value="예정" style="color: black; font-size:0.9em;"  onclick="oneChk(this)" checked><label for="mtravel_date1">예정</label>
									<input type="checkbox" id="mtravel_date2" name="mtravel_date" value="확정" style="color: black; font-size:0.9em;" onclick="oneChk(this)"><label for="mtravel_date2">확정</label>
								</td>
							</tr>
							<tr>
								<td>테마</td>
								<td>
								<input type="checkbox" class="mthema_chk" name="mthema" value="관광" id="mthema_chk1"> <label for="mthema_chk1">관광</label>
						<input type="checkbox" class="mthema_chk" name="mthema" value="휴양" id="mthema_chk2"> <label for="mthema_chk2">휴양</label>
						<input type="checkbox" class="mthema_chk" name="mthema" value="식도락" id="mthema_chk3"> <label for="mthema_chk3">식도락</label>
						<input type="checkbox" class="mthema_chk" name="mthema" value="기타" id="mthema_chk4"> <label for="mthema_chk4">기타</label>
 
						<br></td>
							</tr>
							<tr>
								<td>숙소</td>
								<td><input type="checkbox" name="mroom" value="개인실" id="mroom1" onclick="oneChk(this)" checked> <label for="mroom1">개인실 </label>
						<input type="checkbox" name="mroom" value="다인실" id="mroom2"onclick="oneChk(this)"> <label for="mroom2">다인실</label>
				 
						</td>
							</tr>
							<tr>
								<td>1일 경비</td>
								<td  >
								<form>
									<input type="checkbox" id="chkNotPirce1" name="mexpenses" value="상관없음"  onclick="chkDisabled(this.form)" checked="checked"><label for="chkNotPirce1">상관없음</label>
									<input type="checkbox" id="chkprice" name="mexpenses" value="금액입력"   onclick="chkAbled(this.form)"><label for="chkprice">금액입력</label>
									<input type="number"  id="price1" name="price1" min="0" disabled  style = "text-align:right;">
									~
									<input type="number" id="price2" name="price2"  disabled  style = "text-align:right;">
									<div class="placeholder" data-placeholder="New placeholder"></div>
									<input type="checkbox" id="chkNotPirce2" name="mexpenses" value="추후결정"  onclick="chkDisabled(this.form)"><label for="chkNotPirce2">추후결정</label>
									
								</form> 
								</td>
						</tr>
						<tr><Td><h4>< 여행 동행 조건 ></h4></Td></tr>
						<Tr>
							<td>성별 :</td>
							<Td>
						 <input type="checkbox" name="mgender" value="여자" id="mgender1" onclick="oneChk(this)" checked>  <label for="mgender1">여자</label>
						<input type="checkbox" name="mgender" value="남자" id="mgender2" onclick="oneChk(this)"> <label for="mgender2">남자</label>
 						</Td>
						<Tr><td>나이 </td>
						<td>
						 <input type="checkbox" name="mage" value="20대" id="mage1"> <label for="mage1">20대 </label>
						<input type="checkbox" name="mage" value="30대" id="mage2"> <label for="mage2">30대  </label>
						<input type="checkbox" name="mage" value="40대" id="mage3"> <label for="mage3">40대  </label>
						<input type="checkbox" name="mage" value="50대" id="mage4"> <label for="mage4">50대  </label>
						<input type="checkbox" name="mage" value="60대이상" id="mage5"> <label for="mage5">60대이상 </label>
						</td>
							<tr>
								<td></td>
								<td></td>
							</tr>
						</table> --> 
						
					<table>
						<tr>
						<th style="width:60px;text-align: center;">제목</th>
						<th><input type="text" id="title" name="title" autofocus="autofocus"></th>
						</tr>
						<tr style="background-color:rgba(0, 0, 0, 0.0375);">
						<td colspan="2" style="margin: 0 auto;">

 
 						<h4>< 여행 정보 ></h4>
						기간 : 
						<input type="date" id="mtravel_date_s_chk" name="mtravel_date_s" max="9999-12-31" style="color: black; background-color:transparent;">
						 ~ 
						<input type="date" id="mtravel_date_e_chk" name="mtravel_date_e" max="9999-12-31" style="color: black;background-color:transparent; ">
						<input type="checkbox" id="mtravel_date1" name="mtravel_date" value="예정" checked onclick="oneChk_date(this)"><label for="mtravel_date1">예정</label>
						<input type="checkbox" id="mtravel_date2" name="mtravel_date" value="확정" onclick="oneChk_date(this)"><label for="mtravel_date2">확정</label>
						<br>
						테마 : 
						<input type="checkbox" class="mthema_chk" name="mthema" value="관광" id="mthema_chk1"> <label for="mthema_chk1">관광</label>
						<input type="checkbox" class="mthema_chk" name="mthema" value="휴양" id="mthema_chk2"> <label for="mthema_chk2">휴양</label>
						<input type="checkbox" class="mthema_chk" name="mthema" value="식도락" id="mthema_chk3"> <label for="mthema_chk3">식도락</label>
						<input type="checkbox" class="mthema_chk" name="mthema" value="기타" id="mthema_chk4"> <label for="mthema_chk4">기타</label>
						<br>
						숙소 : 
						<input type="checkbox" name="mroom" value="상관없음" id="mroom1" checked="checked" onclick="oneChk_room(this)" > <label for="mroom1">상관없음 </label>
						<input type="checkbox" name="mroom" value="개인실" id="mroom2"   onclick="oneChk_room(this)" > <label for="mroom2">개인실 </label>
						<input type="checkbox" name="mroom" value="다인실" id="mroom3" onclick="oneChk_room(this)"> <label for="mroom3">다인실</label>
 
						<br>
						<form style="display:flex" >
						1일경비 
						<input type="checkbox" id="chkNotPirce1" name="mexpenses" value="상관없음"  onclick="chkDisabled1(this.form)" checked="checked"><label for="chkNotPirce1">상관없음</label>
						<input type="checkbox" id="chkprice" name="mexpenses" value="금액입력"   onclick="chkAbled(this.form)"><label for="chkprice">금액입력</label>
						<input type="text" numberOnly id="price1" name="price1" disabled style="text-align: right;color:black; width:200px; height:33px; background-color:rgba(0, 0, 0, 0.1); border:2.5px solid black ">&nbsp;원
						~ &nbsp;&nbsp;
						<input type="text" numberOnly id="price2" name="price2" disabled style="text-align: right;color:black; width:200px; height:33px; background-color:transparent; border:2.5px solid black ">&nbsp;원
							<input type="checkbox" id="chkNotPirce2" name="mexpenses" value="추후결정"  onclick="chkDisabled2(this.form)"><label for="chkNotPirce2">추후결정</label>
						</form>
						<h4>< 여행 동행 조건 ></h4>
						성별 : 
						<input type="checkbox" name="mgender" value="상관없음" id="mgender1" checked="checked"  onclick="oneChk_gender(this)">  <label for="mgender1">상관없음</label>
						<input type="checkbox" name="mgender" value="여자" id="mgender2"  onclick="oneChk_gender(this)">  <label for="mgender2">여자</label>
						<input type="checkbox" name="mgender" value="남자" id="mgender3"  onclick="oneChk_gender(this)"> <label for="mgender3">남자</label>
 
						<br>
						나이 : 
						<input type="checkbox" name="mage" value="20대" id="mage1"> <label for="mage1">20대 </label>
						<input type="checkbox" name="mage" value="30대" id="mage2"> <label for="mage2">30대  </label>
						<input type="checkbox" name="mage" value="40대" id="mage3"> <label for="mage3">40대  </label>
						<input type="checkbox" name="mage" value="50대" id="mage4"> <label for="mage4">50대  </label>
						<input type="checkbox" name="mage" value="60대이상" id="mage5"> <label for="mage5">60대이상 </label>
						<br>
						모집 인원
						<input type="number" id="mcnt" name="mcnt" onkeyup="this.value=this.value.replace(/^0-9]/g,'');" style = "text-align:right; color:black; background-color:transparent ;">명
						
						<br>
						<!--  <input type="text" id="title" name="title" size="100" autofocus >
						<textarea id="content" name="content" rows="10" cols="100"></textarea>-->
						</td>
						</tr>


						<tr>
						<th colspan="2" style="margin: 0 auto;">
						<textarea rows="15" cols="50" id="content"></textarea>

						<script type="text/javascript">
							$(function() {
								//전역변수선언
							    var editor_object = [];
							    var ctx = getContextPath();
				
							    nhn.husky.EZCreator.createInIFrame({
							        oAppRef: editor_object,
							        elPlaceHolder: "content",
							        sSkinURI: ctx + "/resources/smarteditor/SmartEditor2Skin.html",
							        htParams : {
							            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							            bUseToolbar : true,             
							            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							            bUseVerticalResizer : true,     
							            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							            bUseModeChanger : true,
							            fOnBeforeUnload : function(){
							                
							            }
							        }
							    });
							    
							  //전송버튼 클릭이벤트
							    $("#contentRegBtn").click(function(){
							        //id가 smarteditor인 textarea에 에디터에서 대입
							        editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
							        write_save();
							    });
							    
							    function getContextPath() {
							    	return sessionStorage.getItem("contextpath");
							    }
							});
							</script>
							
					<script type="text/javascript">
						// 1일 경비 숫자만 입력, 3자리마다 콤마
						$("input:text[numberOnly]").on("focus", function() {
						    var x = $(this).val();
						    x = removeCommas(x);
						    $(this).val(x);
						}).on("focusout", function() {
						    var x = $(this).val();
						    if(x && x.length > 0) {
						        if(!$.isNumeric(x)) {
						            x = x.replace(/[^0-9]/g,"");
						        }
						        x = addCommas(x);
						        $(this).val(x);
						    }
						}).on("keyup", function() {
						    $(this).val($(this).val().replace(/[^0-9]/g,""));
						});

						function addCommas(x) {
						    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						}
						 
						//모든 콤마 제거
						function removeCommas(x) {
						    if(!x || x.length == 0) return "";
						    else return x.split(",").join("");
						}
						</script>
							
							
							
							
						</th>
						</tr>
						<tr>
						<th style="text-align: left: ;">
						<input type="button" value="전체목록보기" onclick="location.href='mate_board_list?page=1'">	
						</th>
						<th style="text-align: right;">
						<input type="button"  id="contentRegBtn" value="완료">
						</th>
						</tr>
					</table>		
						
						
						<button onclick="write_save()">아작스</button>
					
					</div>
						<!--    </form> -->
				</div>
			</section>
		</article>
	</div>
	<%@ include file="../default/footer.jsp"%>
	<script type="text/javascript">
	
 
	function oneChk_date(a) {
		var obj_date=document.getElementsByName("mtravel_date");
		for(var i=0;i<obj_date.length;i++) {
			if(obj_date[i]!=a) {
				obj_date[i].checked=false;
			}
		}

	}
	
	function oneChk_room(a){
		var obj_room=document.getElementsByName("mroom");
		for(var i=0;i<obj_room.length;i++) {
			if(obj_room[i]!=a) {
				obj_room[i].checked=false;
			}
		}
	}
	
	function oneChk_gender(a) {
		var obj_gender=document.getElementsByName("mgender");
		for(var i=0;i<obj_gender.length;i++) {
			if(obj_gender[i]!=a) {
				obj_gender[i].checked=false;
			}
		}
	}
	
	function oneChkeExpenses(a) {
		var obj_mexpenses=document.getElementsByName("mexpenses");
		for(var i=0;i<obj_mexpenses.length;i++) {
			if(obj_mexpenses[i]!=a) {
				obj_mexpenses[i].checked=false;
			}
		}
	}
	
	   // 금액 입력 버튼 활성&비활성화 
	   // 상관없음 chkNotPirce1
	   // 금액입력 chkprice
	   // 추후결정 chkNotPirce2
	   
	 	function chkAbled(form) {
	 		if(form.chkprice.checked==true) {
	 			//form.price1.disabled=false;
	 			document.getElementById("price1").disabled=false;
	 			form.price2.disabled=false;
	 			var a=chkprice
	 			oneChkeExpenses(a)
 
	 		}  
	 	}
	 	
		function chkDisabled1(form) {
	 		if(form.chkNotPirce1.checked==true) {
	 			//form.price1.disabled=false;
	 			document.getElementById("price1").disabled=true;
	 			form.price2.disabled=true;
	 			var a=chkNotPirce1
	 			oneChkeExpenses(a)
	 		} 
	 	}
		function chkDisabled2(form) {
 			if(form.chkNotPirce2.checked==true) {
 				//form.price1.disabled=false;
 				document.getElementById("price1").disabled=true;
 				form.price2.disabled=true;
 				var a=chkNotPirce2
 				oneChkeExpenses(a)

 			}  
		}
		
	</script>
						
</body>
</html>