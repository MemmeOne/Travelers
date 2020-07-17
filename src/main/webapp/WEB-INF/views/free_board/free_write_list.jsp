<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free_write_list</title>
  <!-- <script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script> 
 <script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
 -->
<!--  <script src="resources/ckeditor/ckeditor.js"></script> -->
<!-- <script src="resources/ckeditor/ckeditor.js"></script> -->
<!--  <script src="//cdn.ckeditor.com/4.14.1/full/ckeditor.js"></script>
<!--  <script>
$(function(){
    CKEDITOR.replace('content', {
        filebrowserUploadUrl: '${pageContext.request.contextPath }/adm/fileupload.do'
    });
});
</script>-->
<script src="resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
<form action="savedata" id="userinput">
<table border="1" width="1000" height="100%">
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
    <textarea id="content" name="content"></textarea>
    <!--  <script>CKEDITOR.replace('content');</script> -->
      <!--   <script type="text/javascript">
$(function(){
	CKEDITOR.replace('content',{
		filebrowserUploadUrl: '${pageContext.request.contextPath }/adm/fileupload.do'
	});
});
</script>--> 
 <!--    <script>
 var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,
   shiftEnterMode : CKEDITOR.ENTER_P,
   filebrowserUploadUrl : "/admin/goods/ckUpload"
 };
 
 CKEDITOR.replace("content", ckeditor_config);
</script>-->
 </td>
 </tr>
 <tr>
    <td colspan="2"><button id="btn">제출</button>&nbsp;&nbsp; 
    <a href="free_board_list?page=1">목록보기</a></td>
 </tr>
</table>
</form>
<script>
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({
	oAppRef : oEditors,
	elPlaceHolder : "content",
	sSkinURI : "resources/smarteditor2/SmartEditor2Skin.html",
	fCreator : "createSEditor2"
});
</script>
<script>
	$('#btn').click(function () {
	    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD",[]);
	  	$("form").submit();
	  });
</script>
</body>
</html>