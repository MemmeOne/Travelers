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
<form action="savedata">
<table border="1">
 <tr> 
    <td>닉네임</td>
    <td><input type="text" name="nick" size="50"></td>
 </tr>
 <tr>
    <td>제목</td>
    <td><input type="text" name="title" size="50"></td>
 </tr>
 <tr>
 <td>내용</td>
 <td>
   <textarea name="content" rows="10" cols="50">${dto.content }</textarea>
 </td>
 </tr>
 <tr>
    <td colspan="2"><input type="submit">&nbsp;&nbsp; 
    <a href="free_board_list"></a></td>
 </tr>
 

</table>
</form>
</body>
</html>