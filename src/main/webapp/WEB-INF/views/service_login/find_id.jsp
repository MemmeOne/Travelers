<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
<script src="resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function your_id() {
		if($('input[name=email]').val()=="") {
			alert("이메일을 입력하세요!")
			$('input[name=email]').focus
		}else {
			var email = $('input[name=email]').val() + "@" + $('select[name=address]').val()
			var form = { email : email }
			let html = ""
			$.ajax({
				url : "get_id",
				type : "POST",
				data : form,
				success : function(result) {
					if (result == "아이디없음") {
						html += "<br><label>해당 이메일로 가입한 아이디가 없습니다.</label><br><br>"
						html += "<a href='reg_tos'>회원가입하기</a>"
						$("#none_id").html(html)
					} else {
						html += "<label>"+email+"로 가입한 아이디<br></label>"
						html += "<h3>"+result+"</h3><br>"
						html += "<a href='find_pwd'>비밀번호 찾기</a>"
						$("#find_id").html(html)
					}
				},
				error : function(request, status, error) {
					console.log("실패")
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			})
		}
	}
</script>
</head>
<body>
	<h1>아이디 찾기</h1>
	<div id="find_id">
		이메일을 입력하세요.<br>
		<input type="text" name="email"> @
		<select name="address">
			<option value="dreamwiz.com">dreamwiz.com</option>
			<option value="empal.com">empal.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="hanmir.com">hanmir.com</option>
			<option value="hitel.net">hitel.net</option>
			<option value="hotmail.com">hotmail.com</option>
			<option value="kebi.com">kebi.com</option>
			<option value="korea.com">korea.com</option>
			<option value="nate.com">nate.com</option>
			<option value="naver.com" selected="selected">naver.com</option>
			<option value="orgio.net">orgio.net</option>
			<option value="yahoo.co.kr">yahoo.co.kr</option>
			<option value="yahoo.com">yahoo.com</option>
		</select> <input type="button" onclick="your_id()" value="아이디 찾기"><br>
		<span id="none_id"></span><br>
	</div>
	<br>
</body>
</html>