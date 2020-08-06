<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판 검색 결과</title>
</head>
<body class="is-preload">
<fmt:formatDate var="cdate" value="${cdate }" pattern="yyyy-MM-dd"/>
	<%@ include file="../default/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
				<!-- Main -->
				<article id="main">
					<section class="wrapper style5">
						<div class="inner">
									<form action="free_search">
										<input type="hidden" name="page" value="1">
										<h2 style="text-align: center;">자유 게시판</h2>
										<hr>
										<table style="font-size:0.9em; text-align: center;width: 1070px; margin: 0 auto; height : 60px; background-color: white;">
													<tr style="vertical-align: middle;">
																<th style="width:80px;text-align: center;">번호</th>
																<th style="width:460px;text-align: center;">제목</th>
																<th style="width:200px;text-align: center;">닉네임</th>
																<th style="width:170px;text-align: center;">작성일</th>
																<th style="width:80px;text-align: center;">조회</th>
																<th style="width:80px;text-align: center;">추천</th>
													</tr>
													<c:choose>
															<c:when test="${lists.size() != 0 }">
															<c:forEach items="${ lists }" var="dto">
																		<tr>
																			<td>${dto.num }</td>
																				<fmt:formatDate var="date" value="${dto.savedate }" pattern="yyyy-MM-dd"/>
																					<c:choose>
																						<c:when test="${cdate eq date }">
																							<fmt:formatDate var="date" value="${dto.savedate }" pattern="hh:mm"/>
																								<td style="text-align: left;"><a href="free_content_view?num=${dto.num }">${dto.title }</a>
																									<c:forEach var="cnum" items="${commentcount }">
																										<c:choose>
																											<c:when test="${dto.num eq cnum.numgroup }">[${cnum.count }]
																											</c:when>
																										</c:choose>
																									</c:forEach>
																								<img src="resources/main_image/new.png" style="width:25px;">
																								</td>
																								<td>${dto.nick }</td>
																								<td>${date }</td>
																						</c:when>
																					<c:otherwise>
																						<td style="text-align: left;"><a href="free_content_view?num=${dto.num }">${dto.title }</a>
																							<c:forEach var="cnum" items="${commentcount }">
																								<c:choose>
																									<c:when test="${dto.num eq cnum.numgroup }">[${cnum.count }]
																									</c:when>
																								</c:choose>
																							</c:forEach>
																						</td>
																						<td>${dto.nick }</td>
																						<td>${date }</td>
																					</c:otherwise>
																				</c:choose>
																			<td>${dto.hit }</td>
																			<td>
																				<c:set var="favorite" value="true"/>
																				<c:forEach var="favoriteList" items="${favoriteList }">
																					<c:choose>
																						<c:when test="${dto.num eq favoriteList.num }">
																							${favoriteList.count }
																							<c:set var="favorite" value="false"/>
																						</c:when>
																					</c:choose>
																				</c:forEach>
																				<c:if test="${favorite eq true }">
																					0
																				</c:if>
																			</td>
																		</tr>
																</c:forEach>
															</c:when>
														<c:otherwise>
															<tr>
																<td style="text-align: center;" colspan="6">등록된 게시글이 없습니다.</td>
															</tr>
														</c:otherwise>
													</c:choose>
												<tr>
													<td colspan="4"></td>
													<td colspan="4">
													<input type="button" value="글작성" onclick="location.href='free_write_list'">
													</td>
												</tr>
											</table>
												<br>
													<table style="text-align: center;width: 1070px; margin: 0 auto;font-size:0.7em;">
														<tr style="width: 60px; ">
															<td colspan="6" style="font-size:2em;">
																<c:choose>
																	<c:when test="${param.page > 1 }">
																		<a href="free_search?page=${param.page-1}&tag=${param.tag}&word=${param.word}" style="vertical-align: middle;">
																			<img alt="" src="resources/main_image/rocket_left.png" style="width: 50px; height: 50px;"></a>
																	</c:when>
																	<c:otherwise>
																		<a href="" style="pointer-events: none;cursor: default;opacity: 0.5; vertical-align: middle;">
																		<img alt="" src="resources/main_image/rocket_left.png" style="width: 50px; height: 50px;"></a>
																	</c:otherwise>
																</c:choose>
																	<c:set var="num" value="0" /> 
																		<c:forEach begin="1" end="${totPage }" step="10" var="cnt">
																			<c:set var="num" value="${num+1 }" />
																				<a href="free_search?page=${num }&tag=${param.tag}&word=${param.word}">${num }</a>
																		</c:forEach>
																			<c:choose>
																				<c:when test="${param.page < num }">
																					<a href="free_search?page=${param.page+1}&tag=${param.tag}&word=${param.word}"  style="vertical-align: middle;">
																					<img alt="" src="resources/main_image/rocket_right.png" style="width: 50px; height: 50px;"></a>
																				</c:when>
																			<c:otherwise>
																				<a href="" style="pointer-events: none;cursor: default;opacity: 0.5; vertical-align: middle;">
																				<img alt="" src="resources/main_image/rocket_right.png" style="width: 50px; height: 50px;"></a>
																			</c:otherwise>
																		</c:choose>
																	<br>
																</td>
															</tr>
															<tr style="border-bottom: 0px;">
																<td style="width: 85px;"></td>
																<td style="width: 200px;">
																	<select style="width: 200px;" name="tag">
																		<option value="title">제목</option>
																		<option value="nick">작성자</option>
																		<option value="content">내용</option>
																	</select> 
																</td>
																<td style="width:500px;">
																	<input type="text" style="width:500px;" placeholder="검색할 키워드를 입력하세요" name="word">
																</td>
																<td style="width:100px;">
																	<input type="submit" value="검색" class="button large">
																</td>
																<td style="width:85px;"></td>
															</tr>
														</table>
													</div>
											</section>
										</article>
									</div>
								</form>
	<%@ include file="../default/footer.jsp"%>
<style>
table  {
    width: 100%;
    border-top: 1px solid rgba(50, 50, 50, 0.2);
    border-collapse: collapse;
  }
th, td {
	background-color: white;
    border-bottom: 1px solid rgba(50, 50, 50, 0.2);
    padding: 10px;
    margin: 10px;
  }
</style>
</body>
</html>