<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.5.1.min.js" ></script>
<script src="resources/smarteditor2/photo-uploader/attach_photo.js" ></script>
<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
</head>
<body>
<form action="contentreg" method="post" id="frm">
<input type="hidden" name="name" value="${user.name }">
	<table style="width: 1000px">
		<tr>
		<td>제목</td>
		<td><input type="text" name="title" size="50" placeholder="제목을 입력하세요"></td> 
		</tr>			
		<tr>
		<td style="vertical-align: top;">내용</td>
		<td>
			<textarea id="content" name="content" rows="10" cols="50"></textarea>
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
		<td align="center" colspan="2">
		<input type="button" value="확인" id="contentRegBtn">
		<input type="button" value="목록" onclick="location.href='reviewboard?page=1'">
		</td>
		</tr>			
	</table>
</form>
</body>
</html>