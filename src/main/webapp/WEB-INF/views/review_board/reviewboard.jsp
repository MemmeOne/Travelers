<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="is-preload">
	<%@ include file="../defualt/header.jsp"%>
	<jsp:useBean id="cdate" class="java.util.Date" />
	<fmt:formatDate var="cdate" value="${cdate }" pattern="yyyy-MM-dd"/>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<div align="center">
						<h2 style="text-align: center;">여행 리뷰 게시판</h2>
						<hr>
						<form action="reviewboard" method="get">
						<table style="font-size:0.9em; text-align: center;width: 1070px; margin: 0 auto; height : 60px; background-color: white;">
							<tr style="vertical-align: middle;" >
								<td style="width:80px;text-align: center;">번호</td>
								<td style="width:460px;text-align: center;">제목</td>
								<td style="width:200px;text-align: center;">닉네임</td>
								<td style="width:170px;text-align: center;">작성일</td>
								<td style="width:80px;text-align: center;">조회</td>
								<td style="width:80px;text-align: center;">추천</td>
							</tr>
							<c:choose>
								<c:when test="${list.size() ne 0 }">
									<c:forEach var="dto" items="${list }">
										<tr>
											<td>${dto.num }</td>
											<td style="text-align: left;">
												<a href="contentview?num=${dto.num }">${dto.title }</a>
												<c:forEach var="cnum" items="${commentcount }">
												<c:choose>
													<c:when test="${dto.num eq cnum.num }">
														[${cnum.count }]
													</c:when>
												</c:choose>
												</c:forEach>
											</td>
											<td>${dto.nick }</td>
											<td>
											<fmt:formatDate var="date" value="${dto.savedate }"	pattern="yyyy-MM-dd"/>
											<c:choose>
												<c:when test="${cdate eq date }">
													<fmt:formatDate var="date" value="${dto.savedate }"	pattern="hh:mm"/>
													${date }
												</c:when>
												<c:otherwise>
													${date }
												</c:otherwise>
											</c:choose>
											</td>
											<td>${dto.hit }</td>
											<td>
												<c:forEach var="favoriteList" items="${favoriteList }">
													<c:choose>
														<c:when test="${dto.num eq favoriteList.num }">
															${favoriteList.count }
														</c:when>
													</c:choose>
												</c:forEach>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<td colspan="6">등록된 게시글이 없습니다</td>
								</c:otherwise>
							</c:choose>
							<tr style="background-color: white; border-top:0; border-bottom:0;">
								<td align="right" colspan="6" >
								<c:choose>
									<c:when test="${loginUser.nick ne null }">
										<input type="button" value="글작성" onclick="location.href='contentwrite'">
									</c:when>
								</c:choose>
								</td>
							</tr>
							<tr style="background-color: white; border-top:0; border-bottom:0;">
								<td colspan="6" style="font-size:2em;">
								<c:choose>
									<c:when test="${param.page > 1 }">
										<c:choose>
											<c:when test="${param.search eq null }">
												<a href="reviewboard?boardnum=1&page=${param.page-1}" style="vertical-align: middle; border-bottom: 0;">
													<img alt="" src="resources/main_image/bus_left.png" style="width: 50px; height: 50px;">
												</a>
											</c:when>
											<c:otherwise>
												<a href="reviewboard?boardnum=1&page=${param.page-1}&searchtype=${param.searchtype }&search=${param.search }" style="vertical-align: middle; border-bottom: 0;">
													<img alt="" src="resources/main_image/bus_left.png" style="width: 50px; height: 50px;">
												</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<img alt="" src="resources/main_image/bus_left.png" style="width: 50px; height: 50px; vertical-align: middle; opacity: 0.5;">
									</c:otherwise>
								</c:choose>
								<c:forEach begin="1" end="${totalpage }" step="1" var="cnt">
									<c:choose>
										<c:when test="${param.search eq null }">
											<c:choose>
												<c:when test="${param.page eq cnt }">
													<a style="border-bottom: 0; font-weight: bold;" href="reviewboard?boardnum=1&page=${cnt}">${cnt }</a>
												</c:when>
												<c:otherwise>
													<a style="border-bottom: 0;" href="reviewboard?boardnum=1&page=${cnt}">${cnt }</a>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${param.page eq cnt }">
													<a style="border-bottom: 0; font-weight: bold;" href="reviewboard?boardnum=1&page=${cnt}&searchtype=${param.searchtype }&search=${param.search }">${cnt }</a>
												</c:when>
												<c:otherwise>
													<a style="border-bottom: 0;" href="reviewboard?boardnum=1&page=${cnt}&searchtype=${param.searchtype }&search=${param.search }">${cnt }</a>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${param.page < totalpage }">
										<c:choose>
											<c:when test="${param.search eq null }">
												<a href="reviewboard?boardnum=1&page=${param.page+1}" style="vertical-align: middle; border-bottom: 0;">
													<img alt="" src="resources/main_image/bus_right.png" style="width: 50px; height: 50px;">
												</a>
											</c:when>
											<c:otherwise>
												<a href="reviewboard?boardnum=1&page=${param.page+1}&searchtype=${param.searchtype }&search=${param.search }" style="vertical-align: middle; border-bottom: 0;">
													<img alt="" src="resources/main_image/bus_right.png" style="width: 50px; height: 50px;">
												</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<img alt="" src="resources/main_image/bus_right.png" style="width: 50px; height: 50px; vertical-align: middle; opacity: 0.5;">
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr style="background-color: white; border-top:0; border-bottom:0; ">
								<td colspan="6">
										<input type="hidden" name="page" value="1">
										 <select name="searchtype" style="display:inline; width: 200px;">
											<option value="title">제목
											<option value="content">내용
											<option value="nick">작성자
										</select>
									<input type="text" name="search" style="display:inline; width:500px;">
									<input type="submit" value="검색" class="button large" style="display:inline;">
								</td>
							</tr>
						</table>
						</form>
					</div>
				</div>
			</section>
		</article>
	</div>
	<%@ include file="../defualt/footer.jsp"%>
</body>
</html>