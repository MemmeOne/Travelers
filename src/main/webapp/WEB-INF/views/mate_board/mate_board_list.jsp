<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#list{border-collapse:collapse;}
#hidden{display:none;} 
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
			mroom+=item;
			if(index!=mroom_arr.length-2){
				mroom+=","
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
			mgender+=item
			if(index!=mgender_arr.length-2){
				mgender+=","
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
			mage+=item
			if(index!=mage_arr.length-2){
				mage+=","
			}
		})


		var price1=$("input[name=price1]").val();
		var price2=$("input[name=price2]").val();
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
</script>
</head>
<body class="is-preload">
	<%@ include file="../defualt/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-copy1" name="demo-copy1" onclick="tt()">
						<label for="demo-copy">Email me a copy</label>
						<script type="text/javascript">
							if($("input:checkbox[id='demo-copy1']").is(":checked")){
								$("input:checkbox[id='demo-copy1']").prop("checked", true);
							}else{
								$("input:checkbox[id='demo-copy1']").prop("checked", false);
							}
						</script>
						안ㄴ
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-copy 2" name="demo-copy">
						<label for="demo-copy">Email me a copy</label>
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-copy" name="demo-copy">
						<label for="demo-copy">Email me a copy</label>
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-copy" name="demo-copy">
						<label for="demo-copy">Email me a copy</label>
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-copy" name="demo-copy">
						<label for="demo-copy">Email me a copy</label>
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-copy" name="demo-copy">
						<label for="demo-copy">Email me a copy</label>
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-human" name="demo-human" checked>
						<label for="demo-human">Not a robot</label>
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-human2" name="demo-human2" checked>
						<label for="demo-human">Not a robot</label>
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-human2" name="demo-human2" checked>
						<label for="demo-human">Not a robot</label>
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-human2" name="demo-human2" checked>
						<label for="demo-human">Not a robot</label>
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-human2" name="demo-human2" checked>
						<label for="demo-human">Not a robot</label>
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-human2" name="demo-human2" checked>
						<label for="demo-human">Not a robot</label>
					</div>


<input type="hidden" name="page" value="1">
<!-- <h1>동행찾기게시판</h1> -->
<!--<form action="mate_list_search" >-->
	<input type="hidden" name="page" value="1">
 <form id="s"> 
	<input type="text" id="word" name="word" placeholder="검색할 키워드를 입력하세요"  value="">
	<select name="tag">
		<option value="title">제목</option>
		<option value="nick">닉네임</option>
	</select>
<input type="submit" value="검색 non ajax"  >
<!--</form>-->
	<table>
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
									<input type="checkbox" class="mthema_chk" name="mthema" value="맛집 탐방">맛집 탐방 
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
	
	</table>
	<input type="button" value="검색 아작스" onclick="search()">


 </FORM> 

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
		</c:choose>-->
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
</table>
<a href="mate_write_view">글작성</a>

			
				</div>
			</section>
		</article>
	</div>
	<%@ include file="../defualt/footer.jsp"%>
</body>
</html>