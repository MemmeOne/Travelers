<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>mate_write_save.jsp<br>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set value="${mate_dao.mate_write_save(param.title,param.content,param.nick)}" var="mate_dao"/>
</body>
</html>