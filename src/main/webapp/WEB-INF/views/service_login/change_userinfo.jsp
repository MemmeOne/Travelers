<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<style type="text/css">
	.form { margin-top: 350px;}
	a { text-decoration: none; color: black; }
	table { background: white; padding: 30px; }
	table tr { height: 100px; }
</style>
<script src="resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var useremail=""
	// 이메일 인증번호 보내기
	function sendEmail() {
		var email = $('input[name=email]').val()
		var address = $('select[name=address]').val()
		var idRegExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; //아이디 유효성 검사
		if(email=='${loginUser.email}') {
			html = "<input type='button' value='인증번호 재발송' onclick='sendEmail()'><br>"
			html += "<label>현재 사용중인 이메일입니다.</label><br>"
			html += "<input type='hidden' name='useremail' value='${loginUser.email }'>"
			$("#input_code").html(html)
		}else if(email=="") {
			alert("이메일을 입력해주세요!")
			$('input[name=email]').focus()
		}else if (!idRegExp.test(email)) {
		    alert("유효하지 않은 이메일입니다. 이메일을 확인해주세요.");
		    $('input[name=email]').val("")
		    $('input[name=email]').focus();
		}else {
			var form = { email : email }
			let html=""
			$.ajax({
				url : "email_chk",
				type : "POST",
				data : form,
				success : function(result) {
					if (result=="중복") {
						console.log("이미 있는 이메일")
						html = "<input type='button' value='인증번호 재발송' onclick='sendEmail()'><br>"
						html += "<label>이미 있는 이메일입니다. 다른 이메일를 입력해주세요.</label><br>"
						$("#input_code").html(html)
						$('input[name=email]').focus
					} else {
						console.log("사용 가능한 이메일")
						$.ajax({
							url : "send_email",
							type : "POST",
							data : form,
							success : function(code) {
								useremail=email
								html="<input type='button' value='인증번호 재발송' onclick='sendEmail()'><br>"
								html+="<br><label>이메일이 발송되었습니다. 이메일 발송시 최대 5분의 시간이 소요 될 수 있습니다.</label><br>"
								html+="<input type='text' name='usercode'>"
								html+="<input type='button' value='인증번호확인' onclick='code_chk()'>"
								$("#input_code").html(html)
								console.log("성공 : "+code)
							},
							error : function(request, status, error) {
								console.log("실패")
								alert("code:" + request.status + "\n" + "message:"
										+ request.responseText + "\n" + "error:" + error);
								html = "<input type='button' value='인증번호 재발송' onclick='sendEmail()'><br>"
								html += "<br><label>이메일 인증에 실패했습니다. 인증번호 재발송 버튼을 눌러주세요.</label><br>"
								$("#input_code").html(html)
							}
						})
					}
				},
				error : function(request, status, error) {
					console.log("실패")
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
					html = "<input type='button' value='인증번호 재발송' onclick='sendEmail()'><br>"
					html += "<br><label>이메일 인증에 실패했습니다. 인증번호 재발송 버튼을 눌러주세요.</label><br>"
					$("#input_code").html(html)
				}
			})
		}
	}
	// 이메일 인증번호 확인
	function code_chk() {
		var usercode = $('input[name=usercode]').val()
		let html = ""
		var form = { usercode : usercode }
		$.ajax({
			url : "code_chk",
			type : "POST",
			data : form,
			success : function(result) {
				if (result=="인증 완료") {
					html="<input type='button' value='인증번호 재발송' onclick='sendEmail()'><br>"
					html += "<label>이메일 인증이 완료되었습니다.</label><br>"
					html += "<input type='hidden' value='"+useremail+"' name='useremail'>"
					$("#input_code").html(html)
				} else {
					html += "<input type='button' value='인증번호 재발송' onclick='sendEmail()'>"
					html += "<br><label>이메일 인증에 실패했습니다.<br>이메일 주소를 확인하시고 인증번호 재발송 버튼을 눌러주세요.</label><br>"
					$("#input_code").html(html)
					$('input[name=usercode]').focus
				}
			},
			error : function(request, status, error) {
				console.log("실패")
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:"
						+ error);
				html = "<input type='button' value='인증번호 재발송' onclick='sendEmail()'>"
				html += "<br><label>이메일 인증에 실패했습니다.<br>이메일 주소를 확인하시고 인증번호 재발송 버튼을 눌러주세요.</label><br>"
				$("#input_code").html(html)
				$('input[name=usercode]').focus
			}
		})
	}
	// 닉네임 중복 확인
	function nick_chk() {
		var usernick = $('input[name=nick]').val()
		let html = ""
		if (usernick=="")  {
			alert("닉네임을 입력해주세요!")
			$('input[name=nick]').focuss
		}else {	
			var nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
			if ( usernick=='${loginUser.nick}' ) {
				html += "<input type='button' value='중복확인' onclick='nick_chk()'>"
				html += "<br><label>현재 사용중인 닉네임입니다.</label>"
				html += "<input type='hidden' name='usernick' value='${loginUser.nick }'>"
				$("#input_nick").html(html)
				$('input[name=nick]').focus
			} else {
			    if (!nickNameCheck.test(usernick)) {
				    alert("닉네임은  2 ~ 10자의 영어와 한글, 숫자를 사용하세요.");
				    html += "<input type='button' value='중복확인' onclick='nick_chk()'>"
					html += "<br><label>사용할 수 없는 닉네임입니다. 다른 닉네임를 입력해주세요.</label>"
					$("#input_nick").html(html)
				    $('input[name=nick]').val("")
				    $('input[name=nick]').focus();
				}else {
					var form = { usernick : usernick }
					$.ajax({
						url : "nick_chk",
						type : "POST",
						data : form,
						success : function(result) {
							console.log("닉네임 체크 성공")
							if (result=="중복") {
								html += "<input type='button' value='중복확인' onclick='nick_chk()'>"
								html += "<br><label>이미 있는 닉네임입니다. 다른 닉네임를 입력해주세요.</label>"
								$("#input_nick").html(html)
								$('input[name=nick]').focus
							} else {
								html += "<input type='button' value='중복확인' onclick='nick_chk()'>"
								html += "<br><label>사용 가능한 닉네임</label>"
								html += "<input type='hidden' value='"+usernick+"' name='usernick'>"
								$("#input_nick").html(html)
							}
						},
						error : function(request, status, error) {
							console.log("실패")
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
							html += "<input type='button' value='중복확인' onclick='nick_chk()'>"
								html += "<br><label>이미 있는 닉네임입니다. 다른 닉네임를 입력해주세요.</label><br>"
								$("#input_nick").html(html)
								$('input[name=nick]').focus
						}
					})
				}
			}
		}
	}
	// 회원가입
	function reg_chk() {
		var userid = $('input[name=userid]').val()
		var usernick = $('input[name=usernick]').val()
		var useremail = $('input[name=useremail]').val()
		var usergender = $('input:radio[name=gender]:checked').val()
		var userbirth = $('input[name=birth]').val()
		console.log($('input:radio[name=gender]:checked').val())
		if(userid==null) {
			alert("아이디를 확인해주세요.")
			$('input[name=id]').focus()
		}else if(usernick==null) {
			alert("닉네임을 확인해주세요.")
			$('input[name=nick]').focus()
		}else if(useremail==null) {
			alert("이메일을 확인해주세요.")
			$('input[name=email]').focus()
		}else if(usergender==null) {
			alert("성별을 선택해주세요.")
		}else if(userbirth.length==0) {
			alert("생년월일을 입력해주세요.")
			$('input:date[name=birth]').focus()
		}else {
			let html = ""
			var form = { id : userid, nick : usernick, email : useremail,
					gender : usergender, birth : userbirth }
			$.ajax({
				url : "update_user",
				type : "POST",
				data : form,
				success : function(result) {
					console.log(result)
					if(result!=null) {
						alert("정보 수정 완료!");
						location.href="mypage"
					}else {
						console.log("수정 실패")
					}
				},
				error : function(request, status, error) {
					console.log("실패")
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:"
							+ error);
				}
			})
		}
	}
</script>
</head>
<body>
<%@ include file="../defualt/header.jsp" %>
	<table class="form" border="1">
		<tr>
			<th>아이디</th>
			<td>
				${loginUser.id }
				<input type="hidden" name="userid" value="${loginUser.id }">
			</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>
				닉네임은  2자 이상의 영어와 한글, 숫자를 사용하세요.<br><input type="text" name="nick" placeholder="닉네임" value="${loginUser.nick }">
				<span id="input_nick">
					<input type="button" value="중복확인" onclick="nick_chk()">
					<input type="hidden" name="usernick" value="${loginUser.nick }">
				</span>
			</td>
		</tr>
		<tr>
			<th>e-mail</th>
			<td>
				<input type="text" name="email" placeholder="이메일" value="${loginUser.email }">
				<span id="input_code">
					<input type="button" value="인증번호 발송" onclick="sendEmail()">
					<input type="hidden" name="useremail" value="${loginUser.email }">
				</span>
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<c:choose>
					<c:when test="${loginUser.gender eq '여자' }">
						여자<input type="radio" name="gender" value="여자" checked="checked"> 남자<input type="radio" name="gender" value="남자">
					</c:when>
					<c:otherwise>
						여자<input type="radio" name="gender" value="여자"> 남자<input type="radio" name="gender" value="남자" checked="checked">
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type="date" name="birth" max="2001-12-31" min="1940-01-01" value="${loginUser.birth }">
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" value="회원가입" onclick="reg_chk()"> 
				<input type="button" value="취소" onclick="location.href='http://localhost:8895/controller/'">
			</th>
		</tr>
	</table>
	<%@ include file="../defualt/footer.jsp" %>
</body>
</html>