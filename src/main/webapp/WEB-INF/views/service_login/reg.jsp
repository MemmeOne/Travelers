<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style type="text/css">
	.form { margin-top: 350px;}
	a { text-decoration: none; color: black; }
	table { background: white; padding: 30px; }
</style>
<script src="resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var useremail=""
	// 이메일 인증번호 보내기
	function sendEmail() {
		var email = $('input[name=email]').val()
		var address = $('select[name=address]').val()
		var idRegExp = /^[a-z0-9]{5,20}$/; //아이디 유효성 검사
		if(email==null) {
			alert("이메일을 입력해주세요!")
			$('input[name=email]').focus()
		}else if(email=="") {
			alert("이메일을 입력해주세요!")
			$('input[name=email]').focus()
		}else if (!idRegExp.test(email)) {
		    alert("유효하지 않은 이메일입니다. 이메일을 확인해주세요.");
		    $('input[name=email]').val("")
		    $('input[name=email]').focus();
		}else {
			var form = { email : email+"@"+address }
			let html=""
			$.ajax({
				url : "email_chk",
				type : "POST",
				data : form,
				success : function(result) {
					if (result=="중복") {
						console.log("이미 있는 이메일")
						html = "<input type='button' value='인증번호 재발송' onclick='sendEmail()'><br>"
						html += "<br><label>이미 있는 이메일입니다. 다른 이메일를 입력해주세요.</label><br>"
						$("#input_code").html(html)
						$('input[name=email]').focus
					} else {
						console.log("사용 가능한 이메일")
						$.ajax({
							url : "send_email",
							type : "POST",
							data : form,
							success : function(code) {
								useremail=email+"@"+address
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
	// 아이디 중복 확인
	function id_chk() {
		var userid = $('input[name=id]').val()
		if (userid=="")  {
			alert("아이디를 입력해주세요!")
			$('input[name=id]').focuss
		}else {
			var idRegExp = /^[a-z0-9]{5,20}$/; //아이디 유효성 검사
		    if (!idRegExp.test(userid)) {
			    alert("아이디는  5 ~ 20자의 영어 소문자와 숫자만 사용하세요.");
			    $('input[name=id]').val("")
			    $('input[name=id]').focus();
			}else {
				let html = ""
				var form = { userid : userid }
				$.ajax({
					url : "id_chk",
					type : "POST",
					data : form,
					success : function(result) {
						console.log("아이디 체크 성공")
						if (result=="중복") {
							html += "<input type='button' value='중복확인' onclick='id_chk()'>"
							html += "<br><label>이미 있는 아이디입니다. 다른 아이디를 입력해주세요.</label><br>"
							$("#input_id").html(html)
							$('input[name=id]').focus
						} else {
							html += "<input type='button' value='중복확인' onclick='id_chk()'>"
							html += "<br><label>사용 가능한 아이디</label><br>"
							html += "<input type='hidden' value='"+userid+"' name='userid'>"
							$("#input_id").html(html)
						}
					},
					error : function(request, status, error) {
						console.log("실패")
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
						html += "<input type='button' value='중복확인' onclick='id_chk()'>"
							html += "<br><label>이미 있는 아이디입니다. 다른 아이디를 입력해주세요.</label><br>"
							$("#input_id").html(html)
							$('input[name=id]').focus
					}
				})
			}
		}
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
			var nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
			console.log(usernick)
		    if (!nickNameCheck.test(usernick)) {
			    alert("닉네임은  2 ~ 10자의 영어와 한글, 숫자를 사용하세요.");
			    html += "<input type='button' value='중복확인' onclick='nick_chk()'>"
				html += "<br><label>사용할 수 없는 닉네임입니다. 다른 닉네임를 입력해주세요.</label>"
				$("#input_nick").html(html)
			    $('input[name=id]').val("")
			    $('input[name=id]').focus();
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
	// 회원가입
	function reg_chk() {
		var userid = $('input[name=userid]').val()
		var userpwd = $('input[name=userpwd]').val()
		var usernick = $('input[name=usernick]').val()
		var useremail = $('input[name=useremail]').val()
		var usergender = $('input[name=gender]').val()
		var userbirth = $('input[name=birth]').val()
		if(userid==null) {
			alert("아이디를 확인해주세요.")
			$('input[name=id]').focus()
		}else if(userpwd==null) {
			alert("비밀번호를 확인해주세요.")
			$('input[name=pwd]').focus()
		}else if(usernick==null) {
			alert("닉네임을 확인해주세요.")
			$('input[name=nick]').focus()
		}else if(useremail==null) {
			alert("이메일을 확인해주세요.")
			$('input[name=email]').focus()
		}else if(usergender==null) {
			alert("성별을 선택해주세요.")
			$('input[name=gender]').focus()
		}else if(userbirth.length==0) {
			alert("생년월일을 입력해주세요.")
			$('input:date[name=birth]').focus()
		}else {
			let html = ""
			var form = { id : userid, pwd : userpwd, nick : usernick, email : useremail,
					gender : usergender, birth : userbirth }
			$.ajax({
				url : "insert_user",
				type : "POST",
				data : form,
				success : function(result) {
					console.log(result)
					if(result!=null) {
						alert("회원가입 성공!");
						location.href="login"
					}else {
						console.log("ㅅㅂ")
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
	<form action="reg_chk" method="post" class="form">
		아이디 :  5 ~ 20자의 영어 소문자와 숫자만 사용하세요.<br>
		<input type="text" name="id">
		<span id="input_id">
			<input type="button" value="중복확인" onclick="id_chk()">
		</span><br>
		<br>
		비밀번호 : 8~16자의 영문 대소문자, 숫자, 특수기호를 사용하세요.<br>
		<input type="password" name="pwd" id="pwd"> <input type="password" name="pwdok" id="pwdok"><br>
		<span id="pwc"></span><br>
		<span id="pwokc"></span>
		<script type="text/javascript">
			document.getElementById('pwd').onkeyup = function() {
				var msg = '', val = this.value;
				if (val.length >= 8 && val.length <= 16) {
					msg = GetAjaxPW(val);
				} else if (val.length > 16) {
					msg = '비밀번호가 너무 깁니다.'
				} else {
					msg = '비밀번호가 너무 짧습니다.'
				};
				document.getElementById('pwc').textContent = msg;
			};
		
			var GetAjaxPW = function(val) {
				// ajax func....
				return val + ' 사용 가능한 비밀번호입니다.'
			}
			document.getElementById('pwdok').onkeyup = function() {
				let html=""
				var msg = '', val = this.value;
				if ($('input[name=pwd]').val() == $('input[name=pwdok]').val()) {
					msg = '비밀번호가 서로 일치합니다.'
					html = "비밀번호가 서로 일치합니다."
					html += "<input type='hidden' value='"+$('input[name=pwdok]').val()+"' name='userpwd'>"
				} else {
					html = GetAjaxPWok(val);
				};
				$("#pwokc").html(html)
				//document.getElementById('pwokc').textContent = msg;
			};
		
			var GetAjaxPWok = function(val) {
				// ajax func....
				return "비밀번호가 일치하지 않습니다."
			}
		</script>
		<br><br>
		닉네임 : 닉네임은  2자 이상의 영어와 한글, 숫자를 사용하세요.<br><input type="text" name="nick">
		<span id="input_nick">
			<input type="button" value="중복확인" onclick="nick_chk()">
		</span>
		<br><br><br>
		e-mail : <input type="text" name="email"> @ 
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
		</select>
		<span id="input_code">
			<input type="button" value="인증번호 발송" onclick="sendEmail()"><br>
		</span>
		<br><br>
		성별 : 여자<input type="radio" name="gender" value="여자" checked="checked"> 남자<input type="radio" name="gender" value="남자"><br><br>
		생년월일 : <br>
		<input type="date" name="birth" max="2001-12-31" min="1940-01-01"><br>
		<br><br>
		<input type="button" value="회원가입" onclick="reg_chk()">
		<input type="button" value="취소" onclick="location.href='controller/'">
	</form>
<%@ include file="../defualt/footer.jsp" %>
</body>
</html>