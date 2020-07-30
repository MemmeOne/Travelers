<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 공유 게시판</title>
</head>
<body class="is-preload">
	<%@ include file="../defualt/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<form action="info_search">
						<input type="hidden" name="page" value="1">
						<h2 style="text-align: center;">정보 공유 게시판</h2>
						<hr>
						<table style="font-size:0.9em; text-align: center;width: 1070px; margin: 0 auto; height : 60px; background-color: white;">
							<tr style="vertical-align: middle;" >
								<th style="width:80px;text-align: center;">번호</th>
								<th style="width:460px;text-align: center;">제목</th>
								<th style="width:200px;text-align: center;">닉네임</th>
								<th style="width:170px;text-align: center;">작성일</th>
								<th style="width:80px;text-align: center;">조회</th>
								<th style="width:80px;text-align: center;">추천</th>
							</tr>
							<c:choose >
								<c:when test="${info_list==null }">
									<tr>
										<th colspan="6">등록된 게시글이 없습니다.</th>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="list" items="${info_list }">
										<tr>
											<td>${list.num }</td>
											<td style="text-align: left;"><a href="info_post?num=${list.num }">[${list.tag }] ${list.title }</a></th>
											<td>${list.nick }</td>
											<fmt:formatDate var="savedate" value="${list.savedate }" pattern="yyyy-MM-dd hh:mm"/>
											<td>${savedate}</td>
											<td>${list.hit }</td>
											<td>${list.recommend }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<tr>
								<td colspan="4"></td>
								<td colspan="4">
									<input type="button" value="글작성" onclick="location.href='info_write'">
								</td>
							</tr>
						</table><br>
						<table style="text-align: center;width: 1070px; margin: 0 auto;font-size:0.7em;">
							<tr style="width: 60px;" >
								<td colspan="6" style="font-size:2em;">
									<c:choose>
										<c:when test="${param.page > 1 }">
											<a href="info_list?page=${param.page-1}" style="vertical-align: middle;">
												<img alt="" src="resources/main_image/ship_left.png" style="width: 50px; height: 50px;">
											</a>
										</c:when>
										<c:otherwise>
											<a href="" style="pointer-events: none;cursor: default;opacity: 0.5; vertical-align: middle;">
												<img alt="" src="resources/main_image/ship_left.png" style="width: 50px; height: 50px;">
											</a>
										</c:otherwise>
									</c:choose>
									<c:set var="num" value="0" />
									<c:forEach begin="1" end="${totPage }" step="10" var="cnt">
										<c:set var="num" value="${num+1 }" />
										<a href="info_list?page=${num }">${num }</a>
									</c:forEach>
									<c:choose>
										<c:when test="${param.page < num }">
											<a href="info_list?page=${param.page+1}" style="vertical-align: middle;">
												<img alt="" src="resources/main_image/ship_right.png" style="width: 50px; height: 50px;">
											</a>
										</c:when>
										<c:otherwise>
											<a href="" style="pointer-events: none;cursor: default;opacity: 0.5; vertical-align: middle;">
												<img alt="" src="resources/main_image/ship_right.png" style="width: 50px; height: 50px;">
											</a>
										</c:otherwise>
									</c:choose>
									<br>
								</td>
							</tr>
							<tr>
								<td style="width: 85px;"></td>
								<td style="width: 200px;">
									<select name="tag" style="width: 200px;">
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="nick">작성자</option>
										<option value="tag">태그</option>
									</select>
								</td>
								<td style="width:500px;">
									<input type="text" placeholder="검색할 키워드를 입력하세요" name="word" style="width:500px;">
								</td>
								<td style="width:100px;">
									<input type="submit" value="검색" class="button large">
								</td>
								<td style="width: 85px;"></td>
							</tr>
						</table>
					</form>					
				</div>
			</section>
		</article>
	</div>
	<%@ include file="../defualt/footer.jsp"%>
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