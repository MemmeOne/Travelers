<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 공유 글 작성 중</title>
	<!-- script -->
	<!-- 직접 경로에 넣었을때 <script src = "webapp/resources/ckeditor/ckeditor.js"></script> -->
	<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script> <!-- ckeditor -->
<!--<script src="//cdn.ckeditor.com/4.14.1/full/ckeditor.js"></script>
 	<script src="//cdn.ckeditor.com/4.14.1/basic/ckeditor.js"></script>
 -->
<style type="text/css">
	#body { margin-top: 350px; display: flex; justify-content: center; align-items: center; }
	a { text-decoration: none; color: black; }
	table { background: white; padding: 30px; }
</style>
</head>
<body>
	<%@ include file="../defualt/header.jsp" %>
	<!-- <textarea id = "editor4" name = "editor4"></textarea>
	<script>CKEDITOR.replace('editor4',{filebrowserUploadUrl:'/mine/imageUpload.do'});</script> -->
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<fmt:requestEncoding value="utf-8"/>
	<div id="body">
		<form action="info_modify">
			<input type="hidden" value="${info_post.num }" name="num">
			<table border="1">
				<tr>
					<th>닉네임</th>
					<td>
						${info_post.nick }
					</td>
				</tr>
				<tr>
					<th>태그</th>
					<td>
						<select name="tag" >
							<optgroup label="태그 선택" >
								<option value="관광지">관광지</option>
								<option value="맛집">맛집</option>
								<option value="숙박">숙박</option>
								<option value="이동수단">이동수단</option>
								<option value="여행팁">여행팁</option>
							</optgroup>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" value="${info_post.title }" name="title">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea id = "content" name = "content" >${info_post.content }</textarea>
						<script>CKEDITOR.replace('content');</script>
					</td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="수정완료"></th>
				</tr>
			</table>
			<hr>
		</form>
	</div>
</body>
</html>