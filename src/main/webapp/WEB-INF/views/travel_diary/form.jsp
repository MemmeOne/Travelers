<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="travelDiaryReg" method="post">
	<input type="hidden" name="nick" value="aa">
	나라 : <select name="nation">
      		<c:forEach var="nation" items="${nationlist }">
      		<option value="${nation }">${nation }</option>
      		</c:forEach>
		</select><br>
	도시 : <input type="text" name="city"><br>
	한줄평 : <input type="text" name="memo"><br>
	<input type="submit" value="확인">
	</form>
</body>
</html>