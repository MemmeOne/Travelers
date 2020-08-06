<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>${info_post.title }</title>
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
	//function chk_loginUser() {
	//	if ('${loginUser}' == "") {
	//		alert("로그인 후 사용 가능합니다.")
	//		location.href="login"
	//	}else {
	//		console.log("로그인 확인 성공")
	//	}
	//}
	// 댓글 틀
	var comment_html=""
	comment_html += "<tr><input type='hidden' id='bnum' value='${ccc.num }'>"
	comment_html += "<input type='hidden' id='nick' placeholder='닉네임' value='${loginUser.nick}'>"
	comment_html += "<td colspan='3'><textarea rows='3' cols='50' id='reply'></textarea></td>"
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
		html += "<tr><input type='hidden' id='bnum' value='${ccc.num }'>"
		html += "<input type='hidden' id='nick' placeholder='닉네임' value='${loginUser.nick}'>"
		html += "<td colspan='3'><textarea rows='3' cols='50' id='reply'></textarea></td>"
		html += "<td><input type='button' value='댓글달기' onclick='comment_save()'></td></tr>"
		$.each(list, function(index,item) {
			html += "<tr id='modify"+cnt+"'>"
			html += "<input type='hidden' id='rnum"+cnt+"' value='"+item.rnum+"'>"
			html += "<input type='hidden' id='nick"+cnt+"' value='"+item.nick+"'>"
			html += "<input type='hidden' id='reply"+cnt+"' value='"+item.reply+"'>"
			html += "<input type='hidden' id='bnum"+cnt+"' value='"+item.bnum+"'>"
			html += "<input type='hidden' id='rgroup"+cnt+"' value='"+item.rgroup+"'>"
			html += "<input type='hidden' id='step"+cnt+"' value='"+item.step+"'>"
			html += "<input type='hidden' id='savetime"+cnt+"' value='"+item.savetime+"'>"
			if(item.step>0) {
				html += "<td style='text-align: center; width:18px;'>"
				html += "<img src='resources/main_image/reply.png' style='width:18px; vertical-align: middle;'>"
				html += "</td><td style='text-align: center;' id='modify_nick"+cnt+"'>"
				html += item.nick+"<br>"
				html += "<span style='font-size: 10pt;' id='modify_savetime"+cnt+"'>"+item.savetime+"</span></td>"
				console.log(item.reply)
				if("${loginUser.id}"=="admin"){
					html += "<td id='modify_reply"+cnt+"' style='text-align: left;'>"+item.reply+"</td>"
					html += "<td><div id='box'><div>"
					html += "<img src='resources/main_image/delete.png' onclick='comment_delete_admin("+cnt+")' style='width:18px; vertical-align: middle;'>"
					html += "<p class='arrow_box'>삭제</p></div></div></td>"
				} else if(item.nick == "${loginUser.nick}") {
					html += "<td id='modify_reply"+cnt+"' style='text-align: left;'>"+item.reply+"</td>"
					html += "<td><div id='box'><div>"
					html += "<img src='resources/main_image/alter.png' onclick='comment_modify("+cnt+")' style='width:18px; vertical-align: middle;'>"
					html += "<p class='arrow_box'>수정</p></div><div>"
					html += "<img src='resources/main_image/delete.png' onclick='comment_delete("+cnt+")' style='width:18px; vertical-align: middle;'>"
					html += "<p class='arrow_box'>삭제</p></div></div></td>"
				} else {
					html += "<td colspan='2' id='modify_reply"+cnt+"' style='width: 890px; text-align: left;'>"+item.reply+"</td>"
				}
			}else {
				html += "<td colspan='2' id='modify_nick"+cnt+"' style='text-align: center;'>"+item.nick+"<br>"
				html += "<span style='font-size: 10pt;'>"+item.savetime+"</span></td>"
				html += "<td id='modify_reply"+cnt+"' style='text-align: left;'>"+item.reply+"</td>"
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
		console.log("댓글저장버튼누름")
		var re=$("#reply").val();
		var savetime=$("#savetime").val();
		var step=$("#step").val();
		//$("#test").text(nick) // 출력안됨
		var form={  reply:re, step:step  }
		if(reply=="") {
			alert("댓글 내용을 입력하세요.")
			$("#reply").focus()
		}else{
			$.ajax({
				url : "mate_reply_save",
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
		html += "<input type='hidden' id='rnum"+cnt+"' value='"+$("#rnum"+cnt).val()+"'>"
		html += "<input type='hidden' id='nick"+cnt+"' value='"+$("#nick"+cnt).val()+"'>"
		html += "<td colspan='3'><textarea rows='3' cols='50' id='reply"+cnt+"'>"+$("#reply"+cnt).val()+"</textarea></td>"
		html += "<input type='hidden' id='bnum"+cnt+"' value='"+$("#bnum"+cnt).val()+"'>"
		html += "<input type='hidden' id='rgroup"+cnt+"' value='"+$("#rgroup"+cnt).val()+"'>"
		html += "<input type='hidden' id='step"+cnt+"' value='"+$("#step"+cnt).val()+"'>"
		html += "<td><input type='button' value='수정완료' onclick='comment_modify_save("+cnt+")'><br>"
		html += "<input type='button' value='취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소' onclick='comment_modify_save("+cnt+")'></td>"
		$("#modify"+cnt).html(html)
	}
	// 수정한 댓글 저장
	function comment_modify_save(cnt) {
		var bnum=$("#bnum"+cnt).val();
		var rnum=$("#rnum"+cnt).val();
		var rgroup = $("#rgroup" + cnt).val();
		//var nick=$("#nick" + cnt).val();
		var reply=$("#reply" + cnt).val();
		var savetime=$("#savetime" + cnt).val();
		console.log("CNT : "+cnt)
		//console.log("nick : "+nick)
		console.log("bnum : "+bnum)
		console.log("rnum : "+rnum)
		var form={bnum:bnum, rnum:rnum, rgroup:rgroup,reply:reply,rnum:rnum  }
		if(reply=="") {
			alert("댓글 내용을 입력하세요.")
			$("#reply" + cnt).focus()
		}else{
			$.ajax({
				url : "mate_reply_modify_save",
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
		var bnum=$("#bnum"+cnt).val();
		var rnum=$("#rnum"+cnt).val();
		console.log(rnum);
		console.log(cnt);
		var nick=$("#nick"+cnt).val();
		var reply=$("#reply"+cnt).val();
		var form={bnum:bnum, rnum:rnum, nick:nick, reply:reply}
		$.ajax({
			url : "mate_reply_delete",
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
		var bnum=$("#bnum"+cnt).val();
		var rnum=$("#rnum"+cnt).val();
		console.log(rnum);
		console.log(cnt);
		var nick=$("#nick"+cnt).val();
		var reply=$("#reply"+cnt).val();
		var form={bnum:bnum, rnum:rnum, nick:nick, reply:reply}
		$.ajax({
			url : "mate_reply_delete_admin",
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
		console.log("대댓글 툴")
		var bnum=$("#bnum"+cnt).val();
		var rnum=$("#rnum"+cnt).val();
		var nick=$("#nick"+cnt).val();
		var reply=$("#reply"+cnt).val();
		var step=$('#step'+cnt).val() + 1;
		var rgroup=$('#rgroup'+cnt).val();
		let html=""
		html += "<input type='hidden' id='rernum"+cnt+"' value='"+rnum+"'>"
		html += "<input type='hidden' id='rebnum"+cnt+"' value='"+bnum+"'>"
		html += "<input type='hidden' id='rergroup"+cnt+"' value='"+rgroup+"'>"
		html += "<input type='hidden' id='restep"+cnt+"' value='"+step+"'>"
		html += "<input type='hidden' id='renick"+cnt+"' value='"+nick+"'>"
		html += "<td colspan='3'><textarea rows='3' cols='50' id='rereply"+cnt+"'></textarea></td><td>"
		html += "<input type='button' value='댓글달기' onclick='comment_reply_save("+cnt+")'></td>"
		$("#reply"+cnt).html(html)
	}
	// 대댓글 저장
	function comment_reply_save(cnt) {
		var bnum=$("#rebnum"+cnt).val();
		var rnum=$("#rernum"+cnt).val();
		var nick=$("#renick"+cnt).val();
		var reply=$("#rereply"+cnt).val();
		var rgroup=$("#rergroup"+cnt).val();
		var step=$('#restep'+cnt).val();
		var form={bnum:bnum, rnum:rnum, nick:nick, reply:reply, rgroup:rgroup, step:step}
		$.ajax({
			url : "mate_reply_reply_save",
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
</head>
<body  class="is-preload" id="top">
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
						<!-- 댓글 영역 -->
						<table id="comment_table" style=" font-size:0.9em; text-align: center;width: 1070px; margin: 0 auto; height : 60px; background-color: white;">
							<tr>
								<input type="hidden" id="nick" placeholder="닉네임" value="${loginUser.nick}">
								<td colspan="3"><textarea rows="3" cols="50" id="reply"></textarea></td>
								<td><input type="button" value="댓글달기" onclick="comment_save()"></td>
							</tr>
							<c:set var="cnt" value="0" />
							<c:forEach items="${mate_reply_list }" var="com">
			<input type="hidden" id="rnum${cnt}" value="${com.rnum}">
			<input type="hidden" id="bnum${cnt}" value="${com.bnum}">
		 	<input type="hidden" id="nick${cnt}" value="${com.nick}">
		 	<input type="hidden" id="reply${cnt}" value="${com.reply}">
		 	<input type="hidden" id="savetime${cnt}" value="${com.savetime}">
		 	<input type="hidden" id="rgroup${cnt}" value="${com.rgroup}">
		 	<input type="hidden" id="step${cnt}" value="${com.step}">
			<fmt:formatDate var="savetime" value="${com.savetime}" pattern="yyyy-MM-dd hh:mm" />
								<tr id="modify${cnt}">
								
									<c:choose>
										<c:when test="${com.step>0}">
											<td style="text-align: center; width:18px;">
												<img src="resources/main_image/reply.png" style="width:18px; vertical-align: middle;">
											</td>
											<td style="text-align: center;" id="modify_nick${cnt}">
												${com.nick}<br>
												<span style="font-size: 10pt;" id="modify_saveime${cnt}">${savetime}</span>
											</td>
											
											
											
											<c:choose>
											
												<c:when test="${loginUser.nick=='admin'}">
													<td id="modify_reply${cnt}" style="text-align: left;">${com.reply}</td>
													<td>
														<div id="box">
															<div>
																<img src="resources/main_image/delete.png" onclick="comment_delete_admin(${cnt})" style="width:18px; vertical-align: middle;">
																<p class="arrow_box">삭제</p>
															</div>
														</div>
													</td>
												</c:when>
												
												<c:when test="${com.nick == loginNick}">
													<td id="modify_reply${cnt}" style="text-align: left;">${com.reply}</td>
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
													<td colspan="2" id="modify_reply${cnt}" style="width: 890px; text-align: left;">${com.reply}</td>
												</c:otherwise>
												
											</c:choose>
											
											
										</c:when>
										
										
										
										
										
										<c:otherwise>
											<td colspan="2" id="modify_nick${cnt}" style="text-align: center;">${com.nick}<br>
												<span style="font-size: 10pt;">${savetime}</span>
											</td>
											<td id="modify_reply${cnt}" style="text-align: left;">${com.reply}</td>
											<c:choose>
												<c:when
													test="${loginNick=='admin'}">
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
												<c:when test="${com.nick == loginNick}">
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
				</div>
			</section>
		</article>
	</div>
	

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