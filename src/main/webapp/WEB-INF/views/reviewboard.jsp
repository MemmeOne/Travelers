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
	<table border="1" style="border-collapse: collapse;">
		<caption><font size="6">게시판</font></caption>
		<tr>
			<th>번호</th><th>제목</th>
			<th>작성자</th><th>작성일</th>
			<th>조회</th>
		</tr>
		<c:forEach var="dto" items="${list }">
			<tr>
				<th>
				${dto.id }
				</th>
				<th align="left">
				<c:forEach begin="1" end="${dto.indent }">-></c:forEach>
				${dto.title }
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
	</table>
</body>
</html>