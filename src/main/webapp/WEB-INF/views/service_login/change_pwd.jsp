<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.form { margin-top: 350px;}
	a { text-decoration: none; color: black; }
	table { background: white; padding: 30px; }
</style>
<script src="resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var pwdchk=false
	var pwdokchk=false
	function change_pwd_save() {
		console.log(pwdchk)
		console.log(pwdokchk)
		if( !( pwdchk && pwdokchk ) ) {
		    alert("유효하지 않은 비밀번호입니다.\n비밀번호를 확인해주세요.");
		    $('input[name=pwd]').val("")
		    $('input[name=pwdok]').val("")
		    $('input[name=pwd]').focus();
		}else {
			var form = { id : '${loginUser.id}', pwd : $('input[name=pwd]').val() }
			let html=""
			$.ajax({
				url : "change_pwd_save",
				type : "POST",
				data : form,
				success : function(result) {
					alert("비밀번호 변경에 성공하였습니다.\n다시 로그인해주시길 바랍니다.")
					location.href="http://localhost:8895/controller/"
				},
				error : function(request, status, error) {
					console.log("실패")
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
					alert("비밀번호 변경에 실페하였습니다.\n다시 시도해주세요.")
					$('input[name=pwd]').val("")
				    $('input[name=pwdok]').val("")
				    $('input[name=pwd]').focus();
				}
			})
		}
	}
</script>
</head>
<body>
	<%@ include file="../defualt/header.jsp" %>
	<form action="" class="form">
		<h1>새로운 비밀번호를 입력하세요.</h1>
		8~16자의 영문 대소문자, 숫자, 특수기호를 사용하세요.<br>
		<input type="password" name="pwd" id="pwd" placeholder="비밀번호"> <input type="password" name="pwdok" id="pwdok" placeholder="비밀번호 확인"><br>
		<span id="pwc"></span><br>
		<span id="pwokc"></span><br>
		<input type="button" value="확인" onclick="change_pwd_save()">
	</form>
	<!-- 비밀번호 유효성 실시간으로 확인하는 자바스크립트 -->
	<script type="text/javascript">
		document.getElementById('pwd').onkeyup = function() {
			var msg = '', val = this.value;
			if (val.length >= 8 && val.length <= 16) {
				var idRegExp = /^[a-z0-9]{8,16}$/; // 비밀번호 유효성 검사
			    if (!idRegExp.test($('input[name=pwd]').val())) {
					msg = '유효하지 않는 형식의 비밀번호 입니다.'
					pwdchk=false
				}else {
					pwdchk=true
					msg = GetAjaxPW(val);
				}
			} else if (val.length > 16) {
				pwdchk=false
				msg = '비밀번호가 너무 깁니다.'
			} else {
				pwdchk=false
				msg = '비밀번호가 너무 짧습니다.'
			}
			;
			document.getElementById('pwc').textContent = msg;
		};

		var GetAjaxPW = function(val) {
			// ajax func....
			return val + ' 사용 가능한 비밀번호입니다.'
		}
		document.getElementById('pwdok').onkeyup = function() {
			let html = ""
			var msg = '', val = this.value;
			if (($('input[name=pwd]').val() == $('input[name=pwdok]').val())) {
				if(pwdchk) {
					pwdokchk=true
					html = "비밀번호가 서로 일치합니다."
					html += "<input type='hidden' value='"
							+ $('input[name=pwdok]').val() + "' name='userpwd'>"
				}
			} else {
				html = GetAjaxPWok(val);
			};
			$("#pwokc").html(html)
		};

		var GetAjaxPWok = function(val) {
			// ajax func....
			return "비밀번호가 일치하지 않습니다."
		}
	</script>
	<%@ include file="../defualt/footer.jsp" %>
</body>
</html>