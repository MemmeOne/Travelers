<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.5.1.min.js" ></script>
<script type="text/javascript">
	var rn = 0;
	var length = 0;
	function travelDiaryList(rn){
		var nick = $("#nick").val();
		var form={nick:nick}
		$.ajax({
			url:"travelDiaryList",
			type:"POST",
			data:form,
			success:function(list){
				length = list.length;
				let html = ""
					html += "<tr><td>"+list[rn].nation+"</td></tr>"
					html += "<tr><td>"+list[rn].startdate+"</td></tr>"
					html += "<tr><td><img src='resources/national flag/"+list[rn].nation+".png' width='88mm' height='auto'></td></tr>"
					html += "<tr><td>"+list[rn].memo+"</td></tr>"
				$("#view").html(html);
			},error:function(){
				alert("여행 수첩 실패")
			}
		})
	}
	function pre(){
		if(rn > 0){
			rn = rn - 1;
			travelDiaryList(rn);
		}else if(rn == 0){
			alert("첫페이지")
		}
	}
	function next(){
		if(rn < length-1){
			rn = rn + 1;
			travelDiaryList(rn);
		}else if(rn == length-1){
			alert("마지막 페이지")
		}
	}
</script>
</head>
<body class="is-preload">
	<%@ include file="../defualt/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<h2>My Page</h2>
						<div class="row">
							<div class="col-6 col-12-medium" style="width:200px;">
								<ul class="alt">
									<li><a href="mypage">내정보</a></li>
									<li><a href="travelDiary">여행수첩</a></li>
									<li><a href="mypage">메이트 신청 현황</a></li>
									<li><a href="mypage">작성한 글 관리</a></li>
									<li><a href="chk_pwd?page=change_userinfo">회원정보 수정</a></li>
									<li><a href="chk_pwd?page=change_pwd">비밀번호 수정</a></li>
									<li><a href="withdrawal">회원탈퇴</a></li>
								</ul>
							</div>
							<div class="col-6 col-12-medium" style="margin-left: 50px;">
								<h2>여행 수첩</h2>
								<input type="hidden" id="nick" value="aa">
								<div id="view" style="width: 88mm; height: 125mm;">
									<img src="resources/main_image/passport.jpg" style="width: 88mm; height: 125mm;; margin: 0 auto;">
								</div>
								<div id="view" style="outline:1;width: 88mm; height: 125mm;background: url('resources/main_image/inside.jpg') no-repeat;background-size: cover;">
									<div style="vertical-align: middle;text-align: center;"><br>
										국가명<br>
										<img src="resources/national flag/Korea.png" style="width: 60px; margin: 0 auto;"><br>
										<img src="resources/main_image/stamp.png" style="width: 70%; margin: 0 auto;"><br>
										도시명<br>
										2020-07-20 ~ 2020-07-30<br>
										apahahahhhhh재미써닫다다다ㅏㄷ
									</div>
								</div>
								<br><br>
								<input type="button" value="열기" onclick="travelDiaryList(rn)">
								<input type="button" value="이전" onclick="pre()">
								<input type="button" value="다음" onclick="next()"><br>
								<input type="button" value="추가" onclick="window.open('form','','width=355,height=280')">
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