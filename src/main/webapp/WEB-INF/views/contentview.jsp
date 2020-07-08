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
	
	var commentNumber = 0;
	
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
				$("#comments").val("");
				commentlist();
			},error:function(){
				alert("댓글 등록 실패")
			}
		})
	}
	
	
	function commentlist(){
		var id = $("#id").val();
		var form={id:id, count:commentNumber};
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
							html += "<input type='hidden' id='indent"+i+"' value='"+item.indent+"'>"
							html += "<td colspan='2'>"+item.cname+"<br>"+item.savedate+"</td>"
							html += "<td align='left' width='350px'>"+item.comments+"</td> <tr>"
							if(item.cname == userName){
								html += "<tr id='cn"+i+"'>"+
								"<td colspan='3' align='right'><input type='button' value='수정' onclick='commentModify("+i+")'>"+
								"<input type='button' value='삭제' onclick='commentDel("+i+")'>"+
								"<input type='button' value='답글' onclick='reply("+i+")'></td> </tr>";
								i += 1;
							}else{
								html += "<tr id='cn"+i+"'>"+
								"<td colspan='3' align='right'><input type='button' value='답글' onclick='reply("+i+")'></td> </tr>";
								i += 1;
							
							}
						}else {
							html += "<tr><input type='hidden' id='num"+i+"' value='"+item.num+"'>"
							html += "<input type='hidden' id='indent"+i+"' value='"+item.indent+"'>"
							html += "<td>&#10149;</td> <td>"+item.cname+"<br>"+item.savedate+"</td>"
							html += "<td align='left' width='350px'>"+item.comments+"</td> <tr>"
							if(item.cname == userName){
								html += "<tr id='cn"+i+"'>"+
								"<td colspan='3' align='right'><input type='button' value='수정' onclick='commentModify("+i+")'>"+
								"<input type='button' value='삭제' onclick='commentDel("+i+")'></td> </tr>"
								i += 1;
							}
						}
					})
					$("#commentlist").html(html);
					totalComment(i);
			},error:function(){
				alert("댓글 보기 실패")
			}
		})
	}
	
	function reply(i){
		let html = "<td colspan='3'><input type='text' id='replycomment"+i+"'><input type='button' value='등록' onclick='replyReg("+i+")'><input type='button' value='취소' onclick='commentlist()'></td>"
		$("#cn"+i).html(html)
	}	
	
	function replyReg(i){
		var id = $("#id").val();
		var cname = $("#cname").val();
		var comments = $("#replycomment"+i).val();
		var numgroup = $("#num"+i).val();
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
	
	function commentModify(i){
		let html = "<td colspan='3'><input type='text' id='replycomment"+i+"'><input type='button' value='확인' onclick='commentModifyUpdate("+i+")'><input type='button' value='취소' onclick='commentlist()'></td>"
		$("#cn"+i).html(html)
	}
	
	function commentModifyUpdate(i){
		var comments = $("#replycomment"+i).val();
		var num = $("#num"+i).val();
		var form={num:num, comments:comments}
		$.ajax({
			url:"commentmodify",
			type:"POST",
			data:form,
			success:function(){
				commentlist();
			},error:function(){
				alert("댓글 수정 실패")
			}
		})
	}
	
	function commentDel(i){
		var indent = $("#indent"+i).val();
		var num = $("#num"+i).val();
		var form={num:num, indent:indent}
		$.ajax({
			url:"commentdelete",
			type:"POST",
			data:form,
			success:function(){
				commentlist();
			},error:function(){
				alert("댓글 삭제 실패")
			}
		})
	}
	
	function totalComment(i){
		var id = $("#id").val();
		var form={id:id}
		$.ajax({
			url:"totalcomment",
			type:"POST",
			data:form,
			success:function(total){
				if(total.count > 10){
					if(i == total.count){
						html = "<td colspan='3'><input type='button' value='댓글 닫기' onclick='commentNumberM()'></td>"
						$("#viewmore").html(html);
					}else{
						html = "<td colspan='3'><input type='button' value='댓글 열기' onclick='commentNumberP()'></td>"
						$("#viewmore").html(html);
					}
				}
			},error:function(){
				alert("댓글 개수 실패")
			}
		})
	}
	
	function commentNumberP(){
		commentNumber += 10;
		commentlist();

	}
	
	function commentNumberM(){
		commentNumber = 0;
		commentlist();
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
		<td colspan="3" align="right">
		<input type="button" onclick="modify()" value="수정"> 
		<input type="button" onclick="del()" value="삭제"> 
		</td>
		</tr>
		</c:when>
		</c:choose>
		<tr> 
		<td colspan="3"><h1>${content.title }</h1></td> 
		</tr>
		<tr>
		<td colspan="2" style="font-size: 12px;">작성자 : ${content.name }</td>
		<td align="right" style="font-size: 12px;">조회수 : ${content.hit }</td>
		</tr>			
		<tr>
		<td colspan="3" height="300px">${content.content }</td>
		</tr>
		<tbody id="commentlist">
		</tbody>
		<tr id="viewmore"></tr>
		<c:choose>
		<c:when test="${user.name ne null }">
		<tr>
		<td colspan="3">
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
		<td colspan="2">
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