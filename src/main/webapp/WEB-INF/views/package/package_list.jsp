<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="is-preload">
	<%@ include file="../default/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<h2 style="text-align: center;">동행 패키지</h2>
					<hr>
					<button style="width: 100%;height : 300px;" onclick="location.href='package_post?num=1'">
						<div style="padding: 10px;display: flex;">
							<img alt="" src="resources/main_image/ship_left.png" style="height: 200px;">
						</div>
					</button>
					<br><br>
					<button disabled="disabled" style="width: 100%;height : 300px;">
						<img alt="" src="resources/main_image/ship_left.png" style="width: 50px; height: 50px;">
					</button>
					<br><br>
					<button disabled="disabled" style="width: 100%;height : 300px;">
						<img alt="" src="resources/main_image/ship_left.png" style="width: 50px; height: 50px;">
					</button>
				</div>
			</section>
		</article>
	</div>
	<%@ include file="../default/footer.jsp"%>
<style>
table  {
    width: 100%;
    border-top: 0px solid rgba(50, 50, 50, 0.2);
    border-collapse: collapse;
  }
th, td {
	background-color: white;
    border-bottom: 0px solid rgba(50, 50, 50, 0.2);
    padding: 10px;
    margin: 10px;
  }
</style>
</body>
</html>