<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행수첩</title>
<script src="resources/jquery-3.5.1.min.js" ></script>
<script type="text/javascript">
	var rn = 0;
	var length = 0;
	var stamp = "resources/main_image/stamp.png";
	var inside = "resources/main_image/inside.jpg";
	function travelDiaryList(){
		var nick = $("#nick").val();
		var form={nick:nick}
		$.ajax({
			url:"travelDiaryList",
			type:"POST",
			data:form,
			success:function(list){
				length = list.length;
				if(length == 0){
					alert("여행 수첩을 추가하세요")
				}else{
					let html = ""
						html += '<input type="hidden" name="num" value="'+list[rn].num+'">';
						html +=	'<h2>여행 수첩</h2>';
						html += '<div style="display: flex;">';
						html += '<input type="button" value="<" onclick="pre()" style="margin-top: 200px;">';
						html +=	'<div style="outline:1;width: 88mm; height: 125mm; background: url('+inside+') no-repeat; background-size: cover;">';
						html +=	'<div style="vertical-align: middle;text-align: center;">';
						html +=	'<br>'+list[rn].city+'<br>';
						html +=	'<img src="resources/national flag/'+list[rn].nation+'.png" style="width: 60px; height: 30px; margin: 0 auto;"><br>';
						html +=	'<img src="'+stamp+'" style="width: 70%; margin: 0 auto;"><br>';
						html +=	'<span style="position: relative; bottom: 150px; display:inline-block; width:110px; height: 33px; line-height:1em; font-size: 10pt;">'+list[rn].nation+'</span><br>';
						html +=	'<span style="position: relative; bottom: 110px; font-size: 10pt;">'+list[rn].startdate+'</span><br>';
						html +=	'<span style="position: relative; bottom: 80px;">'+list[rn].startdate+' ~ '+list[rn].enddate+'</span><br>'
						html +=	'<span style="position: relative; bottom: 70px; display:inline-block; width:300px; word-break:break-all;">'+list[rn].memo+'</span>';
						html += '</div>';
						html +=	'</div>';
						html +=	'<input type="button" value=">" onclick="next()" style="margin-top: 200px;">';
						html +=	'</div>';
						html +=	'<br><br>';
						html +=	'<input type="button" value="수정" onclick="travelDiaryMod()" >';
						html +=	'<input type="button" value="삭제" onclick="travelDiaryDel()" >';
						html +=	'<input type="button" value="닫기" onclick="window.location.reload()" >';
					$("#view").html(html);
				}
			},error:function(){
				alert("여행 수첩 실패")
			}
		})
	}
	function pre(){
		if(rn > 0){
			rn = rn - 1;
			travelDiaryList();
		}else if(rn == 0){
			alert("첫페이지")
		}
	}
	function next(){
		if(rn < length-1){
			rn = rn + 1;
			travelDiaryList();
		}else if(rn == length-1){
			alert("마지막 페이지")
		}
	}
	function travelDiaryMod(){
		window.open('','travelDairy_Modify','width=500,height=300');
		$("#frm").attr("target","travelDairy_Modify");
		$("#frm").attr("action","travelDiaryMod");
		$("#frm").submit();
	}
	function travelDiaryDel(){
		$("#frm").attr("action","travelDiaryDel");
		$("#frm").submit();
	}
</script>
</head>
<body class="is-preload">
	<%@ include file="../default/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
					<input type="hidden" id="nick" value="${loginUser.nick }">
					<h2>My Page</h2>
						<div class="row">
							<div class="col-6 col-12-medium" style="width:200px;">
								<ul class="alt">
									<li><a href="mypage">내정보</a></li>
									<li><a href="travelDiary">여행수첩</a></li>
									<li><a href="note?nick=${loginUser.nick }">쪽지함</a></li>
									<li><a href="myPost?page=1&nick=${loginUser.nick }">작성한 글 관리</a></li>
									<li><a href="chk_pwd?page=change_userinfo">회원정보 수정</a></li>
									<li><a href="chk_pwd?page=change_pwd">비밀번호 수정</a></li>
									<li><a href="withdrawal">회원탈퇴</a></li>
								</ul>
							</div>
							<form id="frm" method="post">
							<div id="view" class="col-6 col-12-medium" align="center" style="margin-left: 50px;">
								<h2>여행 수첩</h2>
								<div style="width: 88mm; height: 125mm;">
									<img src="resources/main_image/passport.jpg" style="width: 88mm; height: 125mm;; margin: 0 auto;">
								</div>
								<br><br>
								<input type="button" value="열기" onclick="travelDiaryList()">
								<input type="button" value="추가" onclick="window.open('form','','width=500,height=300')">
							</div>
							</form>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	<%@ include file="../default/footer.jsp"%>
</body>
</html>