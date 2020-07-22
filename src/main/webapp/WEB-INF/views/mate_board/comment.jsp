<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>comment.jsp<Br>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="resources/jquery-3.5.1.min.js"></script>
	<!-- <textarea id="comment" rows="10" cols="50"></textarea> -->
<hr>

<table border="1" id="comment_table">
		<tr>
			<th>bnum</th> <th>rnum</th> <th>시간</th>
			<th>닉네임</th> <th>댓글내용</th>
		</tr>
	
	</table>
	
	
		<c:forEach items="${aa}" var="rr">
		 ${rr.savetime }시간시간<br>
		 ${rr.nick }닉닉<hr>
		</c:forEach>
</body>
</html>