<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<style type="text/css">
</style>
</head>
<body class="is-preload">
	<%@ include file="../defualt/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<form action="">
					<table>
						<tr>
						<th style="width:60px;text-align: center;">제목</th>
						<th><input type="text" name="title" autofocus="autofocus"></th>
						</tr>
						<tr>
						<th colspan="2" style="margin: 0 auto;">
						<textarea rows="15" cols="50" id="content"></textarea>
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
							        //id가 smarteditor인 textarea에 에디터에서 대입
							        editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
							        $("#frm").submit();
							    });
							    
							    function getContextPath() {
							    	return sessionStorage.getItem("contextpath");
							    }
							});
							</script>
						</th>
						</tr>
						<tr>
						<th style="text-align: left: ;">
						<input type="button" value="목록보기">	
						</th>
						<th style="text-align: right;">
						<input type="button" value="완료">
						</th>
						</tr>
					</table>
					</form>
				</div>
			</section>
		</article>
	</div>
	<%@ include file="../defualt/footer.jsp"%>
</body>
</html>