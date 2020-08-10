<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 동행 찾기 검색 결과</title>
<style type="text/css">
#list{border-collapse:collapse;}
#hidden{display:none;}
#link:hover{background-color:rgba(140,140,140,1);}
#link:active{background-color:rgba(3,3,3, 0.7);}
.d{background:yellow}
</style>
<script src="resources/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
var frm=document.getElementById("s")
	function search() {
	
		// page, word, tag =============
		var page=1;
		var word=$("input[name=word]").val();
		var tag=$("select[name=tag]").val();
		
		// 여행 기간 ==============
		var mtravel_date=$("input[name=mtravel_date]:checked").val();
		var mtravel_date_s_chk=$("#mtravel_date_s_chk").val();
		var mtravel_date_e_chk=$("#mtravel_date_e_chk").val();
		console.log("mtravel_date_s_chk :"+mtravel_date_s_chk)
		console.log("mtravel_date_e_chk :"+mtravel_date_e_chk)
		var mtravel_date_s="2000-01-01";
		var mtravel_date_e="9999-01-01";
		
		if(mtravel_date_s_chk!="") {
			 mtravel_date_s= mtravel_date_s_chk
		}
		
		if(mtravel_date_e_chk!="") {
			 mtravel_date_e= mtravel_date_e_chk
		}
		
		console.log("mtravel_date_s :"+mtravel_date_s)
		console.log("mtravel_date_e :"+mtravel_date_e)
		//var mthema;
		//$("input[name=mthema]:checked").each(function() {
		//	mthema=$(this).val();
		//})
		//var mthema=$("input[name=mthema]:checked").val();
		//var mthema=$(".mthema_chk");
		//for(int i=0;i<mthema.length;i++) {
			//if(mthema[i].checked==true) {}}
		
		// 테마 ========
		var mthema_arr=new Array();
		$("input:checkbox[name=mthema]:checked").each(function() {
			mthema_arr.push($(this).val());
		})
		var mthema="";
		mthema_arr.forEach(function(item, index){
			console.log(item,index);
			console.log(item.length)
			if(item!="") {
			mthema+=item
			if(index!=mthema_arr.length-2){
			mthema+=","
			}
			}
		})
	 
		console.log("mthema :"+mthema)
		
		// 숙소 ===========
		var mroom_arr=new Array();
		$("input[name=mroom]:checked").each(function() {
			mroom_arr.push($(this).val());
		})
		console.log("mroom_arr :"+mroom_arr)
		var mroom="";
		mroom_arr.forEach(function(item,index){
			if(item!="") {
			mroom+=item;
			if(index!=mroom_arr.length-2){
				mroom+=","
				}
			}
		})
		
		var mroom_box=[];
		$("input[name=mroom]:checked").each(function(i) {
			mroom_box.push($(this).val());
		})
		console.log("mroom_box :"+mroom_box)
		
		
		// 동행 성별 =========
		var mgender_arr=new Array();
		
		$("input:checkbox[name=mgender]:checked").each(function() {
			mgender_arr.push($(this).val());
		})
		var mgender="";
		mgender_arr.forEach(function(item, index){
			console.log(item,index);
			if(item!="") {
			mgender+=item
			if(index!=mgender_arr.length-2){
				mgender+=","
			}
			}
		})
		
		
		// 동행 나이 ========
		var mage_arr=new Array();
		$("input:checkbox[name=mage]:checked").each(function() {
			mage_arr.push($(this).val());
		})
		var mage="";
		mage_arr.forEach(function(item, index){
			console.log(item,index);
			if(item!=""&&item!="1") {
 
			mage+=item
			if(index!=mage_arr.length-2){
				mage+=","
			}
			}
		})

 
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
		console.log("word :"+word)
		console.log("page :"+page)
		console.log("tag :"+tag)
		console.log("mtravel_date_s :"+mtravel_date_s);
		console.log("mtravel_date_e :"+mtravel_date_e);
		console.log("mthema :"+mthema);
		console.log("mroom:"+mroom);
		console.log("mgende :"+mgender);
		console.log("mage :"+mage);
		console.log("price1 :"+price1)
		console.log("price2 :"+price2)
//var form={title:title,content:content,mtravel_date:mtravel_date,mtravel_date_s:mtravel_date_s,mtravel_date_e:mtravel_date_e,
//mthema:mthema,mroom:mroom,mgender:mgender,mage:mage, mcnt:mcnt, mexpenses:mexpenses, price1:price1,price2:price2,deadline:deadline}
		console.log("여기부터");
		var form={word:word, page:page, tag:tag,
				mtravel_date_s:mtravel_date_s,mtravel_date_e:mtravel_date_e,
				mthema:mthema,mroom:mroom,
				//mroom_arr:mroom_arr,
				price1:price1,price2:price2,
				mgender:mgender,mage:mage}
		//frm.appendChild(word)
		//frm.appendChild(page)
		//frm.appendChild(tag)
		////frm.appendChild(mtravel_date)
		//frm.submit();
		//location.href="mate_list_search()"
		$.ajax({
			url:"mate_search",
			data:form,
			success:function(data) {
				console.log("성공")
				//location.href="mate_list_search?page=1&word="+word+"&tag="+tag+"&mtravel_date="+mtravel_date;
			//location.href="mate_list_search";
			// 이거
			location.href="mate_list_search?page="+page+"&word="+word+"&tag="+tag
					+"&mtravel_date_s="+mtravel_date_s+"&mtravel_date_e="+mtravel_date_e
					+"&mthema="+mthema+"&mroom="+mroom
					//+"&mroom_arr="+mroom_arr
					+"&price1="+price1+"&price2="+price2
					+"&mgender="+mgender+"&mage="+mage
					//+"mroom_box="+mroom_box
					;
			},
		error:function(request, status, error) {
			console.log("실패");
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
			
			
			
			
		})
		
		
		
	}
	
	function chk(form) {
 		if(form.chkprice.checked==true) {
 			document.getElementById("price1").disabled=false;
 			form.price2.disabled=false;
 		} else {
 			document.getElementById("price1").disabled=true;
 			form.price2.disabled=true;
 		}
 	}
	
	function but() {
		console.log(" ㅅ이ㅏ먼")
	}

</script>


</head>
<body class="is-preload">
	<%@ include file="../default/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner" style="width: 1200px;">
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
	background-color: white;
}
input[type=checkbox] {
	display:none;
}
</style>

<script type="text/javascript">
	function chk_loginUser() {
		if ('${loginUser}' == "") {
			alert("로그인 후 사용 가능합니다.")
			location.href="login"
		}else {
			console.log("로그인 확인 성공")
			location.href='mate_write_view'
		}
	}
	</script>


	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
					<div class="checks etrans" style="  align: center;width: 1070px; margin: 0 auto; ">
					
	
						
						<!--  <table style=" font-size:0.9em;">
							<tr>
								<td>기간<br>테마</td>
								<td><input type="date" id="mtravel_date_s_chk" name="mtravel_date_s_chk" max="9999-12-31" style="color: black; font-size:0.9em;">
									 ~ 
									<input type="date" id="mtravel_date_e_chk" name="mtravel_date_e_chk" max="9999-12-31" style="color: black; font-size:0.9em;">
									<br>
									<input type="checkbox" class="mthema_chk" name="mthema" value="휴양" id="mthema_chk2"> <label for="mthema_chk2">휴양</label>
									<input type="checkbox" class="mthema_chk" name="mthema" value="식도락" id="mthema_chk3"> <label for="mthema_chk3">식도락</label>
									<input type="checkbox" class="mthema_chk" name="mthema" value="기타" id="mthema_chk4"> <label for="mthema_chk4">기타</label>
									<div id="hidden">
										<input type="checkbox" class="mthema_chk" name="mthema" value="" checked>
									</div> 
								</td>
							</tr>
 
						</table>-->
						<!--  
						<table  style=" font-size:0.9em; height:300px ">
							<tr style="height:30px">
								<td>기간</td>
								<td><input type="date" id="mtravel_date_s_chk" name="mtravel_date_s_chk" max="9999-12-31" style="color: black; font-size:0.9em; ">
									 ~ 
									<input type="date" id="mtravel_date_e_chk" name="mtravel_date_e_chk" max="9999-12-31" style="color: black; font-size:0.9em;">
								</td>
							</tr>
							<tr style="vertical-align: middle; height:100px" >
								<td style="vertical-align: middle;">테마</td>
								<td style="vertical-align: middle;">
								  
								<input type="checkbox" class="mthema_chk" name="mthema" value="관광" id="mthema_chk1" style="vertical-align: middle;" > <label for="mthema_chk1" >관광</label>
								<input type="checkbox" class="mthema_chk" name="mthema" value="휴양" id="mthema_chk2"> <label for="mthema_chk2">휴양</label>
								<input type="checkbox" class="mthema_chk" name="mthema" value="식도락" id="mthema_chk3"> <label for="mthema_chk3">식도락</label>
								<input type="checkbox" class="mthema_chk" name="mthema" value="기타" id="mthema_chk4"> <label for="mthema_chk4">기타</label>
								<div id="hidden">
									<input type="checkbox" class="mthema_chk" name="mthema" value="" checked>
								</div>
								</td>
							</tr>
							<tr>
								<td>
								기간
								</td>
								<td>
								<input type="date" id="mtravel_date_s_chk" name="mtravel_date_s_chk" max="9999-12-31" style="color: black; font-size:0.9em; ">
								</td>
							</tr>
							<tr>
								<td>숙소</td>
								<td><input type="checkbox" name="mroom" value="개인실" id="mroom1" onclick="oneChk(this)"> <label for="mroom1">개인실 </label>
									<input type="checkbox" name="mroom" value="다인실" id="mroom2"onclick="oneChk(this)"> <label for="mroom2">다인실</label>
									<div id="hidden">
										<input type="checkbox" name="mroom" value="" checked>
									</div></td>
							</tr>
							<tr>
								<td>1일 경비</td>
								<td>
									<form>
										<input type="number" id="price1" name="price1" min="0" style="text-align: right;;color:black; vertical-align: middle;"> 
										~ <input type="number" id="price2" name="price2" style="text-align: right;color:black;">
									</form> </td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
						
						</table>
						
						
						
						
						
						==========표 아닌 것=================
						-->
						<h4> < 여행 정보 ></h4>
						<div id="hidden">
							<input type="date" name="mtravel_date_s" value="0001-01-01">
							~ 
							<input type="date" name="mtravel_date_e" value="0001-01-01">
						</div>
						기간 : 
						<c:set var="search" value="${mate_list_search }"/> 
						<input type="date" id="mtravel_date_s_chk" name="mtravel_date_s_chk" <c:if test="${mtravel_date_s ne '2000-01-01'}"> value="${mtravel_date_s}" </c:if> max="9999-12-31" style="color: black;">
						 ~ 
						<input type="date" id="mtravel_date_e_chk" name="mtravel_date_e_chk" <c:if test="${mtravel_date_e ne '9999-01-01'}"> value="${mtravel_date_e}" </c:if>  max="9999-12-31" style="color: black;">
							<br>입력하는 날짜 범위 안에 들어가는 경우에만 출력됨<br>
						<br>
						테마 : 
						<input type="checkbox" class="mthema_chk" name="mthema" value="관광" id="mthema_chk1"  <c:if test="${fn:contains(mthema,'관광') }"> checked </c:if>  > <label for="mthema_chk1">관광</label>
						<input type="checkbox" class="mthema_chk" name="mthema" value="휴양" id="mthema_chk2" <c:if test="${fn:contains(mthema,'휴양') }"> checked </c:if>  >  <label for="mthema_chk2">휴양</label>
						<input type="checkbox" class="mthema_chk" name="mthema" value="식도락" id="mthema_chk3" <c:if test="${fn:contains(mthema,'식도락') }"> checked </c:if>  >  <label for="mthema_chk3">식도락</label>
						<input type="checkbox" class="mthema_chk" name="mthema" value="기타" id="mthema_chk4" <c:if test="${fn:contains(mthema,'기타') }"> checked </c:if>  > <label for="mthema_chk4">기타</label>
						<div id="hidden">
							<input type="checkbox" class="mthema_chk" name="mthema" value="" checked>
						</div><br>
						숙소 : 
						<input type="checkbox" name="mroom" value="개인실" id="mroom1" <c:if test="${fn:contains(mroom,'개') }"> checked </c:if>  > <label for="mroom1">개인실 </label>
						<input type="checkbox" name="mroom" value="다인실" id="mroom2" <c:if test="${fn:contains(mroom,'다') }"> checked </c:if>  > <label for="mroom2">다인실</label>
						<div id="hidden">
							<input type="checkbox" name="mroom" value="" checked>
						</div>
						<form style="display:flex" >						
						1일경비 : 금액입력  &nbsp;&nbsp;
						<input type="text" numberOnly id="price1" name="price1" style="text-align: right;color:black; width:200px; height:33px; background-color:transparent; border:2.5px solid black ">&nbsp;원
						~ &nbsp;&nbsp;
						<input type="text" numberOnly id="price2" name="price2"  style="text-align: right;color:black; width:200px; height:33px; background-color:transparent; border:2.5px solid black ">&nbsp;원
						</form><Br>
						<h4>< 여행 동행 조건 ></h4>
						성별 : 
						<input type="checkbox" name="mgender" value="여자" id="mgender1" <c:if test="${fn:contains(mgender,'여') }"> checked </c:if> >  <label for="mgender1">여자</label>
						<input type="checkbox" name="mgender" value="남자" id="mgender2" <c:if test="${fn:contains(mgender,'남') }"> checked </c:if> > <label for="mgender2">남자</label>
						<div id="hidden">
							<input type="checkbox" name="mgender" value="" checked>
						</div>
						<br>
						나이 : 
						<input type="checkbox" name="mage" value="20대" id="mage1" <c:if test="${fn:contains(mage,'2') }"> checked </c:if> > <label for="mage1">20대 </label>
						<input type="checkbox" name="mage" value="30대" id="mage2" <c:if test="${fn:contains(mage,'3') }"> checked </c:if> > <label for="mage2">30대  </label>
						<input type="checkbox" name="mage" value="40대" id="mage3" <c:if test="${fn:contains(mage,'4') }"> checked </c:if>> <label for="mage3">40대  </label>
						<input type="checkbox" name="mage" value="50대" id="mage4" <c:if test="${fn:contains(mage,'5') }"> checked </c:if>> <label for="mage4">50대  </label>
						<input type="checkbox" name="mage" value="60대이상" id="mage5" <c:if test="${fn:contains(mage,'6') }"> checked </c:if>> <label for="mage5">60대이상 </label>
						<div id="hidden">
							<input type="checkbox" name="mage" value="1" checked>
						</div>
						<br> 
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
<input type="hidden" name="page" value="1">
 <table style="text-align: center;width: 1070px; margin: 0 auto; ">
 <tr>
 <form id="s"> 
 <td style="width:20%">
 	<select name="tag">
		<option value="title">제목</option>
		<option value="nick">닉네임</option>
	</select>
</td>
<td style="width:60%">
	<input type="text" id="word" name="word" placeholder="검색할 키워드를 입력하세요"  value="">
</td>
<!--  <input type="submit" value="검색 non ajax"  >-->
<Td style="width:20%"><input type="button" value="검색 " onclick="search()" style="width:100%"></Td>
</tr>
 </FORM> 
 </table>
 <br>
 <!-- 동행 게시판 버튼 형태로 만들고 싶음 
 <table id="box" style="text-align: center;width: 1070px; margin: 0 auto;font-size:0.9em;">
 <tr>
 	<td> <button type="button" style=" width: 100em; " >
 	</button>
 	</td>
 </tr>
 </table>
 
 <c:forEach items="${mate_list_all}" var="mate_dto">	
 <button type="button" style=" width: 1070px; " onclick="mate_content_view?num=${mate_dto.num }"  >
	제목 ${mate_dto.title}
	여행기간 :   ${mate_dto.mtravel_date_s }
 </button>
 </c:forEach>
		-->
 					
						
						<h2 style="text-align: center;width: 1070px; margin: 0 auto;">여행 동행 찾기</h2><Br>
							<table  class="all_white" id="box" style="text-align: center;width: 1070px; margin: 0 auto;font-size:0.9em;">
								<c:choose>
									<c:when test="${mate_list_search.size() eq 0 }">
									<tr id="link" style="margin : 5px;padding: 5px;" onclick="location.href='mate_content_view?num=${mate_dto.num }'">
									<td colspan="2">검색 결과가 없습니다</td>
									</tr>
									</c:when>
								</c:choose>
								<c:forEach items="${mate_list_search}" var="mate_dto">
								<c:set var="cdate" value="${cdate }"/>
								<c:set var="today" value="${cdate_today }"/>
								<fmt:formatDate var="savedate" value="${mate_dto.savedate }"	pattern="yyyy-MM-dd"/>								
								<tr id="link" style="margin : 5px;padding: 5px;" onclick="location.href='mate_content_view?num=${mate_dto.num }'">
									<th>
										[${mate_dto.mthema}/${mate_dto.mroom}] 
										${mate_dto.title}
										<!-- 각 개시글 별 댓글 수 -->
										<c:forEach var="cnum" items="${commentcount2}">
												<c:choose>
													<c:when test="${mate_dto.num eq  cnum.numgroup }">
														[${cnum.count }]
													</c:when>
												</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${savedate eq cdate }">
												<img src="resources/main_image/new.png" style="width:25px;">
											</c:when>
										</c:choose>									
										<br>
										여행기간 : ${mate_dto.mtravel_date_s } ~ ${mate_dto.mtravel_date_e }<br>
										동행조건 : ${mate_dto.mgender}, ${mate_dto.mage}<br>
									</th>
									<th style="text-align: right;vertical-align: middle;">
									<c:choose>
										<c:when test="${mate_dto.deadline eq '모집중'}">
										<span class="d"> ${mate_dto.deadline}</span> 
										</c:when>
										<c:otherwise>
										${mate_dto.deadline}
										</c:otherwise>
									</c:choose>
										<br>작성자 : ${mate_dto.wnick}<br>작성일 : 
										<c:choose>
											<c:when test="${savedate eq cdate }">
												${today }
											</c:when>
											<c:otherwise>
												${savedate }
											</c:otherwise>
											
										</c:choose>										
									</th>
								</tr>
								</c:forEach>
								<tr>
								<td style="text-align: left;">
								<input type="button" onclick="location.href='mate_board_list?page=1'" value="전체목록보기">	
								</td>
								<td  style="text-align: right;">
								<button onclick="chk_loginUser()">글작성</button>
								</td>
								</tr>
							</table>
				
							<br>
							
							<c:set var="num" value="0"/>

							<table class="padding_larger" style="text-align: center;width: 1070px; margin: 0 auto;font-size:0.7em;">
								<tr style="width: 60px;" >
									<td colspan="6" style="font-size:2em;">
											<c:choose>
												<c:when test="${param.page>1 }">
												<a href="mate_list_search?page=${param.page-1}&word=${word }&tag=${tag }
												&mtravel_date_s=${mtravel_date_s }&mtravel_date_e=${mtravel_date_e }
												&mthema=${mthema }&mroom=${mroom }
												&price1=${price1 }&price2=${price2 }
												&mgender=${mgender }
												&mage=${mage } " style="vertical-align: middle;">
													<img alt="" src="resources/main_image/bus_left.png" style="width: 50px; height: 50px;">
												</a>
											</c:when>
											<c:otherwise>
												<a href="mate_list_search?page=${param.page-1}&word=${word }&tag=${tag }
												&mtravel_date_s=${mtravel_date_s }&mtravel_date_e=${mtravel_date_e }
												&mthema=${mthema }&mroom=${mroom }
												&price1=${price1 }&price2=${price2 }
												&mgender=${mgender }
												&mage=${mage }" style="pointer-events: none;cursor: default;opacity: 0.5; vertical-align: middle;">
													<img alt="" src="resources/main_image/bus_left.png" style="width: 50px; height: 50px;">
												</a>
											</c:otherwise>
										</c:choose>
										
 										<c:set var="num" value="0"/>
 											<c:forEach begin="1" end="${totPage }" step="10" var="cnt">
												<c:set var="num" value="${num+1 }"/>
													<a href="mate_list_search?page=${num }&word=${word }&tag=${tag }
															&mtravel_date_s=${mtravel_date_s }&mtravel_date_e=${mtravel_date_e }
															&mthema=${mthema }&mroom=${mroom }
															&price1=${price1 }&price2=${price2 }
															&mgender=${mgender }
															&mage=${mage } ">${num}
													</a>
											</c:forEach>
											
											<c:choose>
												<c:when test="${param.page<num }">
												<a href="mate_list_search?page=${param.page+1}&word=${word }&tag=${tag }
												&mtravel_date_s=${mtravel_date_s }&mtravel_date_e=${mtravel_date_e }
												&mthema=${mthema }&mroom=${mroom }
												&price1=${price1 }&price2=${price2 }
												&mgender=${mgender }
												&mage=${mage } " style="vertical-align: middle;">
													<img alt="" src="resources/main_image/bus_right.png" style="width: 50px; height: 50px;">
												</a>
											</c:when>
											<c:otherwise>
												<a href="mate_list_search?page=${param.page+1}&word=${word }&tag=${tag }
												&mtravel_date_s=${mtravel_date_s }&mtravel_date_e=${mtravel_date_e }
												&mthema=${mthema }&mroom=${mroom }
												&price1=${price1 }&price2=${price2 }
												&mgender=${mgender }
												&mage=${mage }" style="pointer-events: none;cursor: default;opacity: 0.5; vertical-align: middle;">
													<img alt="" src="resources/main_image/bus_right.png" style="width: 50px; height: 50px;">
												</a>
											</c:otherwise>
										</c:choose>
										
 
										<br>
									</td>
								</tr>
							</table>
						</div>
						
					</div>
					
					<br>
					<br>
					<br>
					
					<input type="hidden" name="page" value="1">
<!-- <h1>동행찾기게시판</h1> -->
<!--<form action="mate_list_search" >-->



<!--</form>-->
	<!-- <table>
				<tr> <td colspan="2"> < 여행 정보  > </td></tr>
				<tr> <td colspan="2"> 기간
				<div id="hidden"> 
					 <input type="date" name="mtravel_date_s" value="0001-01-01"> ~  <input type="date" name="mtravel_date_e" value="0001-01-01">
				</div>
				<input type="date" id="mtravel_date_s_chk" name="mtravel_date_s_chk" max="9999-12-31">
				 ~ 
				 <input type="date" id="mtravel_date_e_chk" name="mtravel_date_e_chk" max="9999-12-31">
				입력하는 날짜 범위 안에 들어가는 경우에만 출력됨
										</td></tr>
				<tr> <td colspan="2"> 테마
									<input type="checkbox" class="mthema_chk" name="mthema" value="관광">관광
									<input type="checkbox" class="mthema_chk" name="mthema" value="휴양">	휴양  
									<input type="checkbox" class="mthema_chk" name="mthema" value="식도락">식도락 
									<input type="checkbox" class="mthema_chk" name="mthema" value="기타">기타 
									<div id="hidden"> 
										<input type="checkbox" class="mthema_chk" name="mthema" value=""  checked>
									</div>
									</td></tr>
				 <tr> <td colspan="2"> 숙소 
									<input type="checkbox" name="mroom" value="개인실">개인실
									<input type="checkbox" name="mroom" value="다인실">다인실
									<div id="hidden"> 
										<input type="checkbox"  name="mroom" value="" checked >
									</div>
									</td></tr>
				<tr> <td colspan="2"> 1일경비 :
								<form>
									금액입력
									<input type="number"  id="price1" name="price1" min="0"  style = "text-align:right;">
									~
									<input type="number" id="price2" name="price2"     style = "text-align:right;">
									</td></tr>
								</form>
				<tr> <td colspan="2"> < 여행 동행 조건  > </td></tr>
				<tr> <td colspan="2"> 성별
									<input type="checkbox" name="mgender" value="여자">여자
									<input type="checkbox" name="mgender" value="남자">남자
									<div id="hidden"> 
										<input type="checkbox" name="mgender" value="" checked >
									</div>
									</td></tr>
				<tr> <td colspan="2"> 나이 
									<input type="checkbox" name="mage" value="20대">20대
									<input type="checkbox" name="mage" value="30대">30대
									<input type="checkbox" name="mage" value="40대">40대
									<input type="checkbox" name="mage" value="50대">50대
									<input type="checkbox" name="mage" value="60대이상">60대이상
									<div id="hidden"> 
										<input type="checkbox"  name="mage" value="" checked >
									</div>
									</td>   </tr>
	
	</table> -->

<!--  
<table id="list" border="1">
	<tr>
		<th>번호</th>   <th>글 제목</th> <th>닉네임</th>
		 <th>날짜</th>  
		 <th>조회수</th> <th>진행상태</th>
	</tr>
	<c:forEach items="${mate_list_all}" var="mate_dto">
	<tr>
		<td>${mate_dto.num}</td>  
		<td><a href="mate_content_view?num=${mate_dto.num }">${mate_dto.title}</a></td> 
		<td>${mate_dto.wnick}</td>
		<td>${mate_dto.savedate}</td>  
		<td>${mate_dto.hit}</td>
		<td>${mate_dto.deadline }</td>
	</tr>
	</c:forEach>
		<tr>
		<td colspan="7">
		<!--<c:choose>
			<c:when test="${param.page==null }">
				<c:set var="page" value="1"/>
			</c:when>
			<c:otherwise>
				<c:set var="page" value="${param.page }"/>
			</c:otherwise>
		</c:choose> 
		<c:choose>
			<c:when test="${param.page>1 }">
				<button type="button" onclick="location.href='mate_board_list?page=${param.page-1}'">이전</button>
			</c:when>
			<c:otherwise>
				<button type="button" disabled>이전</button>
			</c:otherwise>
		</c:choose>
		
		<c:set var="num" value="0"/>
		<c:forEach begin="1" end="${totPage }" step="3" var="cnt">
			<c:set var="num" value="${num+1 }"/>
			<a href="mate_board_list?page=${num }">[${num}]</a>
		</c:forEach>
		
		
		<c:choose>
			<c:when test="${param.page<num}">
				<button type="button" onclick="location.href='mate_board_list?page=${param.page+1}'">다음</button>
			</c:when>
			<c:otherwise>
				<button type="button" disabled>다음</button>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${num==0 }">
				0 / ${num }
			</c:when>
			<c:otherwise>
				${param.page } / ${num }
			</c:otherwise>
		</c:choose>
		
		총 글 개수 ${totPage}
		</td>
	</tr>
</table>-->


			
				</div>
			</section>
		</article>
	</div>
	<%@ include file="../default/footer.jsp"%>
	<script type="text/javascript">
	
 
	function oneChk(a) {
		var obj=document.getElementsByName("mroom");
		var obj2=document.getElementsByName("mgender");
		for(var i=0;i<obj.length;i++) {
			if(obj[i]!=a) {
				obj[i].checked=false;
			}
		}
		for(var i=0;i<obj2.length;i++) {
			if(obj2[i]!=a) {
				obj2[i].checked=false;
			}
		}
	}
	
	</script>
</body>
</html>