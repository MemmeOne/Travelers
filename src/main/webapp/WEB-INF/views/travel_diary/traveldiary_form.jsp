<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행수첩 등록</title>
<script src="resources/jquery-3.5.1.min.js" ></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
    	$("#nation").select2();
	});
	function rbs(){
		if($("#nation").val() == "none"){
			alert("나라를 입력하세요")
		}else if($("#city").val() == "" || $("#city").val() == " "){
			alert("도시를 입력하세요")
		}else if($("#startdate").val() == "" || $("#enddate").val() == ""){
			alert("여행 기간를 입력하세요")
		}else if($("#startdate").val() > $("#enddate").val()){
			alert("여행 기간이 맞지 않습니다")
		}else if($("#memo").val() == "" || $("#memo").val() == " "){
			alert("메모를 입력하세요")
		}else{
			$("#frm").submit();
		}
	}
</script>
</head>
<body>
	<div align="center" style="margin: 0 auto;padding: 10px;">
	<form id="frm" action="travelDiaryReg" method="post">
	<h3 style="text-align: center;">여행지 등록</h3>
	<input type="hidden" name="nick" value="${loginUser.nick }">
	나라 : <select id="nation" name="nation" id="nation" style="width: 260px;">
			<option value="none">===선택 ===</option>
      		<c:forEach var="nation" items="${nationlist }">
      		<option value="${nation }">${nation }</option>
      		</c:forEach>
		</select><br>
	도시 : <input type="text" name="city" id="city" style="width: 252px;"><br>
	여행 기간 : &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br>
	<input type="date" id="startdate" name="startdate"> ~ <input type="date" id="enddate" name="enddate"><br>
	메모 : <input type="text" id="memo" name="memo" style="width: 252px;"><br><br>
	<input type="button" value="확인" style="margin-left: 250px;" onclick="rbs()">
	</form>
	</div>
</body>
</html>