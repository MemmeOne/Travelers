<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body>
	<%@ include file="../defualt/header.jsp" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<fmt:requestEncoding value="utf-8"/>
	<a href="form">여행수첩</a><br>
	<a href="chk_pwd?page=change_userinfo">회원정보 수정</a><br>
	<a href="chk_pwd?page=change_pwd">비밀번호 수정</a><br>
	<a href="withdrawal">회원탈퇴</a><br>
	<%@ include file="../defualt/footer.jsp" %>
</body>
</html>