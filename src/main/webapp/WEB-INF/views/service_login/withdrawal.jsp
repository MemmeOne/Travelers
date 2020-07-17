<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<style type="text/css">
	.form { margin-top: 350px;}
	a { text-decoration: none; color: black; }
	table { background: white; padding: 30px; }
</style>
<script src="resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function delete_User() {
		var id = '${loginUser.id}'
		var pwd = '${loginUser.pwd}'
		var pwdok = $('input[name=pwdok]').val()
		let html = ""
		if(pwd==pwdok) {
			var form = { id : id }
			$.ajax({
				url : "delete_User",
				type : "POST",
				data : form,
				success : function(result) {
					console.log("성공")
					alert("회원 탈퇴를 했습니다.")
					location.href="/Travelers/"
				},
				error : function(request, status, error) {
					console.log("실패")
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:"
							+ error);
				}
			})
		}else {
			alert("비밀번호가 틀립니다.")
			$('input[name=pwdok]').val("")
			$('input[name=pwdok]').focus
		}
	}
</script>
</head>
<body>
	<%@ include file="../defualt/header.jsp" %>
	<form action="" class="form">
		<h1>회원 탈퇴</h1>
			회원 탈퇴 시 Trevelers 사이트 내에 저장된 모든 정보가 삭제되며, 이후 복구가 불가합니다.<br>
			본인 확인을 위해 비밀번호를 입력하고, 이메일 인증을 진행해주세요.<br>
			<table border="1">	
				<caption><h3>회원 탈퇴를 요청한 아이디</h3></caption>
				<tr>
					<th>아이디</th><th>닉네임</th><th>이메일</th>
				</tr>
				<tr>
					<td>${loginUser.id}</td><td>${loginUser.nick}</td><td>${loginUser.email}</td>
				</tr>
			</table>
			<input type="password" name="pwdok"><input type="button" value="회원탈퇴" onclick="delete_User()"><br><br><br>
		</form>
	<%@ include file="../defualt/footer.jsp" %>
</body>
</html>