<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
			success : function(list) {
				if (list!=null) {
					if(list.pwd==pwd) {
						console.log("성공")
					}else {
						alert("비밀번호가 틀렸습니다!")
						$('input[name=pwd]').focus()
					}
				}else {
					alert("없는 아이디 입니다!")
					$('input[name=id]').focus()
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
		console.log('클릭')
		console.log($('input[name=id]').val())
		console.log($('input[name=pwd]').val())
		if($('input[name=id]').val()=="") {
			alert("아이디를 입력해주세요!")
			$('input[name=id]').focus()
		}else if($('input[name=pwd]').val()=="") {
			alert("비밀번호를 입력해주세요!")
			$('input[name=pwd]').focus()
		}else {
			login_chk();
		}
		/* var num=$('input[name=num]').val();
		var commentgroup=$('commentgroup'+cnt).val();
		let html=comment_html
		html += "<tr>"
		html += "<input type='hidden' id='renumgroup"+cnt+"' value='"+num+" '>"
		html += "<input type='hidden' id='commentgroup"+cnt+"' value='"+commentgroup+"'>"
		html += "<input type='hidden' id='restep"+cnt+"' value='1'>"
		html += "<input type='hidden' id='reindent"+cnt+"' value='1'>"
		html += "<td colspan='4'><input type='text' id='renick"+cnt+"' placeholder='닉네임'>"
		html += "<textarea rows='4' cols='50' id='recontent"+cnt+"'></textarea></td><td>"
		html += "<input type='button' value='댓글달기' onclick='comment_reply_save("+cnt+")'></td></tr>"
		$("#reply"+cnt).html(html) */
	}
	
</script>

</head>
<body>
<%@ include file="../defualt/header.jsp" %>
	<form action="loginup_chk" method="post">
		<input type="text" placeholder="아이디를 입력하세요" name="id"><br>
		<input type="password" placeholder="비밀번호를 입력하세요" name="pwd"><br>
		<!-- <input type="submit" value="로그인"> -->
		<input type="button" value="로그인" onclick="validation()">
		<input type="button" value="회원가입" onclick="location.href='reg'"><br>
		<label id="warning"></label>
	</form>
<%@ include file="../defualt/footer.jsp" %>
</body>
</html>