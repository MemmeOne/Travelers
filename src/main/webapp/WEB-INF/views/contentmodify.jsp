<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="modify" method="post">
<input type="hidden" name="id" value="${content.id }">
	<table style="width: 500px">
		<tr>
		<td>제목</td>
		<td>${content.title }</td> 
		</tr>			
		<tr>
		<td style="vertical-align: top;">내용</td>
		<td><textarea name="content" rows="10" cols="50">${content.name }</textarea></td>
		</tr>
		<tr>
		<td align="center" colspan="2">
		<input type="submit" value="수정" >
		<input type="button" value="목록" onclick="location.href='reviewboard'">
		</td>
		</tr>
</table>
</form>
</body>
</html>