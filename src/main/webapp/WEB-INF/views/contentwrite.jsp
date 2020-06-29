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
<form action="contentreg" method="post">
<input type="hidden" name="name" value="${user.name }">
	<table style="width: 500px">
		<tr>
		<td>제목</td>
		<td><input type="text" name="title" size="50" placeholder="제목을 입력하세요"></td> 
		</tr>			
		<tr>
		<td style="vertical-align: top;">내용</td>
		<td><textarea name="content" rows="10" cols="50"></textarea></td>
		</tr>			
		<tr>
		<td align="center" colspan="2">
		<input type="submit" value="확인" >
		<input type="button" value="목록" onclick="location.href='reviewboard?page=1'">
		</td>
		</tr>			
	</table>
</form>
</body>
</html>