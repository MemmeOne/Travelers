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
<script>
	function loginUserList(){
		$.ajax({
			url: "loginUserList",
			type: "POST",
			dataType : "JSON",
			sucess: function(data){
				console.log("data")
			},error: function(request, status, error){
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		})
	}
</script>
</head>
<body onload="loginUserList()">
<div>
<table>
</table>
</div>
</body>
</html>