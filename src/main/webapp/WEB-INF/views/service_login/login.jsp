<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
	.form { margin-top: 350px;}
	a { text-decoration: none; color: black; }
	table { background: white; padding: 30px; }
</style>
<script src="resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function login_chk() {
		var id = $('input[name=id]').val()
		var pwd = $('input[name=pwd]').val()
		var form = {
			id : id,
			pwd : pwd
		}
		$.ajax({
			url : "login_chk",
			type : "POST",
			data : form,
			success : function(result) {
				if (result!=id) {
					if(result=="없는 아이디 입니다!") {
						alert(result)
						$('input[name=id]').focus()
					}else if(result=="비밀번호가 틀렸습니다!") {
						alert(result)
						$('input[name=pwd]').focus()
					}else {
						alert("로그인 실패<br>다시 시도해주세요.");
					}
				}else {
					console.log("성공")
					location.href="http://localhost:8895/controller/"
				}
			},
			error : function(request, status, error) {
				console.log("실패")
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}
	function validation() {
		if($('input[name=id]').val()=="") {
			alert("아이디를 입력해주세요!")
			$('input[name=id]').focus()
		}else if($('input[name=pwd]').val()=="") {
			alert("비밀번호를 입력해주세요!")
			$('input[name=pwd]').focus()
		}else {
			login_chk();
		}
	}
	
</script>

</head>
<body>
<%@ include file="../defualt/header.jsp" %>
	<form action="loginup_chk" method="post" class="form">
		<input type="text" placeholder="아이디를 입력하세요" name="id"><br>
		<input type="password" placeholder="비밀번호를 입력하세요" name="pwd"><br>
		<!-- <input type="submit" value="로그인"> -->
		<input type="button" value="로그인" onclick="validation()">
		<input type="button" value="회원가입" onclick="location.href='reg'"><br>
		<a href="find_id">아이디 찾기</a> / <a href="find_pwd">비밀번호 찾기</a>
	</form>
<%@ include file="../defualt/footer.jsp" %>
</body>
</html>