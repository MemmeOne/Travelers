<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#hidden{display:none;}
</style>
<script src="resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

var mtravel_date_s=${ccc.mtravel_date_s}
console.log("날짜 ")
console.log(mtravel_date_s)
var mtravel_date_e=${ccc.mtravel_date_e}+1
console.log(mtravel_date_e)
function chkchk() {
	//$("input:radio[name='mtravel_date']").is(":checked")
	//document.getElementById("mtravel_date").checked = true;; 
$('input:radio[name=mtravel_date]:input[value="확정"]').attr("checked", true);
}
var date_e="${ccc.mtravel_date_e }";
console.log(date_e)
var date="${ccc.mtravel_date }"
console.log(date)
</script>

<script type="text/javascript">
function modify_save() {
	var title=$("#title").val();
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
	var date_s=new Array();
	date_s=mtravel_date_s.split("-");
	for(var i=0;i<date_s.length;i++) {
		console.log(date_s[i])
	}
	
	var t1=today.getFullYear();
	var t2=today.getMonth()+1;
	var t3=today.getDate();

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
	if(price1=="") {
		price1=0;
	}
	if(price2=="") {
		price2=0;
	}
	var deadline="진행중";
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
	else if(mage=="") {
		alert("원하는 동행 나이를 입력해주세요")
	} else {
		write_save_ok=1;
	}

	var total={title:title,content:content,mtravel_date:mtravel_date,mtravel_date_s:mtravel_date_s,mtravel_date_e:mtravel_date_e,
		mthema:mthema,mroom:mroom,mgender:mgender,mage:mage, mcnt:mcnt, mexpenses:mexpenses, price1:price1,price2:price2,deadline:deadline,
		write_save_ok:write_save_ok}
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
			url:"mate_content_modify_update",
			type:"POST",
			data:total,
			success:function(data) {
				console.log("성공"); 
				//location.href="mate_write_save00";
				if(write_save_ok==1) {
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
<body>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



 <c:set value="${mate_dao.mate_content_viewdao() }" var="mmm"/>
 	<!--  <form action="mate_content_modify_update?num=${ccc.num }">-->
 	<table border="1">
 		<tr> <td colspan="2"> < 여행 정보  > </td></tr>
				<tr> <td colspan="2"> 기간 
				
										<c:set var="ddd" value="${ccc.mtravel_date }"/>
										${ccc.mtravel_date_s} ~ ${ccc.mtravel_date_e}
										<input type="date" name="mtravel_date_s" max="2999-12-31" value="${ccc.mtravel_date_s }"> 
										~ 
										<input type="date" name="travel_date_e" max="2999-12-31"  value="${ccc.mtravel_date_e }">
										<input type="radio" name="mtravel_date" value="예정 " <c:out value="${ccc.mtravel_date eq '예정' ? 'checked':'' }"/> >예정
										<input type="radio" name="mtravel_date" value="확정" <c:out value="${ccc.mtravel_date eq '확정' ? 'checked':'' }"/> >확정
										
										</td></tr>
				<tr> <td colspan="2"> 테마<hr>
				<c:if test="${fn:contains(thema,'관광') }"> <p>checked <p></c:if> <hr>
									<c:set var="thema" value="${ccc.mthema }"/>
									<input type="checkbox" name="mthema" value="관광"  <c:if test="${fn:contains(ccc.mthema,'관광') }"> checked </c:if>     >관광
									<input type="checkbox" name="mthema" value="휴양" <c:if test="${fn:contains(ccc.mthema,'휴양') }"> checked </c:if>  	>휴양  
									<input type="checkbox" name="mthema" value="맛집 탐방" <c:if test="${fn:contains(ccc.mthema,'맛집 ') }"> checked </c:if>  >맛집 탐방  
									<input type="checkbox" name="mthema" value="기타" <c:if test="${fn:contains(ccc.mthema,'기타') }"> checked </c:if>  >	기타
									<label id="hidden">
										<input type="checkbox" name="mthema" value="" checked="checked">
									</label>
									</td></tr>
				 <tr> <td colspan="2"> 숙소 
									<input type="radio" name="mroom" value="상관없음" <c:out value="${ccc.mroom eq '상관없음' ? 'checked':'' }"/> >상관없음
									<input type="radio" name="mroom" value="개인실" <c:out value="${ccc.mroom eq '개인실' ? 'checked':'' }"/> >개인실
									<input type="radio" name="mroom" value="다인실" <c:out value="${ccc.mroom eq '다인실' ? 'checked':'' }"/> >다인실
									<label id="hidden">
										<input type="radio" name="mroom" value="" <c:out value="${ccc.mroom eq '' ? 'checked':'' }"/>>
									</label>
									</td></tr>
				<tr> <td colspan="2"> 1일경비 
									<input type="checkbox" name="mexpenses" value="상관없음">상관없음
									<input type="checkbox" name="mexpenses" value="금액입력">금액입력
									<div class="placeholder" data-placeholder="New placeholder"></div>
									<input type="checkbox" name="mexpenses" value="추후결정">추후결정
									</td></tr>
				<tr> <td colspan="2"> < 여행 동행 조건  > </td></tr>
				<tr> <td colspan="2"> 성별
									<input type="radio" name="mgender" value="상관없음" <c:out value="${ccc.mgender eq '상관없음' ? 'checked':'' }"/> >상관없음
									<input type="radio" name="mgender" value="여자" <c:out value="${ccc.mgender eq '여자' ? 'checked':'' }"/> >여자
									<input type="radio" name="mgender" value="남자" <c:out value="${ccc.mgender eq '남자' ? 'checked':'' }"/> >남자
									<label id="hidden">
										<input type="radio" name="mgender" value="" <c:out value="${ccc.mgender eq '' ? 'checked':'' }"/> >
									</label>
									</td></tr>
				<tr> <td colspan="2"> 나이 
									<input type="checkbox" name="mage" value="20대"<c:if test="${fn:contains(ccc.mage,'2') }"> checked </c:if>>20대
									<input type="checkbox" name="mage" value="30대"<c:if test="${fn:contains(ccc.mage,'3') }"> checked </c:if>>30대
									<input type="checkbox" name="mage" value="40대"<c:if test="${fn:contains(ccc.mage,'4') }"> checked </c:if>>40대
									<input type="checkbox" name="mage" value="50대"<c:if test="${fn:contains(ccc.mage,'5') }"> checked </c:if>>50대
									<input type="checkbox" name="mage" value="60대"<c:if test="${fn:contains(ccc.mage,'6') }"> checked </c:if>>60대이상
									<label id="hidden">
										<input type="checkbox" name="mage" value="-1" checked="checked">
									</label>
									</td></tr>
 	
 	
 	
			
				<tr> <td>번호</td> <td>${ccc.num}</td> </tr>  
				<tr> <td>조회수</td> <td>${ccc.hit}</td> </tr>
				<tr> <td>닉네임</td> <td>${ccc.wnick}</td> </tr>
				<tr> <td>제목</td> <td><input id="title" name="title"  value="${ccc.title}" type="text"  size="100"></td> </tr>
				<tr> <td>내용</td> <td><textarea id="content" name="content" rows="10" cols="50">${ccc.content}</textarea></td> </tr>
				<tr> <td colspan="2">
						<button onclick="modify_save()">수정1</button>
						<input type="submit" value="수정2" onclick="location.href='mate_content_view?num=${ccc.num}'">&nbsp;&nbsp;
						<a href="mate_board_list">목록보기</a>&nbsp;&nbsp;
						<<!--  <a href="delete.jsp?id=${dto.id}">삭제</a>&nbsp;&nbsp;
						<a href="reply_view.jsp?id=${dto.id}">답변</a>  -->
					</td> 
				</tr>
			</table>
		<!--</form>-->
		
	  <script type="text/javascript">
	  <!-- 금액 입력 버튼 활성&비활성화-->
	 	function chkAbled(form) {
	 		if(form.chkprice.checked==true) {
	 			//form.price1.disabled=false;
	 			document.getElementById("price1").disabled=false;
	 			form.price2.disabled=false;
	 		}  
	 	}
	 	
		function chkDisabled(form) {
	 		if(form.chkNotPirce1.checked==true) {
	 			//form.price1.disabled=false;
	 			document.getElementById("price1").disabled=true;
	 			form.price2.disabled=true;
	 		} 
	 		if(form.chkNotPirce2.checked==true) {
	 			//form.price1.disabled=false;
	 			document.getElementById("price1").disabled=true;
	 			form.price2.disabled=true;
	 		}  
	 	}
	 </script>
		
		
</body>
</html>