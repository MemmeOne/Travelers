<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<script type="text/javascript">
	function loginConfirm(){
		var check = confirm("글 작성은 로그인이 필요합니다")
		if(check){
			location.href="login";
		}
	}
</script>
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
																	<c:forEach var="notis" items="${notis_list }">
																		<c:if test="${notis.nick=='관리자'}">
																			<tr id="notis" style="font-weight:bold; background: rgba(50, 50, 50, 0.05);font-size: 1.1em;">
																				<fmt:formatDate var="date2" value="${notis.savedate }" pattern="yyyy-MM-dd"/>
																					<th style="text-align: center;color:red;">[공지]</th>
																						<c:choose>
																							<c:when test="${cdate eq date2 }">
																								<fmt:formatDate var="date2" value="${notis.savedate }" pattern="hh:mm"/>
																									<th style="text-align: left;color:red;">
																										<a href="free_content_view?num=${notis.num }"> ${notis.title }</a>
																											<c:forEach var="cnum" items="${commentcount }">
																												<c:choose>
																													<c:when test="${notis.num eq cnum.numgroup }">[${cnum.count }]
																													</c:when>
																												</c:choose>
																											</c:forEach>
																										<img src="resources/main_image/new.png" style="width:25px;"></th>
																									<th style="text-align: center;">${notis.nick }</th>
																										<fmt:formatDate var="savedate2" value="${notis.savedate }" pattern="hh:mm"/>
																											<th style="text-align: center;">
																												${date2}</th>
																							</c:when>
																							<c:otherwise>
																								<th style="text-align: left;color:red;">
																									<a href="free_content_view?num=${notis.num }"> ${notis.title }</a>
																										<c:forEach var="cnum" items="${commentcount }">
																											<c:choose>
																												<c:when test="${notis.num eq cnum.numgroup }">[${cnum.count }]
																												</c:when>
																											</c:choose>
																										</c:forEach>
																									</th>
																									<th style="text-align: center;">${notis.nick }</th>
																										<fmt:formatDate var="date2" value="${notis.savedate }" pattern="yyyy-MM-dd"/>
																								<th style="text-align: center;">${date2}</th>
																									</c:otherwise>
																								</c:choose>
																							<th style="text-align: center;">${notis.hit }</th>
																							<th style="text-align: center;">
			                            														<c:set var="zero2" value="true" />
																									<c:forEach var="favoriteList2" items="${favoriteList }">
																										<c:choose>
																											<c:when test="${notis.num eq favoriteList2.num }">
				                                   																${favoriteList2.count }
				                                   																	<c:set var="zero2" value="false" />
		                                     																</c:when>
																										</c:choose>
																										</c:forEach>
																											<c:choose>
																												<c:when test="${zero2==true}">
	                                 	      																		0
                                     	  																		</c:when>
																											</c:choose>
																								</th>
																							</tr>
																						</c:if>
																				</c:forEach>
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
																								<td><a onclick="window.open('userInfoPop?nick=${dto.nick }','','width=500,height=700')">${dto.nick }</a></td>
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
																	<td><a onclick="window.open('userInfoPop?nick=${dto.nick }','','width=500,height=700')">${dto.nick }</a></td>
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
			<tr style="border-bottom:0;">
								<td align="right" colspan="6" >
								<c:choose>
									<c:when test="${loginUser.nick ne null }">
										<input type="button" value="글작성" onclick="location.href='free_write_list'">
									</c:when>
									<c:otherwise>
										<input type="button" value="글작성" onclick="loginConfirm()">
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</table><br>
						<table style="text-align: center;width: 1070px; margin: 0 auto;font-size:0.7em;">
			<tr style="width: 60px;border-bottom:0;border-top:0;">
				<td colspan="6" style="font-size:2em;"><c:choose>
						<c:when test="${param.page > 1 }">
						<a href="free_board_list?page=${param.page-1}" style="vertical-align: middle;">
							<img alt="" src="resources/main_image/rocket_left.png" style="width: 50px; height: 50px;">
						</a>
						</c:when>
						<c:otherwise>
							<a href="" style="pointer-events: none;cursor: default;opacity: 0.5; vertical-align: middle;">
									<img alt="" src="resources/main_image/rocket_left.png" style="width: 50px; height: 50px;">
								</a>
						</c:otherwise>
					</c:choose> <c:set var="num" value="0" /> <c:forEach begin="1"
						end="${totPage }" step="10" var="cnt">
						<c:set var="num" value="${num+1 }" />
						<a href="free_board_list?page=${num }">${num }</a>
					</c:forEach> <c:choose>
						<c:when test="${param.page < num }">
						<a href="free_board_list?page=${param.page+1}" style="vertical-align: middle;">
							<img alt="" src="resources/main_image/rocket_right.png" style="width: 50px; height: 50px;">
						</c:when>
						<c:otherwise>
							<a href="" style="pointer-events: none;cursor: default;opacity: 0.5; vertical-align: middle;">
									<img alt="" src="resources/main_image/rocket_right.png" style="width: 50px; height: 50px;">
								</a>
						</c:otherwise>
					</c:choose><br></td>
			</tr>
			<tr style="background-color: white; border-top:0; border-bottom: 0px;">
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
		<!--  <style>
<!--table  {
    width: 100%;
    border-top: 1px solid rgba(50, 50, 50, 0.2);
    border-collapse: collapse;
  }
th, td {
	background-color: white;
    border-bottom: 1px solid rgba(50, 50, 50, 0.2);
    padding: 10px;
    margin: 10px;
  }-->
 <style>
a{
border-bottom:0;
}
td  {
background-color: white;
}
</style>
</body>
</html>