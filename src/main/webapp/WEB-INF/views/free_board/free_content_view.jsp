<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free_content_view</title>
<style type="text/css">
</style>
<script src="resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
// 댓글 틀
var comment_html=""
comment_html += "<tr><td colspan='4'>"
comment_html += "<input type='hidden' id='numgroup' value='${lists.num }'>"
comment_html += "<input type='hidden' id='step' value='0'>"
comment_html += "<input type='hidden' id='indent' value='0'>"
comment_html += "<input type='hidden' id='nick' value='${loginUser.nick}'>"
comment_html += "<input type='text' id='content'></td>"
//comment_html += "<textarea rows='3' cols='50' id='content'></textarea></td>"
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
	let html=comment_html
	var cnt=1;
	$.each(list, function(index,item) {
		html += "<tr id='modify"+cnt+"'>"
		if(item.step>0) {
			html += "<th> → </th>"
		}
		html += "<input type='hidden' id='cnum"+cnt+"' value='"+item.cnum+"'>"
		html += "<input type='hidden' id='nick"+cnt+"' value='"+item.nick+"'>"
		html += "<input type='hidden' id='content"+cnt+"' value='"+item.content+"'>"
		html += "<input type='hidden' id='numgroup"+cnt+"' value='"+item.numgroup+"'>"
		html += "<input type='hidden' id='step"+cnt+"' value='"+item.step+"'>"
		html += "<input type='hidden' id='commentgroup"+cnt+"' value='"+item.commentgroup+"'>"
		html += "<input type='hidden' id='savedate"+cnt+"' value='"+item.savedate+"'>"
		html += "<input type='hidden' id='step"+cnt+"' value='"+item.step+"'>"
		html += "<input type='hidden' id='indent"+cnt+"' value='"+item.indent+"'>"
		//html += "<th id='modify_cnum"+cnt+"'>"+item.cnum+"</th>"
		html += "<td colspan='2' style='text-align: center;width: 120px' id='modify_nick"+cnt+"'>"+item.nick+"<br>"
		html += "<span style='font-size: 10pt;' id='modify_savedate"+cnt+"'>"+item.savedate+"</span></td>"
		html += "<td id='modify_content"+cnt+"'>"+item.content+"</td>"
		html += "<td>"
		html += "<input type='button' value='수정' onclick='comment_modify("+cnt+")'>"
		html += "<input type='button' value='삭제' onclick='comment_delete("+cnt+")'>"
		html += "</td>"
		if(item.step==0) {
			html += "<td><input type='button' value='댓글달기' onclick='comment_reply("+cnt+")'></td>"
			html += "<tr id='reply"+cnt+"'></tr>"
		}
		cnt++;
	})
	$("#comment_table").html(html)
}
// 댓글 저장
function comment_save() {
	var nick = $("#nick").val();
	var content = $("#content").val();
	var numgroup = $("#numgroup").val();
	var step = $("#step").val();
	var indent = $("#indent").val();
	var form = {
		nick : nick,
		content : content,
		numgroup : numgroup,
		step : step,
		indent : indent
	}
	$.ajax({
		url : "free_comment_save",
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
// 댓글 수정 틀
function comment_modify(cnt) {
	let html=""
	html += "<td colspan='3'><input type='hidden' id='cnum"+cnt+"' value='"+$("#cnum"+cnt).val()+"'>"
	html += "<td colspan='3'><input type='hidden' id='nick"+cnt+"' value='"+$("#nick"+cnt).val()+"'>"
	html += "<textarea rows='3' cols='50' id='content"+cnt+"'>"+$("#content"+cnt).val()+"</textarea></td>"
	html += "<input type='hidden' id='numgroup"+cnt+"' value='"+$("#numgroup"+cnt).val()+"'>"
	html += "<input type='hidden' id='commentgroup"+cnt+"' value='"+$("#commentgroup"+cnt).val()+"'>"
	html += "<input type='hidden' id='step"+cnt+"' value='"+$("#step"+cnt).val()+"'>"
	html += "<input type='hidden' id='indent"+cnt+"' value='"+$("#indent"+cnt).val()+"'>"
	html += "<td><input type='button' value='수정완료' onclick='comment_modify_save("+cnt+")'><br>"
	html += "<input type='button' value='취소' onclick='comment_modify_save("+cnt+")'></td>"
	$("#modify"+cnt).html(html)
}
// 수정한 댓글 저장
function comment_modify_save(cnt) {
	var cnum = $("#cnum"+cnt).val();
	var nick = $("#nick" +cnt).val();
	var content = $("#content" +cnt).val();
	var numgroup = $("#numgroup" +cnt).val();
	var commentgroup = $("#commentgroup" + cnt).val();
	var step = $("#step" + cnt).val();
	var indent = $("#indent" + cnt).val();
	var form = { 
		cnum : cnum,
		numgroup : numgroup, 
		commentgroup : commentgroup, 
		nick : nick, 
		content : content,
		step : step,
		indent : indent
	}
	$.ajax({
		url : "free_comment_modify",
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
function comment_delete(cnt) {
	var cnum = $("#cnum"+cnt).val();
	var nick = $("#nick" + cnt).val();
	var content = $("#content" + cnt).val();
	var numgroup = $("#numgroup" + cnt).val();
	var commentgroup = $("#commentgroup" + cnt).val();
	var step = $("#step" + cnt).val();
	var indent = $("#indent" + cnt).val();
	var form = { 
		cnum : cnum,
		numgroup : numgroup, 
		commentgroup : commentgroup, 
		nick : nick, 
		content : content,
		step : step,
		indent : indent
	}
	$.ajax({
		url : "free_comment_delete",
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
	var indent=$('#indent'+cnt).val();
	let html=""
	html += "<tr>"
	html += "<input type='hidden' id='recnum"+cnt+"' value='"+cnum+"'>"
	html += "<input type='hidden' id='renumgroup"+cnt+"' value='"+num+"'>"
	html += "<input type='hidden' id='recommentgroup"+cnt+"' value='"+commentgroup+"'>"
	html += "<input type='hidden' id='restep"+cnt+"' value='"+step+"'>"
	html += "<input type='hidden' id='reindent"+cnt+"' value='"+indent+"'>"
	html += "<input type='hidden' id='renick"+cnt+"'  value='${loginUser.nick}'>"
	//html += "<textarea rows='4' cols='50' id='recontent"+cnt+"'></textarea></td><td>"
	html += "<td colspan='4'><input type='text' id='recontent"+cnt+"'></td><td>"
	html += "<input type='button' value='댓글달기' onclick='comment_reply_save("+cnt+")'></td></tr>"
	$("#reply"+cnt).html(html)
}
//대댓글 저장
function comment_reply_save(cnt) {
	var cnum = $("#recnum" + cnt).val();
	var nick = $("#renick" + cnt).val();
	var content = $("#recontent" + cnt).val();
	var numgroup = $("#renumgroup" + cnt).val();
	var commentgroup = $("#recommentgroup" + cnt).val();
	var step = $("#restep" + cnt).val();
	var indent = $("#reindent" + cnt).val();
	var form = { 
		cnum : cnum,
		nick : nick, 
		content : content,
		numgroup : numgroup, 
		commentgroup : commentgroup, 
		step : step,
		indent : indent
	}
	$.ajax({
		url : "free_comment_reply_save",
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
<body class="is-preload">
<%@ include file="../defualt/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatDate var="cdate" value="${cdate }" pattern="yyyy-MM-dd"/>
<input type="hidden" name="page" value="1"/>
<input type="hidden" name="num" value="${lists.num }">
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
				<form action="free_modify_view?num=${lists.num }" method="post">
<table>
     <tr>
         <td colspan="4">${lists.title }</td>
     </tr>
     <tr>
         <td colspan="2">${lists.nick }
         <img src="resources/main_image/heart.png" style="width:28px; vertical-align: middle;">
							333
							</td>
     
         <td colspan="2" style="text-align: right;"><fmt:formatDate var="date" value="${lists.savedate }" pattern="yyyy-MM-dd"/>
			<c:choose>
			<c:when test="${cdate eq date }">
			<fmt:formatDate var="date" value="${lists.savedate }" pattern="hh:mm"/>
			${date }
			</c:when>
			<c:otherwise>
			${date }
			</c:otherwise>
			</c:choose> |  조회 ${lists.hit }</td>
     </tr>
     <tr>
         <td colspan="4" style="background: white ;">
         ${lists.content }</td> 
     </tr>
     <tr>
        <th colspan="2" style="text-align: left ;">
        <input type="button" value="목록보기" onclick="location.href='free_board_list?page=1'">
        <span id="show_hide">
				<input type="button" value="댓글보기" onclick="comment_table_show()">
		</span>
		</th>
		<th colspan="2" style="text-align: right;">
		<c:choose>
		<c:when test="${loginUser.nick eq lists.nick }">
		<input type="submit" value="수정">
        <input type="button" value="삭제" onclick="location.href='free_board_delete?num=${lists.num }'">
	    </c:when>
	    <c:when test="${loginUser.nick eq '관리자' }">
		<input type="button" value="삭제" onclick="location.href='free_board_delete?num=${lists.num }'">
		</c:when>
	    </c:choose>
	    </th>
   	 </tr>
</table>
<table border="1" id="comment_table"  style="display:none;">
	            <tr>
					<td colspan="4">
						<input type="hidden" id="numgroup" value="${lists.num }">
						<input type="hidden" id="nick" value='${loginUser.nick}'>
						 <input type='text' id='content'></td>
					<td>
						<input type="button" value="댓글달기" onclick="comment_save()">
						</td>
				</tr>
				<c:set var="cnt" value="0" />
				<c:forEach items="${comment_list}" var="com">
					<tr id="modify${cnt}">
					<c:choose>
						<c:when test="${com.step>0}">
							<th> -> </th>
						</c:when>
					</c:choose>
					<input type="hidden" id="cnum${cnt}" value="${com.cnum}">
					<input type="hidden" id="nick${cnt}" value="${com.nick}">
					<input type="hidden" id="content${cnt}" value="${com.content }">
					<input type="hidden" id="numgroup${cnt}" value="${com.numgroup }">
					<input type="hidden" id="commentgroup${cnt}" value="${com.commentgroup }">
					<input type="hidden" id="step${cnt}" value="${com.step }">
					<input type="hidden" id="savedate${cnt}" value="${com.savedate}">
					<fmt:formatDate  var="savedate" value="${com.savedate}" pattern="yyyy-MM-dd HH:mm"/>
						<!-- <th id="modify_cnum${cnt}">${com.cnum}</th> -->
						<td colspan="2" style="text-align: center;width: 120px" id="modify_nick${cnt}">${com.nick}<br>
						<span style="font-size: 10pt;" id="modify_savedate${cnt}">${savedate}</span></td>
						<td id="modify_content${cnt}">${com.content}</td>
						<c:choose>
							<c:when test="${com.step==0}">
								<th><input type="button" value="댓글달기" onclick="comment_reply(${cnt})"></th>
							</c:when>
						</c:choose>  
						<c:choose>
						<c:when test="${loginUser.nick eq com.nick }">
						<th>
						<input type="button" value="수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정" onclick="comment_modify(${cnt})">
						<input type="button" value="삭&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제" onclick="comment_delete(${cnt})">
						</th>
						</c:when>
						<c:when test="${loginUser.nick eq '관리자' }">
						<th>
						<input type="button" value="삭&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제" onclick="comment_delete(${cnt})">
						 </th>
						</c:when>
						</c:choose>
					</tr>
					<tr id="reply${cnt}"></tr>
					<c:set var="cnt" value="${cnt+1}" />
				</c:forEach>
			</table>
		</form>
		</div>
		</section>
		</article>
		</div>
		<%@ include file="../defualt/footer.jsp"%>
</body>
</html>