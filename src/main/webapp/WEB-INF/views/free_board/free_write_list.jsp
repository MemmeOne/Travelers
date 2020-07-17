<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free_write_list</title>
<script src="resources/jquery-3.5.1.min.js"></script>
<script src="resources/smarteditor2/photo-uploader/attach_photo.js" ></script>
<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<style type="text/css">
	table { width:800px;}
</style>
</head>
<body>
<form action="savedata" id="frm">
<table border="1">
 <tr> 
    <td>닉네임</td>
    <td><input type="text" name="nick"></td>
 </tr>
 <tr>
    <td>제목</td>
    <td><input type="text" name="title" autofocus></td>
 </tr>
 <tr>
 <td>내용</td>
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
    <td colspan="2"><button id="contentRegBtn">제출</button>&nbsp;&nbsp; 
    <a href="free_board_list?page=1">목록보기</a></td>
 </tr>
</table>
</form>
</body>
</html>