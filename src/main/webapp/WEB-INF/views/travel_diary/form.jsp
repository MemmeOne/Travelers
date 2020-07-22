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
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
    	$("#nation").select2();
	});
</script>
</head>
<body>
	<div style="margin: 0 auto;padding: 10px;">
	<form action="travelDiaryReg" method="post" style="">
	<h3 style="text-align: center;">여행지 등록</h3>
	<input type="hidden" name="nick" value="aa">
	나라 : <select id="nation" name="nation" style="width: 260px;">
      		<c:forEach var="nation" items="${nationlist }">
      		<option value="${nation }">${nation }</option>
      		</c:forEach>
		</select><br>
	도시 : <input type="text" name="city" style="width: 252px;"><br>
	여행 기간 : <br>
	<input type="date" name="startdate"> ~ <input type="date" name="enddate"><br>
	메모 : <input type="text" name="memo" style="width: 252px;"><br><br>
	<input type="submit" value="확인" style="margin-left: 250px;">
	</form>
	</div>
</body>
</html>