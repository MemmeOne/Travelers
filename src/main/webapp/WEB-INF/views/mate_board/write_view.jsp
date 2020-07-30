<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#write {border-collapse:collapse; }
#hidden{display:none;} 
.placeholder {
    position: relative;
}

.placeholder::after {
    position: absolute;
    left: 10px;
    top: 2px;
    content: attr(data-placeholder);
    pointer-events: none;
    opacity: 0.5;
}
</style>
<script src="resources/jquery-3.5.1.min.js"></script>
<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<script type="text/javascript">


	function radiocheck() {
		var title=$("#title").val();
		if(!title) {
			alert("제목을 입력해주세요")
		} else {
			$("#form").submit;
		}
		
		var radio=$("input[name=room]:checked").val();
		console.log(radio);
	}
	
	function radiocheck2() {
		var mate_write_save=document.mate_write_save;
		var title=$("#title").val();
		if(!title) {
			alert("제목을 입력해주세요")
		} else {
			mate_write_save.submit();
		}
		var radio=$("input[name=room]:checked").val();
		console.log(radio);
	}

	function radiocheck3() {
		var mate_write_save=document.mate_write_save;
		var title=$("#title").val();
		if(!title) {
			alert("제목을 입력해주세요")
		} else {
			mate_write_save.submit();
		}
		var radio=$("input[name=room]:checked").val();
		console.log(radio);
	}
	
	//$("form").submit(
		//function() {
			//var title=$("#title").val();
			//if(!title) {
				//alert("제목을 입력해주세요")
			//}
		//}		
	//)
	
	$(document).ready(function() {
		$("form").submit(function(event) {
			var title=$("#title").val();
			if(!title) {
				alert("제목을 입력해주세요")
			}
			console.log(title)
		});
		$("#btn").click(function() {
			$("form").submit();
		})
	});
	
	$("#save").submit(function() {
		alert("hander for .submit() called");
	});
	
	//function foo() {
	//	alert("제출!")
	//}
	
	//jquery("#save").submit(
	//	function() {
		//	slert("서브밋!")
		//}		
	//)
	function write_save() {
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
		//$("input[name=mthema]:checked").each(function() {
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
			write_save_ok:write_save_ok
			}
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
<!-- 
else if(mtravel_date_s>mtravel_date_e||mtravel_date_s=="2000-01-01"||mtravel_date_e=="2000-01-01") {
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
					} 

 -->
</head>
<body>mate_write_view.jsp<br>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <!--<form id="form" action="mate_write_save00" method="post"  > -->
  <!--<form id="save" onsubmit="foo()" >-->
	
	* 모집 이누언, 글 내용을 제외한 모든 조건을 입력하셔야 합니다.
	<table id="write" border="1">
				 
				<tr> <td colspan="2"> < 여행 정보  > </td></tr>
				<tr> <td colspan="2"> 기간 <input type="date" name="mtravel_date_s" max="9999-12-31"> ~ <input type="date" name="mtravel_date_e" max="9999-12-31">
										<input type="radio" name="mtravel_date" value="예정" checked>예정
										<input type="radio" name="mtravel_date" value="확정">확정

										</td></tr>
				<tr> <td colspan="2"> 테마
									<input type="checkbox" class="mthema_chk" name="mthema" value="관광">관광
									<input type="checkbox" class="mthema_chk" name="mthema" value="휴양">	휴양  
									<input type="checkbox" class="mthema_chk" name="mthema" value="맛집 탐방">맛집 탐방  
									<input type="checkbox" class="mthema_chk" name="mthema" value="기타" >	기타
									</td></tr>
				 <tr> <td colspan="2"> 숙소 
									<input type="radio" name="mroom" value="상관없음" checked="checked">상관없음
									<input type="radio" name="mroom" value="개인실">개인실
									<input type="radio" name="mroom" value="다인실">다인실
									</td></tr>
				<tr> <td colspan="2"> 1일경비 
								<form>
									<input type="radio" id="chkNotPirce1" name="mexpenses" value="상관없음"  onclick="chkDisabled(this.form)" checked="checked">상관없음
									<input type="radio" id="chkprice" name="mexpenses" value="금액입력"   onclick="chkAbled(this.form)">금액입력
									<input type="number"  id="price1" name="price1" min="0" disabled  style = "text-align:right;">
									~
									<input type="number" id="price2" name="price2"  disabled  style = "text-align:right;">
									<div class="placeholder" data-placeholder="New placeholder"></div>
									<input type="radio" id="chkNotPirce2" name="mexpenses" value="추후결정"  onclick="chkDisabled(this.form)">추후결정
									</td></tr>
								</form>
				<tr> <td colspan="2"> < 여행 동행 조건  > </td></tr>
				<tr> <td colspan="2"> 성별
									<input type="radio" name="mgender" value="상관없음" checked >상관없음
									<input type="radio" name="mgender" value="여자">여자
									<input type="radio" name="mgender" value="남자">남자
									</td></tr>
				<tr> <td colspan="2"> 나이 
									<input type="checkbox" id="mage1" name="mage" value="20대">20대
									<input type="checkbox" id="mage2" name="mage" value="30대">30대
									<input type="checkbox" id="mage3" name="mage" value="40대">40대
									<input type="checkbox" id="mage4" name="mage" value="50대">50대
									<input type="checkbox" id="mage5" name="mage" value="60대이상">60대이상
									</td>   </tr>
				<tr> <td colspan="2"> 모집 인원
									<input type="number" id="mcnt" name="mcnt" style = "text-align:right;">명</td></tr>
									
				<tr> <td>제목</td> <td><input type="text" id="title" name="title" size="100" autofocus ></td> </tr>
				
				<tr> <td>내용</td> <td><textarea id="content" name="content" rows="10" cols="100"></textarea></td> </tr>
				  <!--  <script>CKEDITOR.replace('content');</script>-->
				
				<tr> <td>닉네임</td> <td><%=session.getAttribute("loginNick") %></td> </tr>
				<!-- <tr> <td>성별</td> <td><input type="text" name="gender"  ></td> </tr>
				<tr> <td>나이</td> <td><input type="text" name="age"  ></td> </tr>  -->
				<tr> <td colspan="2">
				<c:choose>
					<c:when test="">
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				<!--  <script type="text/javascript">
				var title=$("#title").val();
				if(!title) {
					alert("제목을 입력해주세요adsfasdfasdf")
				} 
				</script> -->
				
				<button onclick="write_save()">아작스</button>
				<input type="submit" vlaue="저장" >&nbsp;&nbsp;
				
				<button>asfasdfsdfadsf </button>
				
				
				<input type="button" onclick="radiocheck()" value="저장22222222">
				<input type="submit" onclick="radiocheck3()" value="저장3">
				<button id="btn">전송4</button>
				<input type="submit" value="GO">
				<a href="mate_board_list">목록보기</a></td> </tr>
	</table>
	 <!--</form>  -->
	 <!-- 실시간검사 -->
	 <!--<script type="text/javascript"> 
	 	document.getElementById('price2').onkeyup=function() {
	 		var val=this.value;
	 		if(val<=$('input[name=price1]').val()) {
	 			alert("ddddf")
	 		}
	 	}-->
	 	 <script type="text/javascript"> 
		 	$("input:checkbox[id=mage_n]").click(function() {
				   // debugger;
				    //var customerNumber2 = $(this).val();
				    //alert(customerNumber2);
				     
				    //alert("checkbox click");
				   $("input:checked[id=mage]").each(function() {
				    if (customerNumber2 != $(this).val()) {
				     $(this).attr("checked", false); // uncheck all checkboxes
				     //alert("checked checkbox false");
				    }
				   });
				}); 
	 	 
	 	 
	 	//document.getElementById('chkprice').onkeyup=function () {
	 		//var val=this.value;
	 		//if(val.is(":checked") {
	 			//alert("ddddf")
	 		//}
	 		//if(val.chkbox.checked==ture) {
	 		//}
	 	//}
	 </script>
	 
	 <script type="text/javascript">
	// for (var i=1;i<=5;i++) {
		 
	 	//$("#mage"+i).click(function() {
	 	//var tf=$("input:checkbox[id=mage"+i+"]").is(":checked")
	 	//alert(tf)

	 	//var magechk=$("#mage").prop("chekced",true);
			   // debugger;
			   // var customerNumber = $(this).val();
			    //alert(customerNumber);
			    //alert("checkbox click");
			   // var chk=document.getElementById("mage")
			  // var chk=$("#mage").val();
			   // var chkResult=chk.getAttribute("checked")
			    //alert(magechk)
			    
			  //  for(var i=0;i<chk.length;i++) {
			   // if(chk[i].checked) {
			   // $("#mage_n").prop("checked", false);
			   
			    //}
			    	
			   // }
		//	});  
	// }
	 
	 
	 
	 </script>

	 <script type="text/javascript">
	//$("#mage"+i).click(function() {
	//		var c=document.getElementByName("mage")
		//for(int i=0;i<c.length;i++) {
			//	if(c[i].checked==false) {
			//		alert("안쳌")
			//	} else {
				//	alert("쳌")
				//}
			//}
		//}
	 
	 </script>
	 
	 
	 <!--  
	 <script type="text/javascript">
	 //	$(document).ready(funcion() {
	 		//$("input[name=expenses]").click(function() {
	 		//	if($("input[name=price1]").attr("disabled")) {
	 				//$("input[name=price1]").attr("disabled",false);
	 			//} eles {
	 				//$("input[name=price1]").attr("disabled",true);
	 			//}
	 		//})
	 	//})
	  
	 	
	 	//function chkchk(intChkNum) {
		// var obj=document.getElementsByName("mexpenses");
		// for(var i=0;i<obj.length;i++) {
			// if(obj[i]!=chk){
			//	 obj[i].checked=false;
			// }
		 //}
	// }
	 -->
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