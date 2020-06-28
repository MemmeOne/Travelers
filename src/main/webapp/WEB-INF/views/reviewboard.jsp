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

<fmt:formatDate var="cdate" value="${cdate }" pattern="yyyy.MM.dd"/>

<div align="center">
	<table border="1" style="border-collapse: collapse;">
		<caption><font size="6">게시판</font></caption>
		<tr>
			<th>번호</th><th>제목</th>
			<th>작성자</th><th>작성일</th>
			<th>조회</th>
		</tr>
		<c:choose>
		<c:when test="${list.size() ne 0 }">
		<c:forEach var="dto" items="${list }">
		<tr>
			<th>
			${dto.id }
			</th>
			<th align="left">
			<c:forEach begin="1" end="${dto.indent }">-></c:forEach>
			<a href="contentview?id=${dto.id }">${dto.title }</a>
			</th>
			<th>
			${dto.name }
			</th>
			<th>
			<fmt:formatDate var="date" value="${dto.savedate }" pattern="yyyy.MM.dd"/>
			<c:choose>
			<c:when test="${cdate eq date }">
			<fmt:formatDate var="date" value="${dto.savedate }" pattern="hh:mm"/>
			${date }
			</c:when>
			<c:otherwise>
			${date }
			</c:otherwise>
			</c:choose>
			<th>
			${dto.hit }
			</th>
		</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
			<th colspan="5">등록된 게시글이 없습니다</th>
		</c:otherwise>
		</c:choose>
	<tr>
	<th align="right" colspan="5">
	<input type="button" value="글작성" onclick="location.href='contentwrite'">
	</th>
	</tr>
	
	
	<tr>
	<th colspan="5">
	<form action="list.jsp">
	<input type="text" name="search">
	<input type="submit" value="검색">
	</form>
	</th>
	</tr>
	</table>
</div>



</body>
</html>