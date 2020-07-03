<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		#travelers {color:white; text-align: center; font-size: 55pt; position:relative; top: 160px; }
		#travelers a {text-decoration:none ;color:white;}
		body { background-image: url('resources/main_image/01.png'); background-color: black;
			background-repeat : no-repeat; background-size : cover;}
		#menu { position: absolute; right: 30px; margin: 30px;}
		#menu a {text-decoration:none ;color:white;}
		body {margin: 0 auto;}
	</style>
</head>
<body>
<div id="menu">
	<a href="login">Sign In</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="reg">Sign Up</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="login">Mate</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="info_list?page=1">Info Board</a>
</div>
<div id="travelers"><b><a href="/controller/">TRAVELERS</a></b></div>
</body>
</html>