<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		#travelers {color:black; text-align: center; font-size: 55pt; position:relative; top: 160px; }
		#travelers a {text-decoration:none; color:black;}
/*		body { background-image: url('resources/main_image/01.png'); background-color: black;
			background-repeat : no-repeat; background-size : cover;} */
		#menu { position: absolute; right: 30px; margin: 30px;}
		#menu a {text-decoration:none ;color:black;}
		body {margin: 0 auto;}
	</style>
</head>
<body>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<fmt:requestEncoding value="utf-8"/>
	<div id="menu">
		<c:choose>
			<c:when test="${loginUser!=null }">
				<a href="logout">로그아웃</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="mypage">마이페이지</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="login">메이트 찾기</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="info_list?page=1">정보게시판</a>
			</c:when>
			<c:otherwise>
				<a href="login">로그인</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="reg_tos">회원가입</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="login">메이트 찾기</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="info_list?page=1">정보게시판</a>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="travelers"><b><a href="/controller/">TRAVELERS</a></b></div>
</body>
</html>