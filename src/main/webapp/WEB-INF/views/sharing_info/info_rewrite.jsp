<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 공유 글 작성 중</title>
<script src="resources/jquery-3.5.1.min.js"></script>
<script src="resources/smarteditor2/photo-uploader/attach_photo.js" ></script>
<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<style type="text/css">
	#body { margin-top: 350px; display: flex; justify-content: center; align-items: center; }
	a { text-decoration: none; color: black; }
	table { background: white; padding: 30px; width: 800px; }
</style>
</head>
<body>
	<%@ include file="../defualt/header.jsp" %>
	<!-- <textarea id = "editor4" name = "editor4"></textarea>
	<script>CKEDITOR.replace('editor4',{filebrowserUploadUrl:'/mine/imageUpload.do'});</script> -->
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<fmt:requestEncoding value="utf-8"/>
	<div id="body">
		<form action="info_modify" id="frm">
			<input type="hidden" value="${info_post.num }" name="num">
			<table border="1">
				<tr>
					<th>닉네임</th>
					<td>
						${info_post.nick }
					</td>
				</tr>
				<tr>
					<th>태그</th>
					<td>
						<select name="tag" >
							<optgroup label="태그 선택" >
								<option value="관광지">관광지</option>
								<option value="맛집">맛집</option>
								<option value="숙박">숙박</option>
								<option value="이동수단">이동수단</option>
								<option value="여행팁">여행팁</option>
							</optgroup>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" value="${info_post.title }" name="title">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea id = "content" name = "content" >${info_post.content }</textarea>
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
					</td>
				</tr>
				<tr>
					<th colspan="2"><input type="button" value="글 작성" id="contentRegBtn"></th>
				</tr>
			</table>
			<hr>
		</form>
	</div>
</body>
</html>