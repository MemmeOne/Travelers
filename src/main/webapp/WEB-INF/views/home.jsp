<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<fmt:requestEncoding value="utf-8" />
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<<<<<<< HEAD
<a href="free_board_list?page=1">free&nbsp;board</a>
=======
<a href="reviewboard?page=1">reviewboard</a>
<a href="form">diaryform</a>
<a href="travelDiary">traveldiary</a>
>>>>>>> origin/js
</body>
</html>
