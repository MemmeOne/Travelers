<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body class="is-preload">
	<%@ include file="../defualt/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner" style="height: 600px;">
					<section>
						<h2>My Page</h2>
						<div class="row">
							<div class="col-6 col-12-medium" style="width:200px;">
								<ul class="alt">
									<li><a href="mypage">내정보</a></li>
									<li><a href="form">여행수첩</a></li>
									<li><a href="mypage">메이트 신청 현황</a></li>
									<li><a href="mypage">작성한 글 관리</a></li>
									<li><a href="chk_pwd?page=change_userinfo">회원정보 수정</a></li>
									<li><a href="chk_pwd?page=change_pwd">비밀번호 수정</a></li>
									<li><a href="withdrawal">회원탈퇴</a></li>
								</ul>
							</div>
							<div class="col-6 col-12-medium" style="margin-left: 50px;">
								<h2> 회원 정보</h2>
								<table>
									<tr>
										<th>아이디</th>
										<th>${loginUser.id }</th>
									</tr>
									<tr>
										<th>닉네임</th>
										<th>${loginUser.nick }</th>
									</tr>
									<tr>
										<th>이메일</th>
										<th>${loginUser.email }</th>
									</tr>
									<tr>
										<th>성별</th>
										<th>${loginUser.gender }</th>
									</tr>
									<tr>
										<th>생년월일</th>
										<th>${loginUser.birth }</th>
									</tr>
								</table>
							</div>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	<%@ include file="../defualt/footer.jsp"%>
</body>
</html>