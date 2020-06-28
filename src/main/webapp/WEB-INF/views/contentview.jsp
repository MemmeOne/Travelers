<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="UTF-8"/>
<script>
	function commentReg(){
		document.getElementById("form").action = "comment";
		document.getElementById("form").submit();
	}
	function modify(){
		document.getElementById("form").action = "contentmodify";
		document.getElementById("form").submit();
	}
	function del(){
		document.getElementById("form").action = "delete";
		document.getElementById("form").submit();
	}
	function reply(){
		document.getElementById("form").action = "reply_view";
		document.getElementById("form").submit();
	}
	
</script>
<div align="center">
<form id="form" method="post">
	<input type="hidden" name="id" value="${content.id }">
	<input type="hidden" name="cname" value="${user.name }">
	<table border="1" style="width: 500px; border-collapse: collapse;">
		<c:choose>
		<c:when test="${user.name ne null && user.name eq content.name}">
		<tr>
		<td colspan="2" align="right">
		<input type="button" onclick="modify()" value="수정"> 
		<input type="button" onclick="del()" value="삭제"> 
		</td>
		</tr>
		</c:when>
		</c:choose>
		<tr> 
		<td colspan="2"><h1>${content.title }</h1></td> 
		</tr>
		<tr>
		<td style="font-size: 12px;">작성자 : ${content.name }</td>
		<td align="right" style="font-size: 12px;">조회수 : ${content.hit }</td>
		</tr>			
		<tr>
		<td colspan="2" height="300px">${content.content }</td>
		</tr>
		<c:forEach var="comment" items="${comments}">
		<tr>
		<td>${comment.cname }<br>${comment.savedate }</td>
		<td align="left" width="350px"> ${comment.comments }</td>
		</tr>			
		</c:forEach>
		<c:choose>
		<c:when test="${user.name ne null }">
		<tr>
		<td colspan="2">
		<fieldset style="width: 500px;">
		<legend>댓글</legend>
		${user.name }
		<br>
		<textarea style="border: none; position: relative; left: 30px;" name="comments" rows="3" cols="60"></textarea>
		<br>
		<a style="position: relative; left: 450px;" onclick="commentReg()">등록</a>
		</fieldset>
		</td>
		</tr>
		</c:when>
		</c:choose>
		<tr>
		<td>
		<c:choose>
		<c:when test="${user.name ne null }">
		<input type="button" onclick="reply()" value="답글">
		</c:when>
		</c:choose>
		</td>
		<td align="right">
		<input type="button" onclick="location.href='reviewboard?page=1'" value="목록보기">
		</td>
		</tr>			
	</table>
</form>
</div>
</body>
</html>