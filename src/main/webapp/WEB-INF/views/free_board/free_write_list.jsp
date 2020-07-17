<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free_write_list</title>
</head>
<body>
<form action="savedata" id="userinput">
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
 </td>
 </tr>
 <tr>
    <td colspan="2"><button id="btn">제출</button>&nbsp;&nbsp; 
    <a href="free_board_list?page=1">목록보기</a></td>
 </tr>
</table>
</form>
</body>
</html>