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
	comment_html += "<tr><input type='hidden' id='numgroup' value='${info_post.num }'>"
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
		html += "<tr><input type='hidden' id='numgroup' value='${info_post.num }'>"
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
				url : "info_comment_save",
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
				url : "info_comment_modify",
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
			url : "info_comment_delete",
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
			url : "comment_delete_admin",
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
			url : "info_comment_reply_save",
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
	// 추천
	function come(cnt) {
		var cnum = $("#recnum" + cnt).val();
		var form = { 
			cnum : cnum,
		}
		$.ajax({
			url : "sssssssss",
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
<body onload="chk_loginUser()" class="is-preload" id="top">
	<%@ include file="../defualt/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<form action="info_rewrite?num=${info_post.num }" method="post">
						<input type="hidden" value="${info_post.num }" name="num">
						<table id="post_table" style="width: 1070px; ">
							<tr>
								<td colspan="4">
									[${info_post.tag }] ${info_post.title }
								</td>
							</tr>
							<tr>
								<td colspan="2">
								${info_post.nick } | 
								<span id="post_recommend">
								<img src="resources/main_image/heart.png" style="width:25px; vertical-align: middle; opacity: 0.5;" onclick="">
								${info_post.recommend }
								</span>
								</td>
								<fmt:formatDate  var="postsavedate" value="${info_post.savedate}" pattern="yyyy-MM-dd hh:mm"/>
								<td colspan="2" style="text-align: right;">${postsavedate } | 조회 ${info_post.hit }</td>
							</tr>
							<tr>
								<td colspan="4" style="background: white ;">
									${info_post.content }
								</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left ;">
									<input type="button" value="목록보기" onclick="location.href='info_list?page=1'">	
									<span id="show_hide">
										<input type="button" value="댓글보기" onclick="comment_table_show()">	
									</span>
								</td>
								<td colspan="2" style="text-align: right;">
									<c:choose>
									<c:when test="${info_post.content == loginUser.nick}">
										<input type="button" value="수정" onclick="location.href='info_rewrite?num=${info_post.num }'">
										<input type="button" value="삭제" onclick="location.href='info_delete?num=${info_post.num }'">
									</c:when>
									<c:when test="${loginUser.id=='admin'}">
										<input type="button" value="삭제" onclick="location.href='info_delete?num=${info_post.num }'">
									</c:when>
									</c:choose>
								</td>
							</tr>
						</table>
						<!-- 댓글 영역 -->
						<table id="comment_table" style="display:none;font-size:0.9em; text-align: center;width: 1070px; margin: 0 auto; height : 60px; background-color: white;">
							<tr>
								<input type="hidden" id="numgroup" value="${info_post.num }">
								<input type="hidden" id="nick" placeholder="닉네임" value="${loginUser.nick}">
								<td colspan="3"><textarea rows="3" cols="50" id="content"></textarea></td>
								<td><input type="button" value="댓글달기" onclick="comment_save()"></td>
							</tr>
							<c:set var="cnt" value="0" />
							<c:forEach items="${comment_list}" var="com">
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
					</form>	
				</div>
			</section>
		</article>
	</div>
	
	<%@ include file="../defualt/footer.jsp"%>

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