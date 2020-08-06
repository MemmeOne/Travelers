<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 공유 글 작성 중</title>
<script src="resources/jquery-3.5.1.min.js"></script>
<!-- <script src="resources/smarteditor2/photo-uploader/attach_photo.js" ></script> -->
<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<script type="text/javascript">
	function chk_loginUser() {
		if ('${loginUser}' == "") {
			alert("로그인 후 사용 가능합니다.")
			location.href="login"
		}else {
			console.log("로그인 확인 성공")
		}
	}
</script>
</head>
<body onload="chk_loginUser()" class="is-preload">
	<%@ include file="../default/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<form action="package_save" id="frm">
					<table>
						<tr>
							<td style="width:150px;text-align: center;">제목</td>
							<td><input type="text" placeholder="제목을 입력하세요." name="title" autofocus="autofocus"></td>
						</tr>
						<tr>
							<td>가격</td>
							<td style="text-align:left;">
								<input type="number" name="pay" placeholder="가격을 입력하세요." style="color:black;width:40%;">
							</td>
						</tr>
						<tr>
							<td>테마</td>
							<td>
								<input type="text" name="theme" placeholder="여행 테마를 입력하세요.">
							</td>
						</tr>
						<tr>
							<td>기간</td>
							<td style="text-align:left;">
								<input type="number" name="term" placeholder="여행 일수를 입력하세요." style="color:black;width:40%;">
							</td>
						</tr>
						<tr>
							<td>출발지</td>
							<td>
								<input type="text" name="start_point" placeholder="출발지를 입력하세요. ex) 인천  - 괌">
							</td>
						</tr>
						<tr>
							<td>출발날짜</td>
							<td style="text-align:left;">
								<input type="datetime" name="start_date" placeholder="2020-08-01 09:00" style="color:black;width:40%;">
							</td>
						</tr>
						<tr>
							<td>출발항공편</td>
							<td>
								<input type="text" name="start_plane" placeholder="출발항공편을 입력하세요. ex) 에어부산 BX797편">
							</td>
						</tr>
						
						<tr>
						<td colspan="2" style="margin: 0 auto;background: white;">
						<textarea rows="15" cols="50" id="content" name = "content"></textarea>
						<script type="text/javascript">
							$(function() {
								//전역변수선언
							    var editor_object = [];
							    var ctx = getContextPath();
				
							    nhn.husky.EZCreator.createInIFrame({
							        oAppRef: editor_object,
							        elPlaceHolder: "content",
							        sSkinURI: ctx + "/resources/smarteditor/SmartEditor2Skin.html",
							        htParams : {
							            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							            bUseToolbar : true,             
							            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							            bUseVerticalResizer : true,     
							            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							            bUseModeChanger : true,
							            fOnBeforeUnload : function(){
							                
							            }
							        }
							    });
							    
							  //전송버튼 클릭이벤트
							    $("#contentRegBtn").click(function(){
								    editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
							        var content =  document.getElementById("content").value
							        content = content.replace(/<p>/gi,"");
							        content = content.replace(/<\/p>/gi,"");
							        content = content.replace(/<br>/gi,"");
							        content = content.replace(/&nbsp;/gi,"");
							        content = content.replace(/ /gi,"");
							    	if($('input[name=title]').val()=="") {
							    		alert("제목을 입력하세요.")
							    		$('input[name=title]').focus()
							    	}else if(content=="") {
							    		alert("내용을 입력하세요.")
							    		$('input[name=content]').focus()
							    	}else {
								        //id가 smarteditor인 textarea에 에디터에서 대입
								        $("#frm").submit();
							    	}
							    });
							    
							    function getContextPath() {
							    	return sessionStorage.getItem("contextpath");
							    }
							});
							</script>
						</td>
						</tr>
						<tr>
						<td colspan="2" style="text-align: right;">
						<input type="button" value="완료" id="contentRegBtn">
						</td>
						</tr>
					</table>
					</form>
				</div>
			</section>
		</article>
	</div>
	<%@ include file="../default/footer.jsp"%>
<style>
table  {
    width: 100%;
    border-top: 1px solid rgba(50, 50, 50, 0.2);
    border-collapse: collapse;
  }
th, td {
	background-color: white;
    border-bottom: 1px solid rgba(50, 50, 50, 0.2);
    padding: 10px;
    margin: 10px;
    text-align: center;
  }
</style>
</body>
</html>