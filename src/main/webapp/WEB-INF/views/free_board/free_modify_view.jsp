<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdn.ckeditor.com/4.14.1/full/ckeditor.js"></script>
<title>free_modify_view</title>
</head>
<body>
<form action="updatedata">
<input type="hidden" value="${lists.num }" name="num">
<table border="1">
    <tr>
        <td>번호</td> <td>${lists.num }</td>
    </tr>
    <tr>
        <td>조회수</td> <td>${lists.hit }</td>
    </tr>
    <tr>
        <td>닉네임</td> <td>${lists.nick }</td>
    </tr>
    <tr>
        <td>제목</td> <td><input value="${lists.title }" type="text" name="title" size="50"></td>
    </tr>
    <tr>
        <td>내용</td>
        <td>
        <textarea name="content" id = "content" rows="10" cols="50">${lists.content }</textarea>
        <script>CKEDITOR.replace('content')</script>
        </td>
        </tr>
        <tr>
        <td colspan="2"><input type="submit" value="저장"></td>
        </tr>
       
</table>
</form>
</body>
</html>