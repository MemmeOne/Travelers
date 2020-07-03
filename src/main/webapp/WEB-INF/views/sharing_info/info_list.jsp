<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 공유 게시판</title>
<style type="text/css">
	#body { margin-top: 350px; display: flex; justify-content: center; align-items: center; }
	a { text-decoration: none; color: black; }
	table { background: white; padding: 30px; }
</style>
</head>
<body>
	<%@ include file="../defualt/header.jsp" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<fmt:requestEncoding value="utf-8"/>
				
	<div id="body">
		<form action="info_search"><input type="hidden" name="page" value="1">
			<table border="1">
				<tr>
					<th>글번호</th> <th>글 제목</th> <th>닉네임</th> <th>날짜</th> <th>조회수</th>
					<!-- <th>group</th> <th>step</th> <th>indent</th>  -->
				</tr>
				<c:choose >
					<c:when test="${info_list==null }">
						<tr>
							<th colspan="8">등록된 게시글이 없습니다.</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="list" items="${info_list }">
							<tr>
								<th>${list.num }</th>
								<td><a href="info_post?num=${list.num }">[${list.tag }] ${list.title }</a></th>
								<th>${list.nick }</th>
								<th>${list.savedate }</th>
								<th>${list.hit }</th>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<!-- 페이지 수 -->
				<tr>
					<td colspan="5" align="right">
						<c:choose>
							<c:when test="${page > 1 }">
								<button type="button"
									onclick="location.href='info_list?page=${page-1}'">
									이전
								</button>
							</c:when>
							<c:otherwise>
								<button type="button" disabled>이전</button>
							</c:otherwise>
						</c:choose>
						<c:set var="num" value="0" />
						<c:forEach begin="1" end="${totPage }" step="3" var="cnt">
							<c:set var="num" value="${num+1 }" />
							<a href="info_list?page=${num }">[${num }]</a>
						</c:forEach>
						<c:choose>
							<c:when test="${page < num }">
								<button type="button"
									onclick="location.href='info_list?page=${page+1}'">
									다음
								</button>
							</c:when>
							<c:otherwise>
								<button type="button" disabled>다음</button>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${num==0 }">
								0 / ${num}
							</c:when>
							<c:otherwise>
								${page } / ${num}
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th colspan="5">
						<select name="tag">
							<option value="title">제목</option>
							<option value="tag">태그</option>
							<option value="nick">닉네임</option>
						</select>
						<input type="text" placeholder="검색할 키워드를 입력하세요" name="word">
						<input type="submit" value="검색">
						<input type="button" value="글쓰기" onclick="location.href='info_write'">
					</th>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="../defualt/footer.jsp" %>
</body>
</html>