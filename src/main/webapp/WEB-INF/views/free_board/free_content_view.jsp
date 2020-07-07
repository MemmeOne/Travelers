<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free_content_view</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<form action="free_modify_view">
<input type="hidden" name="num" value="${lists.num }">
<table border="1">
     <tr>
         <td>번호</td> <td>${lists.num }</td>
     </tr>
     <tr>
         <td>조회수</td> <td>${lists.hit }</td>
     </tr>
     <tr>
         <td>닉네임</td>
         <td>${lists.nick }</td>
     </tr>
     <tr>
          <td>제목</td>
          <td>${lists.title }</td>
     </tr>
     <tr>
          <td>내용</td>
          <td height="200" width="350">${lists.content } </td> 
     </tr>
     <tr>
        <td colspan="2">
           <input type="submit" value="수정">&nbsp;&nbsp;
           <a href="free_board_list">목록보기</a>&nbsp;&nbsp;
           <a href="free_board_delete?num=${lists.num }">삭제</a>&nbsp;&nbsp;
           <a href="#">답변</a>
        </td>   
     </tr>   
    </table>
   </form>
</body>
</html>