<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function chk_pwd() {
		var id = '${loginUser.id}'
		var pwd = $('input[name=pwd]').val()
		var form = {
			id : id,
			pwd : pwd
		}
		$.ajax({
			url : "chk_dbpwd",
			type : "POST",
			data : form,
			success : function(result) {
				if (result == "비밀번호가 틀렸습니다!") {
					alert("비밀번호가 틀립니다.\n다시 입력해주세요.")
					$('input[name=pwd]').val("")
					$('input[name=pwd]').focus
				} else {
					console.log("성공")
					switch ('${param.page}') {
					case 'change_pwd':
						location.href = "change_pwd"
						break;
					case 'change_userinfo':
						location.href = "change_userinfo"
						break;
					default:
						alert("잘못된 겅로입니다.\n메인페이지로 돌아갑니다.")
						location.href = "/Travelers/"
						break;
					}
				}
			},
			error : function(request, status, error) {
				console.log("실패")
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}
</script>
</head>
<body>
	해당 서비스를 이용하려면 확인이 필요합니다.<br>비밀번호를 입력하세요.<br><br>
	<input type="password" name="pwd" placeholder="비밀번호"> <input type="button" value="확인" onclick="chk_pwd()">
</body>
</html>