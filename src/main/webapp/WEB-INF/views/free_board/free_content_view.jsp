<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free_content_view</title>
<script src="resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
// 댓글 틀
var comment_html=""
comment_html += "<tr><td colspan='4'>"
comment_html += "<input type='hidden' id='numgroup' value='${lists.num }'>"
comment_html += "<input type='hidden' id='step' value='0'>"
comment_html += "<input type='text' id='nick' placeholder='닉네임'>"
comment_html += "<textarea rows='3' cols='50' id='content'></textarea></td>"
comment_html += "<th><input type='button' value='댓글달기' onclick='comment_save()'></th></tr>"
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
		html += "<th id='modify_cnum"+cnt+"'>"+item.cnum+"</th>"
		html += "<th id='modify_nick"+cnt+"'>"+item.nick+"</th>"
		html += "<td id='modify_content"+cnt+"'>"+item.content+"</td>"
		html += "<th id='modify_savedate"+cnt+"'>"+item.savedate+"</th>"
		html += "<th>"
		html += "<input type='button' value='수정' onclick='comment_modify("+cnt+")'> "
		html += "<input type='button' value='삭제' onclick='comment_delete("+cnt+")'>"
		html += "</th>"
		if(item.step==0) {
			html += "<th><input type='button' value='댓글쓰기' onclick='comment_reply("+cnt+")'></th>"
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
	var form = {
		nick : nick,
		content : content,
		numgroup : numgroup,
		step : step,
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
	html += "<td colspan='3'><input type='text' id='cnum"+cnt+"' value='"+$("#cnum"+cnt).val()+"'>"
	html += "<td colspan='3'><input type='text' id='nick"+cnt+"' value='"+$("#nick"+cnt).val()+"'>"
	html += "<textarea rows='3' cols='50' id='content"+cnt+"'>"+$("#content"+cnt).val()+"</textarea></td>"
	html += "<input type='hidden' id='numgroup"+cnt+"' value='"+$("#numgroup"+cnt).val()+"'>"
	html += "<input type='hidden' id='commentgroup"+cnt+"' value='"+$("#commentgroup"+cnt).val()+"'>"
	html += "<input type='hidden' id='step"+cnt+"' value='"+$("#step"+cnt).val()+"'>"
	html += "<td><input type='button' value='수정완료' onclick='comment_modify_save("+cnt+")'><br>"
	html += "<input type='button' value='취소' onclick='comment_modify_save("+cnt+")'></td>"
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
	var form = { 
		cnum : cnum,
		numgroup : numgroup, 
		commentgroup : commentgroup, 
		nick : nick, 
		content : content,
		step : step
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
	let html=""
	html += "<tr>"
	html += "<input type='hidden' id='recnum"+cnt+"' value='"+cnum+"'>"
	html += "<input type='hidden' id='renumgroup"+cnt+"' value='"+num+"'>"
	html += "<input type='hidden' id='recommentgroup"+cnt+"' value='"+commentgroup+"'>"
	html += "<input type='hidden' id='restep"+cnt+"' value='"+step+"'>"
	html += "<td colspan='4'><input type='text' id='renick"+cnt+"' placeholder='닉네임'>"
	html += "<textarea rows='4' cols='50' id='recontent"+cnt+"'></textarea></td><td>"
	html += "<input type='button' value='댓글달기' onclick='comment_reply_save("+cnt+")'></td></tr>"
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
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<form action="free_modify_view?num=${lists.num }" method="post">
<input type="hidden" name="page" value="1"/>
<input type="hidden" name="num" value="${lists.num }">
<table border="1">
     <tr>
         <td>번호</td> <td>${lists.num }</td>
     </tr>
     <tr>
         <td>조회수</td> <td>${lists.hit }</td>
     </tr>
     <tr>
         <td>닉네임</td> <td>${lists.nick }</td>
     </tr>
     <tr>
         <td>제목</td> <td>${lists.title }</td>
     </tr>
     <tr>
         <td>내용</td> <td>${lists.content }</td> 
     </tr>
     <tr>
        <td colspan="2">
        <input type="button" value="목록" onclick="location.href='free_board_list?page=1'">
        <input type="submit" value="수정">
        <input type="button" value="삭제" onclick="location.href='free_board_delete?num=${lists.num }'">
        <span id="show_hide">
				<input type="button" value="댓글보기" onclick="comment_table_show()">
		</span>
	    </td>
   	 </tr>
</table>
<table border="1" id="comment_table" style="display:none;">
	            <tr>
					<td colspan="4">
						<input type="hidden" id="numgroup" value="${lists.num }">
						<input type="text" id="nick" placeholder="닉네임">
						<textarea rows="3" cols="50" id="content"></textarea>
					</td>
					<th>
						<input type="button" value="댓글달기" onclick="comment_save()">
					</th>
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
						<th id="modify_cnum${cnt}">${com.cnum}</th>
						<th id="modify_nick${cnt}">${com.nick}</th>
						<td id="modify_content${cnt}">${com.content}</td>
						<th id="modify_savedate${cnt}">${savedate}</th>
						<th>
							<input type="button" value="수정" onclick="comment_modify(${cnt})"> 
							<input type="button" value="삭제" onclick="comment_delete(${cnt})">
						</th>
						<c:choose>
							<c:when test="${com.step==0}">
								<th><input type="button" value="댓글쓰기" onclick="comment_reply(${cnt})"></th>
							</c:when>
						</c:choose>
					</tr>
					<tr id="reply${cnt}"></tr>
					<c:set var="cnt" value="${cnt+1}" />
				</c:forEach>
			</table>
		</form>
</body>
</html>