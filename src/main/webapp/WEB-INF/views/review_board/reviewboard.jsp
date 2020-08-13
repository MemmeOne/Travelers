<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 리뷰 게시판</title>
<script src="resources/jquery-3.5.1.min.js" ></script>
<script type="text/javascript">
	function loginConfirm(){
		var check = confirm("글 작성은 로그인이 필요합니다")
		if(check){
			location.href="login";
		}
	}
</script>
<style type="text/css">
.box{ -ms-overflow-style: none; } 
.box::-webkit-scrollbar{ display:none; }
</style>
</head>
<body class="is-preload">
	<%@ include file="../default/header.jsp"%>
	<jsp:useBean id="cdate" class="java.util.Date" />
	<fmt:formatDate var="cdate" value="${cdate }" pattern="yyyy-MM-dd"/>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
				<div style="display: flex;">
					<div>
						<div class="box" align="center" style="position:relative; right: 300px; top: 100px; width: 200px; height: 250px; border:1px solid #BDBDBD; border-radius: 10px; overflow: auto;">
							<div style="margin-bottom: 10px; font-size: 10pt; font-weight: bold; text-align: center;">Traveler List</div>
							<table style="width: 100px; font-size: 0.7em;">
							<c:forEach var="user" items="${loginUserList }">
								<c:if test="${user ne '관리자' }">
								<tr style="background-color: white; border-top: 0; border-bottom: 0;"><td style="text-align: center;">
								<a onclick="window.open('userInfoPop?nick=${user }','','width=500,height=700')" style="border-bottom: 0; cursor: pointer;">
								${user }
								</a>
								</td></tr>
								</c:if>
							</c:forEach>
							</table>
						</div>
					</div>
					<div align="center" style="position: relative; right: 150px;">
						<h2 style="text-align: center;"><a href="reviewboard?page=1" style="border-bottom: 0;">여행 리뷰 게시판</a></h2>
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
							<c:if test="${noticeList ne null }">
								<c:forEach var="notice" items="${noticeList }">
									<fmt:formatDate var="date" value="${notice.savedate }"	pattern="yyyy-MM-dd"/>
										<tr style="font-weight:bold; background: rgba(50, 50, 50, 0.05);font-size: 1.1em;">
											<td style="text-align: center; color:red;">[${notice.tag }]</td>
											<td style="text-align: left; color:red;">
												<a href="contentview?num=${notice.num }" style="padding-left: 10px; border-bottom: 0;">${notice.title }</a>
												<c:forEach var="cnum" items="${commentcount }">
												<c:choose>
													<c:when test="${notice.num eq cnum.num }">
														[${cnum.count }]
													</c:when>
												</c:choose>
												</c:forEach>
												<c:if test="${cdate eq date }">
													<img src="resources/main_image/new.png">
												</c:if>
											</td>
											<td>
												${notice.nick }
											</td>
											<td>
											<c:choose>
												<c:when test="${cdate eq date }">
													<fmt:formatDate var="date" value="${notice.savedate }"	pattern="hh:mm"/>
													${date }
												</c:when>
												<c:otherwise>
													${date }
												</c:otherwise>
											</c:choose>
											</td>
											<td>${notice.hit }</td>
											<td>
												<c:set var="favorite" value="true"/>
												<c:forEach var="favoriteList" items="${favoriteList }">
													<c:if test="${notice.num eq favoriteList.num }">
														${favoriteList.count }
														<c:set var="favorite" value="false"/>
													</c:if>
												</c:forEach>
												<c:if test="${favorite eq true }">
													0
												</c:if>
											</td>
										</tr>
								</c:forEach>
							</c:if>
							<c:choose>
								<c:when test="${list.size() ne 0 }">
									<c:forEach var="dto" items="${list }">
									<fmt:formatDate var="date" value="${dto.savedate }"	pattern="yyyy-MM-dd"/>
										<tr style="background: white;">
											<td>${dto.num }</td>
											<td style="text-align: left;">
												<a href="contentview?num=${dto.num }" style="padding-left: 10px; border-bottom: 0;">${dto.title }</a>
												<c:forEach var="cnum" items="${commentcount }">
												<c:choose>
													<c:when test="${dto.num eq cnum.num }">
														[${cnum.count }]
													</c:when>
												</c:choose>
												</c:forEach>
												<c:if test="${cdate eq date }">
													<img src="resources/main_image/new.png">
												</c:if>
											</td>
											<td>
												<a onclick="window.open('userInfoPop?nick=${dto.nick }','','width=500,height=700')" style="border-bottom: 0;">${dto.nick }</a>
											</td>
											<td>
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
												<c:set var="favorite" value="true"/>
												<c:forEach var="favoriteList" items="${favoriteList }">
													<c:if test="${dto.num eq favoriteList.num }">
														${favoriteList.count }
														<c:set var="favorite" value="false"/>
													</c:if>
												</c:forEach>
												<c:if test="${favorite eq true }">
													0
												</c:if>
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
									<c:otherwise>
										<input type="button" value="글작성" onclick="loginConfirm()">
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr style="background-color: white; border-top:0; border-bottom:0;">
								<td colspan="6" style="font-size:1.5em; padding-bottom: 30px; padding-top: 30px;">
								<c:choose>
									<c:when test="${param.page > 1 }">
										<c:choose>
											<c:when test="${param.search eq null }">
												<a href="reviewboard?page=${param.page-1}" style="vertical-align: middle; border-bottom: 0;">
													<img alt="" src="resources/main_image/bus_left.png" style="width: 40px; height: 40px;">
												</a>
											</c:when>
											<c:otherwise>
												<a href="reviewboard?page=${param.page-1}&searchtype=${param.searchtype }&search=${param.search }" style="vertical-align: middle; border-bottom: 0;">
													<img alt="" src="resources/main_image/bus_left.png" style="width: 40px; height: 40px;">
												</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<img alt="" src="resources/main_image/bus_left.png" style="width: 40px; height: 40px; vertical-align: middle; opacity: 0.5;">
									</c:otherwise>
								</c:choose>
								<c:forEach begin="1" end="${totalpage }" step="1" var="cnt">
									<c:choose>
										<c:when test="${param.search eq null }">
											<c:choose>
												<c:when test="${param.page eq cnt }">
													<a style="border-bottom: 0; font-weight: bold;" href="reviewboard?page=${cnt}">${cnt }</a>
												</c:when>
												<c:otherwise>
													<a style="border-bottom: 0;" href="reviewboard?page=${cnt}">${cnt }</a>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${param.page eq cnt }">
													<a style="border-bottom: 0; font-weight: bold;" href="reviewboard?page=${cnt}&searchtype=${param.searchtype }&search=${param.search }">${cnt }</a>
												</c:when>
												<c:otherwise>
													<a style="border-bottom: 0;" href="reviewboard?page=${cnt}&searchtype=${param.searchtype }&search=${param.search }">${cnt }</a>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${param.page < totalpage }">
										<c:choose>
											<c:when test="${param.search eq null }">
												<a href="reviewboard?page=${param.page+1}" style="vertical-align: middle; border-bottom: 0;">
													<img alt="" src="resources/main_image/bus_right.png" style="width: 40px; height: 40px;">
												</a>
											</c:when>
											<c:otherwise>
												<a href="reviewboard?page=${param.page+1}&searchtype=${param.searchtype }&search=${param.search }" style="vertical-align: middle; border-bottom: 0;">
													<img alt="" src="resources/main_image/bus_right.png" style="width: 40px; height: 40px;">
												</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<img alt="" src="resources/main_image/bus_right.png" style="width: 40px; height: 40px; vertical-align: middle; opacity: 0.5;">
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr style="background-color: white; border-top:0; border-bottom:0; ">
								<td colspan="6">
										<input type="hidden" name="page" value="1">
										 <select name="searchtype" style="display:inline; width: 200px; height: 50px;">
											<option value="title">제목
											<option value="content">내용
											<option value="nick">작성자
										</select>
									<input type="text" name="search" style="display:inline; width: 500px; height: 50px;">
									<input type="submit" value="검색" style="display:inline; width: 120px; height: 50px;">
								</td>
							</tr>
						</table>
						</form>
					</div>
					</div>
				</div>
			</section>
		</article>
	</div>
	<%@ include file="../default/footer.jsp"%>
</body>
</html>