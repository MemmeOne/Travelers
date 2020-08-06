<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">
#box {
    text-align: center;
}
#box div {
    position: relative;
    display: inline-block;
}
#box div div img {
    display: block;
    cursor: pointer;
}
.arrow_box {
  display: none;
  position: absolute;
  width: 50px;
  padding: 8px;
  left: 0;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;  
  border-radius: 8px;
  background: #333;
  color: #fff;
  font-size: 12px;
}

.arrow_box:after {
  position: absolute;
  bottom: 100%;
  left: 8%;
  width: 0;
  height: 0;
  margin-top: 20px;
  border: solid transparent;
  border-color: rgba(46, 56, 66, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: " ";
}

div img:hover + p.arrow_box {
  display: block;
}
</style>
<script src="resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function chk_loginUser() {
		if ('${loginUser}' == "") {
			alert("로그인 후 사용 가능합니다.")
			location.href="login"
		}else {
			console.log("로그인 확인 성공")
		}
	}
	// 댓글 틀
	var comment_html=""
	comment_html += "<tr><input type='hidden' id='numgroup' value='${ccc.num }'>"
	comment_html += "<input type='hidden' id='nick' placeholder='닉네임' value='${loginUser.nick}'>"
	comment_html += "<td colspan='3'><textarea rows='3' cols='50' id='content'></textarea></td>"
	comment_html += "<td><input type='button' value='댓글달기' onclick='comment_save()'></td></tr>"

	//댓글 보이기
	function comment_table_show() {
		$("#comment_table").show();
		html="<input type='button' value='댓글숨기기' onclick='comment_table_hide()'>"
		$("#show_hide").html(html)
	}
	// 댓글 숨기기
	function comment_table_hide() {
		$("#comment_table").hide();
		html="<input type='button' value='댓글보기' onclick='comment_table_show()'>"
		$("#show_hide").html(html)
	}
	// 댓글 리스트 틀
	function showComment(list) {
		var cnt=1;
		let html=""
		html += "<tr><input type='hidden' id='numgroup' value='${ccc.num }'>"
		html += "<input type='hidden' id='nick' placeholder='닉네임' value='${loginUser.nick}'>"
		html += "<td colspan='3'><textarea rows='3' cols='50' id='content'></textarea></td>"
		html += "<td><input type='button' value='댓글달기' onclick='comment_save()'></td></tr>"
		$.each(list, function(index,item) {
			html += "<tr id='modify"+cnt+"'>"
			html += "<input type='hidden' id='cnum"+cnt+"' value='"+item.cnum+"'>"
			html += "<input type='hidden' id='nick"+cnt+"' value='"+item.nick+"'>"
			html += "<input type='hidden' id='content"+cnt+"' value='"+item.content+"'>"
			html += "<input type='hidden' id='numgroup"+cnt+"' value='"+item.numgroup+"'>"
			html += "<input type='hidden' id='commentgroup"+cnt+"' value='"+item.commentgroup+"'>"
			html += "<input type='hidden' id='step"+cnt+"' value='"+item.step+"'>"
			html += "<input type='hidden' id='savedate"+cnt+"' value='"+item.savedate+"'>"
			if(item.step>0) {
				html += "<td style='text-align: center; width:18px;'>"
				html += "<img src='resources/main_image/reply.png' style='width:18px; vertical-align: middle;'>"
				html += "</td><td style='text-align: center;' id='modify_nick"+cnt+"'>"
				html += item.nick+"<br>"
				html += "<span style='font-size: 10pt;' id='modify_savedate"+cnt+"'>"+item.savedate+"</span></td>"
				console.log(item.content)
				if("${loginUser.id}"=="admin"){
					html += "<td id='modify_content"+cnt+"' style='text-align: left;'>"+item.content+"</td>"
					html += "<td><div id='box'><div>"
					html += "<img src='resources/main_image/delete.png' onclick='comment_delete_admin("+cnt+")' style='width:18px; vertical-align: middle;'>"
					html += "<p class='arrow_box'>삭제</p></div></div></td>"
				} else if(item.nick == "${loginUser.nick}") {
					html += "<td id='modify_content"+cnt+"' style='text-align: left;'>"+item.content+"</td>"
					html += "<td><div id='box'><div>"
					html += "<img src='resources/main_image/alter.png' onclick='comment_modify("+cnt+")' style='width:18px; vertical-align: middle;'>"
					html += "<p class='arrow_box'>수정</p></div><div>"
					html += "<img src='resources/main_image/delete.png' onclick='comment_delete("+cnt+")' style='width:18px; vertical-align: middle;'>"
					html += "<p class='arrow_box'>삭제</p></div></div></td>"
				} else {
					html += "<td colspan='2' id='modify_content"+cnt+"' style='width: 890px; text-align: left;'>"+item.content+"</td>"
				}
			}else {
				html += "<td colspan='2' id='modify_nick"+cnt+"' style='text-align: center;'>"+item.nick+"<br>"
				html += "<span style='font-size: 10pt;'>"+item.savedate+"</span></td>"
				html += "<td id='modify_content"+cnt+"' style='text-align: left;'>"+item.content+"</td>"
				if ("${loginUser.id}"=="admin"){
					html += "<td>"
					html += "<div id='box'><div>"
					html += "<img src='resources/main_image/delete.png' onclick='comment_delete_admin("+cnt+")' style='width:18px; vertical-align: middle;'>"
					html += "<p class='arrow_box'>삭제</p></div></div>"
					html += "<input type='button' value='댓글달기' onclick='comment_reply("+cnt+")'></td>"
				} else if(item.nick == "${loginUser.nick}") {
					html += "<td><input type='button' value='댓글달기' onclick='comment_reply("+cnt+")'>"
					html += "<div id='box'><div>"
					html += "<img src='resources/main_image/alter.png' onclick='comment_modify("+cnt+")' style='width:18px; vertical-align: middle;'>"
					html += "<p class='arrow_box'>수정</p></div><div>"
					html += "<img src='resources/main_image/delete.png' onclick='comment_delete("+cnt+")' style='width:18px; vertical-align: middle;'>"
					html += "<p class='arrow_box'>삭제</p></div></div></td>"
				} else {
					html += "<td><input type='button' value='댓글달기' onclick='comment_reply("+cnt+")'>"
					html += "</td>"
				}
				html += "</tr><tr id='reply"+cnt+"'></tr>"
			}
			cnt++;
		})
		html += "<tr style='border: none;background: white;'>"
		html += "<td style='width:30px;'></td>"
		html += "<td style='width:180px;'></td>"
		html += "<td style='width:680px;'><br>"
		html += "<a href='#top'><img src='resources/main_image/top.png' style='width:18px; vertical-align: middle;'>&nbsp;TOP</a><br><br></td>"
		html += "<td style='width:180px;'></td></tr>"
		$("#comment_table").html(html)
	}
	// 댓글 저장
	function comment_save() {
		var nick = $("#nick").val();
		var content = $("#content").val();
		var numgroup = $("#numgroup").val();
		var step = $("#step").val();
		var form = {
			nick : nick,
			content : content,
			numgroup : numgroup,
			step : step,
		}
		if(content=="") {
			alert("댓글 내용을 입력하세요.")
			$("#content").focus()
		}else{
			$.ajax({
				url : "mate_comment_save",
				type : "POST",
				data : form,
				success : function(list) {
					showComment(list);
					console.log("성공")
				},
				error : function(request, status, error) {
					console.log("실패")
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			})
		}
	}
	// 댓글 수정 틀
	function comment_modify(cnt) {
		let html=""
		html += "<input type='hidden' id='cnum"+cnt+"' value='"+$("#cnum"+cnt).val()+"'>"
		html += "<input type='hidden' id='nick"+cnt+"' value='"+$("#nick"+cnt).val()+"'>"
		html += "<td colspan='3'><textarea rows='3' cols='50' id='content"+cnt+"'>"+$("#content"+cnt).val()+"</textarea></td>"
		html += "<input type='hidden' id='numgroup"+cnt+"' value='"+$("#numgroup"+cnt).val()+"'>"
		html += "<input type='hidden' id='commentgroup"+cnt+"' value='"+$("#commentgroup"+cnt).val()+"'>"
		html += "<input type='hidden' id='step"+cnt+"' value='"+$("#step"+cnt).val()+"'>"
		html += "<td><input type='button' value='수정완료' onclick='comment_modify_save("+cnt+")'><br>"
		html += "<input type='button' value='취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소' onclick='comment_modify_save("+cnt+")'></td>"
		$("#modify"+cnt).html(html)
	}
	// 수정한 댓글 저장
	function comment_modify_save(cnt) {
		var cnum = $("#cnum"+cnt).val();
		var nick = $("#nick" + cnt).val();
		var content = $("#content" + cnt).val();
		var numgroup = $("#numgroup" + cnt).val();
		var commentgroup = $("#commentgroup" + cnt).val();
		var step = $("#step" + cnt).val();
		var form = { 
			cnum : cnum,
			numgroup : numgroup, 
			commentgroup : commentgroup, 
			nick : nick, 
			content : content,
			step : step
		}
		if(content=="") {
			alert("댓글 내용을 입력하세요.")
			$("#content" + cnt).focus()
		}else{
			$.ajax({
				url : "mate_comment_modify",
				type : "POST",
				data : form,
				success : function(list) {
					showComment(list);
					console.log("성공")
				},
				error : function(request, status, error) {
					console.log("실패")
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			})
		}
	}
	// 댓글 삭제
	function comment_delete(cnt) {
		var cnum = $("#cnum"+cnt).val();
		var nick = $("#nick" + cnt).val();
		var content = $("#content" + cnt).val();
		var numgroup = $("#numgroup" + cnt).val();
		var commentgroup = $("#commentgroup" + cnt).val();
		var step = $("#step" + cnt).val();
		var form = { 
			cnum : cnum,
			numgroup : numgroup, 
			commentgroup : commentgroup, 
			nick : nick, 
			content : content,
			step : step
		}
		$.ajax({
			url : "mate_comment_delete",
			type : "POST",
			data : form,
			success : function(list) {
				showComment(list);
				console.log("성공")
			},
			error : function(request, status, error) {
				console.log("실패")
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}
	// 댓글 삭제
	function comment_delete_admin(cnt) {
		var cnum = $("#cnum"+cnt).val();
		var nick = $("#nick" + cnt).val();
		var content = $("#content" + cnt).val();
		var numgroup = $("#numgroup" + cnt).val();
		var commentgroup = $("#commentgroup" + cnt).val();
		var step = $("#step" + cnt).val();
		var form = { 
			cnum : cnum,
			numgroup : numgroup, 
			commentgroup : commentgroup, 
			nick : nick, 
			content : content,
			step : step
		}
		$.ajax({
			url : "mate_comment_delete_admin",
			type : "POST",
			data : form,
			success : function(list) {
				showComment(list);
				console.log("성공")
			},
			error : function(request, status, error) {
				console.log("실패")
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}
	// 대댓글 틀
	function comment_reply(cnt) {
		var num=$('input[name=num]').val();
		var cnum=$('#cnum'+cnt).val();
		var commentgroup=$('#commentgroup'+cnt).val();
		var step=$('#step'+cnt).val() + 1;
		var nick='${loginUser.nick}'
		let html=""
		html += "<input type='hidden' id='recnum"+cnt+"' value='"+cnum+"'>"
		html += "<input type='hidden' id='renumgroup"+cnt+"' value='"+num+"'>"
		html += "<input type='hidden' id='recommentgroup"+cnt+"' value='"+commentgroup+"'>"
		html += "<input type='hidden' id='restep"+cnt+"' value='"+step+"'>"
		html += "<input type='hidden' id='renick"+cnt+"' value='"+nick+"'>"
		html += "<td colspan='3'><textarea rows='3' cols='50' id='recontent"+cnt+"'></textarea></td><td>"
		html += "<input type='button' value='댓글달기' onclick='comment_reply_save("+cnt+")'></td>"
		$("#reply"+cnt).html(html)
	}
	// 대댓글 저장
	function comment_reply_save(cnt) {
		var cnum = $("#recnum" + cnt).val();
		var nick = $("#renick" + cnt).val();
		var content = $("#recontent" + cnt).val();
		var numgroup = $("#renumgroup" + cnt).val();
		var commentgroup = $("#recommentgroup" + cnt).val();
		var step = $("#restep" + cnt).val();
		var form = { 
			cnum : cnum,
			nick : nick, 
			content : content,
			numgroup : numgroup, 
			commentgroup : commentgroup, 
			step : step
		}
		$.ajax({
			url : "mate_comment_reply_save",
			type : "POST",
			data : form,
			dataType: "json",
			success : function(list) {
				showComment(list);
				console.log("성공")
			},
			error : function(request, status, error) {
				console.log("실패")
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}
 
</script>













<style type="text/css">
</style>
<style type="text/css">
#mate_content_view {border-collapse:collapse; }
#here{display:none;}
#h{display:none;}
</style>
<script src="resources/jquery-3.5.1.min.js"></script>











<script type="text/javascript">
function show() {
	$("#here").show();
	$("#s").hide();
	$("#h").show();
}
function hide() {
	$("#s").show();
	$("#here").hide();
	$("#h").hide();
}
		function deadlineChk() {
			console.log("deadlineChk() 함수 시작부분")
			var deadline=1;
			$.ajax({
				url:"deadline_finish",
				type:"POST",
				data:deadline,
				success:function(data) {
					console.log("동행 구하기 마감 성공")
				},
				error:function(request, status, error) {
					console.log("실패");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
			}) 
		}

		//function modify(${ccc.num}) {
		//	location.href="mate_content_modify?num=${ccc.num }";
		//}
		
		function modify2() {
			return true;
		}
		function d() {
			//frm.action="deadline";
			//frm.submit();
			//return tr
				location.href="deadline";
		}
		
		



</script>
<script>
		   // 글 신고
		   function report_post() {
		      var content=prompt("신고 사유를 입력해주세요."+"");
		      var board = "info_board";
		      var num = "${info_post.num }"
		      var title = "[${info_post.tag }] ${info_post.title }"
		      var writer = "${info_post.nick }"
		      var usernick = "${loginUser.nick }"
		      console.log(board)
		      console.log(num)
		      console.log(title)
		      console.log(content)
		      console.log(writer)
		      console.log(usernick)
		      if(content==null) {
		         alert("신고를 취소합니다.")
		      }else if(content=="") {
		         alert("신고 사유를 입력하지 않아 신고를 취소합니다.\n다시 시도해주세요.")
		      }else if(usernick=="") {
		         alert("로그인 후 사용가능합니다.")
		         location.href="login"
		      }else {
		         var form = {
		            board:board,
		            num:num,
		            title:title,
		            content:content,
		            writer:writer,
		            usernick:usernick
		         }
		         $.ajax({
		            url : "report",
		            type : "POST",
		            data : form,
		            dataType: "json",
		            success : function(list) {
		               console.log(list)
		               if(list=="신고 성공") {
		                  console.log("성공");
		                  alert("해당 게시글을 신고하였습니다.")
		               }else if(list=="신고 실패") {
		                  console.log("실패");
		                  alert("이미 해당 게시글을 신고하였습니다.")
		               }else {
		                  console.log("실패");
		                  alert("오류로 인해 신고에 실패하였습니다.")
		               }
		            },
		            error : function(request, status, error) {
		               console.log("실패")
		               alert("code:" + request.status + "\n" + "message:"
		                     + request.responseText + "\n" + "error:" + error);
		            }
		         });
		      }
		   }
</script>


<!--  <script type="text/javascript">

	function reply() {
		$.ajax({
			url:"reply_area",
			success:function() {   console.log("성공"); },
			error:function() { alert("reply 문제 발생") }	
		})
	}
	function rep() {
		let html="<table border='1'>";
		html+="<tr><th>닉네임</th></tr>";
		html+="</table>";
		$("#reply_area").html(html)
	}
	
	function reprep() {
		$.ajax( {
			url:"reply_area_b", 
			success:function() { $("#reply_area_b").text(); console.log("reply_area_b 성공");  },
			error:function() { alert("reply_area_b문제 발생") }	
	
		})
	}
	
	function replyyy() {
		var num=$("#num").val();
		var nick=$("#nick")
	}


</script>-->
</head>
<body class="is-preload"  >

	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ include file="../default/header.jsp"%>
	<!-- Page Wrapper -->
 
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
				<form action="mate_content_modify"> 
	
				<table class="all_white" id="whiteline" border="0">
					<tr>
						<td><h4> >> 여행 동행 찾기 </h4></td>
						<td>
						<c:choose>
							<c:when test="${ccc.deadline  eq '모집중' }">
								<img alt="" src="resources/main_image/RecruitmentInProgress.png" style="width: 300px; ">
							</c:when>
							<c:otherwise>
									<img alt="" src="resources/main_image/RecruitmentComplete.png" style="width: 300px; ">
							</c:otherwise>
						</c:choose>
						</td>
						<TD> ${ccc.deadline }
						</TD>
					</tr>
				
				</table>
					<table  id="mate_content_view" style=" width: 1070px; margin: 0 auto;font-size:0.9em;">
						<tr>
							<td colspan="2" style="background-color:transparent">
								[${ccc.mthema}]  ${ccc.title}
							</td>
							<td colspan="2" style="text-align: right;">작성일  
							
										<c:set var="cdate" value="${cdate }"/>
										<c:set var="today" value="${cdate_today }"/>
										<fmt:formatDate var="savedate" value="${ccc.savedate }" pattern="yyyy-MM-dd"/>
										<c:choose>
											<c:when test="${savedate eq cdate }">
												${today }
											</c:when>
											<c:otherwise>
												${cdate }
											</c:otherwise>
										</c:choose>		
							
						  |  조회 ${ccc.hit} </td>
						</tr>
						<table class="all_white" style=" width: 1070px; margin: 0 auto;font-size:0.8em;">
						<tr>
							<td colspan="2">
							<img alt="" src="resources/main_image/chk2.jpg" style="width: 30px; height: 20px;">
							 모집자 
							<img alt="" src="resources/main_image/writer.jpg" style=" height: 30px; vertical-align: middle;">
							 ${ccc.wnick}, ${ccc.wage }, ${ccc.wgender }
								<!-- <img src="resources/main_image/heart.png" style="width:28px; vertical-align: middle;"> -->
							</td><!-- style="text-align: right;" -->
								<td colspan="2" >
								<img alt="" src="resources/main_image/chk2.jpg" style="width: 30px; height: 20px;">
								동행자  
								<img alt="" src="resources/main_image/writer.jpg" style=" height: 30px; vertical-align: middle;">
								 성별 : ${ccc.mgender}, 나이 : ${ccc.mage}</td>
						</tr>


							<tr>
								<td style=" width: 130px; background-color:white">
								<img alt="" src="resources/main_image/chk2.jpg" style="width: 30px; height: 20px;">
								여행기간</td>
								<td style="   background-color:white" >
								${ccc.mtravel_date_s } ~ ${ccc.mtravel_date_e } (${ccc.mtravel_date })
								</td>
								<td style=" width: 130px;">
								<img alt="" src="resources/main_image/chk2.jpg" style="width: 30px; height: 20px;">
								숙소 </td>
								<td>${ccc.mroom }</td>
							</tr>

								<td>
								<img alt="" src="resources/main_image/chk2.jpg" style="width: 30px; height: 20px;">
								1일경비</td>
								<td>${ccc.mexpenses } <c:if test="${ccc.price1 ne 0 }">(${ccc.price1 }~${ccc.price2 })</c:if></td>
								<td>
								<img alt="" src="resources/main_image/chk2.jpg" style="width: 30px; height: 20px;">
								모집인원
								</td>
								<td>${ccc.mcnt }명</td>
							</tr>
						</table>
						<table class="all_white" style=" width: 1070px; margin: 0 auto;font-size:0.9em;">
						<tr>
							<td colspan="4" style="  background-color:white">
								내용 ${ccc.content}
							</td>
						</tr>
						<tr>
							<th  style="text-align: left ;">
								<input type="button" onclick="location.href='mate_board_list?page=1'" value="전체목록보기">
								<input type="button" value="신고" onclick="report_post()">	
								<label id="h">
										<input type="button" value="댓글숨기기" onclick="hide()">	
								</label>	
								<label id="s">
										<input type="button" value="댓글보기" onclick="show()">	
								</label>

							</th>
						<c:choose>
							<c:when test="${ccc.wnick eq loginUser.nick }">
								<th   style="text-align: right;">
									<input type="submit" value="수정"  >
									<input type="button" onclick="location.href='mate_content_delete?num=${ccc.num}'" value="삭제">	
									<input type="button" value="모집완료 " onclick="d()" <c:if test="${ ccc.deadline eq '모집완료'}" > disabled</c:if> >
								</th>
							</c:when>
							<c:when test="${admin eq '관리자' }">
								<th  style="text-align: right;">
									<input type="button" onclick="location.href='mate_content_delete?num=${ccc.num}'" value="삭제">	
									<input type="button" value="모집완료 " onclick="d()" >
								</th>
							</c:when>
						</c:choose>
						</tr>
					</table>
				</form>
				
			<!-- 댓글 영역 
						<table id="comment_table" style="display:none;font-size:0.9em; text-align: center;width: 1070px; margin: 0 auto; height : 60px; background-color: white;">
							<tr>
								<input type="hidden" id="numgroup" value="${ccc.num }">
								<input type="hidden" id="nick" placeholder="닉네임" value="${loginUser.nick}">
								<td colspan="3"><textarea rows="3" cols="50" id="content"></textarea></td>
								<td><input type="button" value="댓글달기" onclick="comment_save()"></td>
							</tr>
							<c:set var="cnt" value="0" />
							<c:forEach items="${mate_comment_list}" var="com">
								<input type="hidden" id="cnum${cnt}" value="${com.cnum}">
								<input type="hidden" id="nick${cnt}" value="${com.nick}">
								<input type="hidden" id="content${cnt}" value="${com.content }">
								<input type="hidden" id="numgroup${cnt}" value="${com.numgroup }">
								<input type="hidden" id="commentgroup${cnt}" value="${com.commentgroup }">
								<input type="hidden" id="step${cnt}" value="${com.step }">
								<input type="hidden" id="savedate${cnt}" value="${com.savedate}">
								<fmt:formatDate var="savedate" value="${com.savedate}" pattern="yyyy-MM-dd hh:mm" />
								<tr id="modify${cnt}">
								
									<c:choose>
										<c:when test="${com.step>0}">
											<td style="text-align: center; width:18px;">
												<img src="resources/main_image/reply.png" style="width:18px; vertical-align: middle;">
											</td>
											<td style="text-align: center;" id="modify_nick${cnt}">
												${com.nick}<br>
												<span style="font-size: 10pt;" id="modify_savedate${cnt}">${savedate}</span>
											</td>
											
											
											
											<c:choose>
											
												<c:when test="${loginUser.id=='admin'}">
													<td id="modify_content${cnt}" style="text-align: left;">${com.content}</td>
													<td>
														<div id="box">
															<div>
																<img src="resources/main_image/delete.png" onclick="comment_delete_admin(${cnt})" style="width:18px; vertical-align: middle;">
																<p class="arrow_box">삭제</p>
															</div>
														</div>
													</td>
												</c:when>
												
												<c:when test="${com.nick == loginUser.nick}">
													<td id="modify_content${cnt}" style="text-align: left;">${com.content}</td>
													<td>
														<div id="box">
															<div>
																<img src="resources/main_image/alter.png" onclick="comment_modify(${cnt})" style="width:18px; vertical-align: middle;">
																<p class="arrow_box">수정</p>
															</div>
															<div>
																<img src="resources/main_image/delete.png" onclick="comment_delete(${cnt})" style="width:18px; vertical-align: middle;">
																<p class="arrow_box">삭제</p>
															</div>
														</div>
													</td>
												</c:when>
												
												<c:otherwise>
													<td colspan="2" id="modify_content${cnt}" style="width: 890px; text-align: left;">${com.content}</td>
												</c:otherwise>
												
											</c:choose>
											
											
										</c:when>
										
										
										
										<c:otherwise>
											<td colspan="2" id="modify_nick${cnt}" style="text-align: center;">${com.nick}<br>
												<span style="font-size: 10pt;">${savedate}</span>
											</td>
											<td id="modify_content${cnt}" style="text-align: left;">${com.content}</td>
											<c:choose>
												<c:when
													test="${loginUser.id=='admin'}">
													<td>
														<div id="box">
															<div>
																<img src="resources/main_image/delete.png" onclick="comment_delete_admin(${cnt})" style="width:18px; vertical-align: middle;">
																<p class="arrow_box">삭제</p>
															</div>
														</div>
														<input type="button" value="댓글달기" onclick="comment_reply(${cnt})">
													</td>
												</c:when>
												<c:when test="${com.nick == loginUser.nick}">
													<td>
														<div id="box">
															<div>
																<img src="resources/main_image/alter.png" onclick="comment_modify(${cnt})" style="width:18px; vertical-align: middle;">
																<p class="arrow_box">수정</p>
															</div>
															<div>
																<img src="resources/main_image/delete.png" onclick="comment_delete(${cnt})" style="width:18px; vertical-align: middle;">
																<p class="arrow_box">삭제</p>
															</div>
														</div>
														<input type="button" value="댓글달기" onclick="comment_reply(${cnt})">
													</td>
												</c:when>
												<c:otherwise>
													<td>
														<input type="button" value="댓글달기" onclick="comment_reply(${cnt})">
													</td>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr id="reply${cnt}"></tr>
								<c:set var="cnt" value="${cnt+1}" />
							</c:forEach>
							<tr style="border: none;">
								<td style="width:30px;"></td>
								<td style="width:180px;"></td>
								<td style="width:680px;">
									<br><a href="#top"><img alt="" src="resources/main_image/top.png" style="width:18px; vertical-align: middle;">&nbsp;TOP</a><br><br>
								</td>
								<td style="width:180px;"></td>
							</tr>
						</table>		
				-->
				
				
					<label id="here">
				<%@ include file="mate_reply2.jsp"%>
				</label>
				
				</div>
			</section>
		</article>
	</div>

	<%@ include file="../default/footer.jsp"%>
	
	
	
	<style>
#comment_table  {
    width: 100%;
    border-top: 1px solid rgba(50, 50, 50, 0.2);
    border-collapse: collapse;
  }
#comment_table th, td {
	background-color: white;
    border-bottom: 1px solid rgba(50, 50, 50, 0.2);
    padding: 10px;
    margin: 10px;
  }
#comment_table td a {
	text-decoration: none;
  }
</style>
	
	
	
</body>
</html>