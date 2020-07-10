<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.5.1.min.js" ></script>
<script type="text/javascript">

</script>
</head>
<c:set var="i" value="0"/>
<body>
	<table border="1" style="width: 88mm; height: 125mm; border-collapse: collapse;">
		<tr>
			<td>${travelDiaryList[i].nation }</td>
		</tr>
		<tr>
			<td><img src="resources/image/${travelDiaryList[i].nation }.jpg">
			</td>
		</tr>
		<tr>
			<td>${travelDiaryList[i].city }</td>
		</tr>
		<tr>
			<td>${travelDiaryList[i].memo}</td>
		</tr>
	</table>
	<c:choose>
	<c:when test="${i eq 0 }">
		<button disabled="disabled">이전</button>
	</c:when>
	<c:otherwise>
		<button onclick="pre()">이전</button>
	</c:otherwise>
	</c:choose>
	<c:choose>
	<c:when test="${i eq travelDiaryList.size()-1 }">
		<input type="button" onclick="next()" value="다음">
	</c:when>
	<c:otherwise>
		<input type="button" onclick="" value="다음">
	</c:otherwise>
	</c:choose>
	${i }
</body>
</html>