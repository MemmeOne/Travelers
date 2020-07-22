<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function reply_reg() {

		var nick=$("#nick").val();
		var re=$("#reply").val();
		var time=$()
		var form={nick:nick,reply:re}
		$.ajax({
			url:"mate_comment",
			type:"POST",
			dataType:"json",
			data:form,
			success:function(data) {
				console.log("성공");
				//console.log(data);
				//markers=JSON.stringify(data);
				//console.log(markers);
				//console.log(markers[0]["nick"]);
				// "nick":"ㅇ","reply":"ㅇ","savedate":null
				//alert(markers)
				//var n=$(this).find("nick").text();
				//var r=$(this).find("reply").text();
				//$("#here").append(n+"  "+r);
			 	//$("#here").text(markers);
			 	//var nnn=data.nick;
			 	//var rrr=data.reply;
			 	//var sss=data.savedate;
			 	//var comment={nnn:nick, rrr:reply }
			 	//console.log(nnn);
			 	
			 	//$("#here2").text(nnn);
			 	//$("#here2").text(rrr);
			 	
				//$.each(data, function() {
				//	$("#here").append(this.nick)
				//})
				 showComments(data);
				 //show(markers);
				 //showshow(nick,re);
				 //shownick(nick);
				 //showreply(re);
				
			},
			error:function(request, status, error) {
				console.log("실패");
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	}
	function showComments(data) {
		let com="";
		 	var nnn=data.nick;
		 	var rrr=data.reply;
		 	var sss=data.savedate;
		 	com+=""
			com+=nnn;
			com+=rrr;
			com+=sss;
			console.log(sss);
			$("#comment_table").html(com);
			
	}
	function show(markers) {
		let com="";
		com+=markers.nick;
		$("#here2").html(com);
	}
	function shownick(nick) {
		let com="";
		$.each(nick,function(index,item) {
		com+=item.nick+"<br>";
		$("#here2").html(com);
		})
	}
	function showreply(re) {
		let com="";
		$.each(re,function(index,item) {
		com+=item.re+"<br>";
		$("#here3").html(com);
		})
	}
	function test() {
		$.ajax({
			url:"mate_comment",
			success:function() {
				console.log("성공")
			},
			error:function() {
				console.log("실패")
			}
		})
	}
</script>
</head>
<body>mate_comment.jsp<Br>
<!--  <form action="reply_regi" method="post">-->
	<input type="text" name="bnum"><Br>
	<input type="text" name="rnum"><Br>
	<input type="text" id="nick" name="nick"><Br>
	<textarea id="reply" name="reply" rows="10" cols="50"></textarea>
	<button onclick="reply_reg()">등록</button>
<!--</form>-->
	<hr>
	<label id="here">여기111</label>
	<hr>
	<label id="here2">여기222</label>
	<hr>
	<label id="here3">여기222</label>
	<hr>
	<table border="1" id="comment_table">
		<tr>
			<th>bnum</th> <th>rnum</th> <th>시간</th>
			<th>닉네임</th> <th>댓글내용</th>
		</tr>
		<c:forEach items="${mate_reply_list }" var="reply_list">
		<tr>
			<td>0</td> <td>0</td> <td>${reply_list.savedate }</td>
			<td>${reply_list.nick }</td> <td>${reply_list.reply }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>