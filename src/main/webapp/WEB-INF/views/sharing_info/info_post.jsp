<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${info_post.title }</title>
<style type="text/css">
	#body { margin-top: 350px; display: flex; justify-content: center; align-items: center; }
	a { text-decoration: none; color: black; }
	table { background: white; padding: 30px; }
</style>
<script src="resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function showComment(list) {
		let html=""
		var cnt=1;
		$.each(list, function(index,item) {
		 	html += "<input type='hidden' id='nick"+cnt+"' value='"+item.nick+"'>"
			html += "<input type='hidden' id='content"+cnt+"' value='"+item.content+"'>"
			html += "<input type='hidden' id='numgroup"+cnt+"' value='"+item.numgroup+"'>"
			html += "<input type='hidden' id='step"+cnt+"' value='"+item.step+"'>"
			html += "<input type='hidden' id='indent"+cnt+"' value='"+item.indent+"'>"
			html += "<tr><th>"+item.nick+"</th>"
			html += "<td>"+item.content+"</td>"
			html += "<th>"+item.savedate+"</th>"
			html += "<th><input type='button' value='수정' onclick='comment_modify()'> "
			html += "<input type='button' value='삭제' onclick='comment_delete("+cnt+")'></th></tr>"
			cnt++;
		})
		$("#comment_table").html(html)
	}
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
	function comment_modify() {
		let html=""
		html += "<td colspan="3"><input type='text' id='nick"+cnt+"' value='"+$("#nick"+cnt).val()+"'>"
		html += "<textarea rows="3" cols="50" id='content"+cnt+"'>"+$("#content"+cnt).val()+"</textarea></td>"
		html += "<input type='hidden' id='numgroup"+cnt+"' value='"+$("#numgroup"+cnt).val()+"'>"
		html += "<input type='hidden' id='step"+cnt+"' value='"+$("#step"+cnt).val()+"'>"
		html += "<input type='hidden' id='indent"+cnt+"' value='"+$("#indent"+cnt).val()+"'>"
		html += "<td><input type='button' value='수정완료' onclick='comment_modify_save("+cnt+")'><br>"
		html += "<input type='button' value='취소' onclick='comment_modify_save("+cnt+")'></td>"
		$("#modify"+cnt).html(html)
	}
	function comment_modify_save(cnt) {
		var nick = $("#nick" + cnt).val();
		var content = $("#content" + cnt).val();
		var numgroup = $("#numgroup" + cnt).val();
		var step = $("#step" + cnt).val();
		var indent = $("#indent" + cnt).val();
		var form = { nick : nick, content : content, numgroup : numgroup, step : step, indent : indent }
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
	function comment_delete(cnt) {
		var nick = $("#nick" + cnt).val();
		console.log("#nick" + cnt)
		var content = $("#content" + cnt).val();
		var numgroup = $("#numgroup" + cnt).val();
		var step = $("#step" + cnt).val();
		var indent = $("#indent" + cnt).val();
		var form = {
			nick : nick,
			content : content,
			numgroup : numgroup,
			step : step,
			indent : indent
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
</script>
</head>
<body>
	<%@ include file="../defualt/header.jsp" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<fmt:requestEncoding value="utf-8" />
	<div id="body">
		<form action="info_rewrite?num=${info_post.num }" method="post">
			<input type="hidden" value="${info_post.num }" name="num">
			<table border="1">
				<tr>
					<th>닉네임</th>
					<td>${info_post.nick }</td>
					<th>조회수</th>
					<td>${info_post.hit }</td>
				</tr>
				<tr>
					<th>작성 날짜</th>
					<td colspan="3">${info_post.savedate }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">[${info_post.tag }] ${info_post.title }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">${info_post.content }</td>
				</tr>
				<tr>
					<th colspan="4">
						<input type="button" value="목록" onclick="location.href='info_list?page=1'">
						<input type="submit" value="수정" onclick="location.href='info_rewrite?num=${num }'">
						<input type="button" value="삭제" onclick="location.href='info_delete?num=${info_post.num }'">
					</th>
				</tr>
				<tr>
					<td colspan="3">
						<input type="hidden" id="numgroup" value="${info_post.num }">
						<input type="hidden" id="step" value="0">
						<input type="hidden" id="indent" value="0">
						<input type="text" id="nick" placeholder="닉네임">
						<textarea rows="3" cols="50" id="content"></textarea>
					</td>
					<td>
						<input type="button" value="댓글달기" onclick="comment_save()">
					</td>
				</tr>
				<table border="1" id="comment_table">
					<c:set var="cnt" value="0" />
					<c:forEach items="${comment_list}" var="com">
						<input type="hidden" id="nick${cnt}" value="${com.nick}">
						<input type="hidden" id="content${cnt}" value="${com.content }">
						<input type="hidden" id="numgroup${cnt}" value="${com.numgroup }">
						<input type="hidden" id="step${cnt}" value="${com.step }">
						<input type="hidden" id="indent${cnt}" value="${com.indent }">
						<tr id="modify${cnt}">
							<th id="modify_nick${cnt}">${com.nick}</th>
							<td id="modify_content${cnt}">${com.content}</td>
							<fmt:formatDate  var="savedate" value="${com.savedate}" pattern="yyyy-MM-dd"/>
							<th id="modify_savedate${cnt}">${savedate}</th>
							<th>
								<input type="button" value="수정" onclick="comment_modify(${cnt})"> 
								<input type="button" value="삭제" onclick="comment_delete(${cnt})">
							</th>
						</tr>
						<c:set var="cnt" value="${cnt+1}" />
					</c:forEach>
				</table>
			</table>
		</form>
	</div>
</body>
</html>