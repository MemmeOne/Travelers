<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<%@ include file="../defualt/header.jsp" %>
	<form action="reg_chk">
		아 이 디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="pwd"><br>
		닉네임 : <input type="text" name="nick"><br>
		e-mail : <input type="text" name="id"><br>
		성별 : <input type="text" name="id"><br>
		나이 : <input type="text" name="id"><br>
		<input type="submit" value="회원가입">
		<input type="button" value="취소" onclick="location.href='/'">
	</form>
<%@ include file="../defualt/footer.jsp" %>
</body>
</html>