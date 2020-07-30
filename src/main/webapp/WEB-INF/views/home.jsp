<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<html>
<head>
<title>메인</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/html5up-spectral/assets/css/main.css" />
<noscript><link rel="stylesheet" href="resources/html5up-spectral/assets/css/noscript.css" /></noscript>
</head>
<body class="landing is-preload">
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		
		<!-- Header -->
		<header id="header" class="alt">
			<h1>
				<a href="/Travelers/">Travelers</a>
			</h1>
			<nav id="nav">
				<ul>
					<li class="special"><a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu">
							<ul>
								<c:choose>
									<c:when test="${loginUser!=null }">
										<li><a href="/Travelers/">Home</a></li>
										<li><a href="logout">로그아웃</a></li>
										<li><a href="mypage">마이페이지</a></li>
										<li><a href="mate_board_list?page=1">여행 메이트 찾기</a></li>
										<li><a href="info_list?page=1">정보 공유 게시판</a></li>
										<li><a href="reviewboard?boardnum=1&page=1">여행 리뷰 게시판</a></li>
										<li><a href="free_board_list?page=1">자유 게시판</a></li>
										<li><a href="list">게시판 형식</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="/Travelers/">Home</a></li>
										<li><a href="login">로그인</a></li>
										<li><a href="reg_tos">회원가입</a></li>
										<li><a href="mate_board_list?page=1">여행 메이트 찾기</a></li>
										<li><a href="info_list?page=1">정보 공유 게시판</a></li>
										<li><a href="reviewboard?boardnum=1&page=1">여행 리뷰 게시판</a></li>
										<li><a href="free_board_list?page=1">자유 게시판</a></li>
										<li><a href="list">게시판 형식</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div></li>
				</ul>
			</nav>
		</header>
		<!-- Banner -->
		<section id="banner">
			<div class="inner">
				<h2>Travelers</h2>
				<p>
					대충 여행가자는 문구<br> 대충 여행가자는 문구 ^^<br>
				</p>
				<ul class="actions special">
					<li><a href="login" class="button small">여행 메이트 찾기</a></li>
				</ul>
			</div>
		</section>
		<%@ include file="defualt/footer.jsp"%>
	</div>
</body>
</html>