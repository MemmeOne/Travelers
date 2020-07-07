<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free_search</title>
</head>
<body>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<fmt:requestEncoding value="utf-8" />
	<form action="free_search">
		<table border="1">
			<tr>
				<th>번호</th>
				<th>닉네임</th>
				<th>제목</th>
				<th>날짜</th>
				<th>조회수</th>
				<th>group</th>
				<th>step</th>
				<th>indent</th>
			</tr>
			<c:choose>
				<c:when test="${lists.size() != 0 }">
					<c:forEach items="${ lists }" var="dto">
						<tr>
							<td>${dto.num }</td>
							<td>${dto.nick }</td>
							<td><a href="free_content_view?num=${dto.num }">${dto.title }</a>
							</td>
							<td>${dto.savedate }</td>
							<td>${dto.hit }</td>
							<td>${dto.numgroup }</td>
							<td>${dto.step }</td>
							<td>${dto.indent }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<th colspan="8">등록된 게시글이 없습니다.</th>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="8"><a href="free_write_list">등록</a></td>${totPage }
			</tr>
			<tr>
				<td colspan="8" align="right"><c:choose>
						<c:when test="${param.page > 1 }">
							<button type="button"
								onclick="location.href='free_search?page=${param.page-1}&tag=${param.tag}&word=${param.word}'">
								이전</button>
						</c:when>
						<c:otherwise>
							<button type="button" disabled>이전</button>
						</c:otherwise>
					</c:choose> <c:set var="num" value="0" /> <c:forEach begin="1"
						end="${totPage }" step="3" var="cnt">
						<c:set var="num" value="${num+1 }" />
						<a href="free_search?page=${num }&tag=${param.tag}&word=${param.word}">[${num }]</a>
					</c:forEach> <c:choose>
						<c:when test="${param.page < num }">
							<button type="button"
								onclick="location.href='free_search?page=${param.page+1}&tag=${param.tag}&word=${param.word}'">
								다음</button>
						</c:when>
						<c:otherwise>
							<button type="button" disabled>다음</button>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<th colspan="8"><select name="tag">
						<option value="title">제목</option>
						<option value="nick">닉네임</option>
				</select> <input type="text" placeholder="검색할 키워드를 입력하세요" name="word">
					<input type="submit" value="검색"></th>
			</tr>
		</table>
</body>
</html>