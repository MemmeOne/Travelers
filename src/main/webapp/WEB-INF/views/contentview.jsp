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
	
	function commentReg(){
		var id = $("#id").val();
		var cname = $("#cname").val();
		var comments = $("#comments").val();
		var form={id:id, cname:cname, comments:comments}
		$.ajax({
			url:"comment",
			type:"POST",
			data:form,
			success:function(){
				$("#comments").empty;
				$("#commentlist").empty;
				commentlist();
			},error:function(){
				alert("댓글 등록 실패")
			}
		})
	}
	
	
	function commentlist(){
		var id = $("#id").val();
		var form={id:id};
		var i = 0;
		var userName = '${user.name}'
		$.ajax({
			url:"comments",
			type:"POST",
			data:form,
			success:function(data){
				let html= ""
					$.each(data, function(index,item){
						if(item.indent == 0){
							html += "<tr><input type='hidden' id='num"+i+"' value='"+item.num+"'>"
							html += "<td>"+item.cname+"<br>"+item.savedate+"</td>"
							html += "<td align='left' width='350px'>"+item.comments+"</td> <tr>"
							if(item.cname == userName){
								html += "<tr id='cn"+i+"'>"+
								"<td colspan='2' align='right'><input type='button' value='수정' onclick='commentModify'>"+
								"<input type='button' value='삭제' onclick='commentDel()'>"+
								"<input type='button' value='답글' onclick='reply("+i+")'></td> </tr>";
								i += 1;
							}else{
								html += "<tr id='cn"+i+"'>"+
								"<td colspan='2' align='right'><input type='button' value='답글' onclick='reply("+i+")'></td> </tr>";
								i += 1;
							
							}
						}else {
							html += "<tr><input type='hidden' id='num"+i+"' value='"+item.num+"'>"
							html += "<td> -> "+item.cname+"<br>"+item.savedate+"</td>"
							html += "<td align='left' width='350px'>"+item.comments+"</td> <tr>"
							if(item.cname == userName){
								html += "<tr id='cn"+i+"'>"+
								"<td colspan='2' align='right'><input type='button' value='수정' onclick='commentModify'>"+
								"<input type='button' value='삭제' onclick='commentDel()'></td> </tr>"
								i += 1;
							}
						}
					})
					$("#commentlist").html(html)
			},error:function(){
				alert("댓글 보기 실패")
			}
		})
	}
	
	function reply(i){
		$("#cn"+i).empty();
		let html = "<td colspan='2'><input type='text' id='replycomment"+i+"'><input type='button' value='등록' onclick='replyReg("+i+")'><input type='button' value='취소' onclick='commentlist()'></td>"
		$("#cn"+i).html(html)
	}	
	
	function replyReg(i){
		var id = $("#id").val();
		var cname = $("#cname").val();
		var comments = $("#replycomment"+i).val();
		var numgroup = $("#num"+i).val();
		console.log(numgroup);
		var form={id:id, numgroup:numgroup, cname:cname, comments:comments}
		$.ajax({
			url:"reply",
			type:"POST",
			data:form,
			success:function(){
				commentlist();
			},error:function(){
				alert("댓글 등록 실패")
			}
		})
	}
	
	function modify(){
		document.getElementById("form").action = "contentmodify";
		document.getElementById("form").submit();
	}
	function del(){
		document.getElementById("form").action = "delete";
		document.getElementById("form").submit();
	}
	
</script>
</head>
<body onload="commentlist()">
<fmt:requestEncoding value="UTF-8"/>
<div align="center">
<form id="form" method="post">
	<input type="hidden" id="id" name="id" value="${content.id }">
	<input type="hidden" id="cname" name="cname" value="${user.name }">
	<table border="1" style="width: 500px; border-collapse: collapse;">
		<c:choose>
		<c:when test="${user.name ne null && user.name eq content.name}">
		<tr>
		<td colspan="2" align="right">
		<input type="button" onclick="modify()" value="수정"> 
		<input type="button" onclick="del()" value="삭제"> 
		</td>
		</tr>
		</c:when>
		</c:choose>
		<tr> 
		<td colspan="2"><h1>${content.title }</h1></td> 
		</tr>
		<tr>
		<td style="font-size: 12px;">작성자 : ${content.name }</td>
		<td align="right" style="font-size: 12px;">조회수 : ${content.hit }</td>
		</tr>			
		<tr>
		<td colspan="2" height="300px">${content.content }</td>
		</tr>
		<tbody id="commentlist">
		</tbody>
		<c:choose>
		<c:when test="${user.name ne null }">
		<tr>
		<td colspan="2">
		<fieldset style="width: 500px;">
		<legend>댓글</legend>
		${user.name }
		<br>
		<textarea style="border: none; position: relative; left: 30px;" id="comments" name="comments" rows="3" cols="60"></textarea>
		<br>
		<a style="position: relative; left: 450px;" onclick="commentReg()">등록</a>
		</fieldset>
		</td>
		</tr>
		</c:when>
		</c:choose>
		<tr>
		<td>
		<c:choose>
		<c:when test="${user.name ne null }">
		<input type="button" onclick="" value="답글">
		</c:when>
		</c:choose>
		</td>
		<td align="right">
		<input type="button" onclick="location.href='reviewboard?page=1'" value="목록보기">
		</td>
		</tr>			
	</table>
</form>
</div>
</body>
</html>