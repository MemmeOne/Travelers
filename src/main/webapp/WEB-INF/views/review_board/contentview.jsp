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
	
	var commentNumber = 10;
	var a = 0;
	function commentReg(){
		var num = $("#num").val();
		var cnick = $("#cnick").val();
		var comments = $("#comments").val();
		var form={num:num, cnick:cnick, comments:comments}
		if(comments == ""|| comments == " "){
			alert("내용을 입력하세요");
		}else{
			$.ajax({
				url:"comment",
				type:"POST",
				data:form,
				success:function(){
					$("#comments").val("");
					commentList();
					$("#op").val("댓글닫기");
				},error:function(){
					alert("댓글 등록 실패")
				}
			})
		}
	}
	
	
	function commentList(){
		var num = $("#num").val();
		var form={num:num, count:commentNumber};
		var i = 0;
		var userNick = '${loginUser.nick}'
		$.ajax({
			url:"comments",
			type:"POST",
			data:form,
			success:function(data){
				let html= ""
					$.each(data, function(index,item){
						if(item.indent == 0){
							html += "<tr><input type='hidden' id='cnum"+i+"' value='"+item.cnum+"'>"
							html += "<input type='hidden' id='indent"+i+"' value='"+item.indent+"'>"
							html += "<input type='hidden' id='comments"+i+"' value='"+item.comments+"'>"
							html += "<td colspan='2' style='text-align: center; width: 120px;'>"+item.cnick+"<br><span style='font-size: 10pt;'>"+item.savedate+"</span></td>"
							html += "<td style='width: 680px;'>"+item.comments+"</td>"
							if(item.cnick == userNick){
								html += "<td><input type='button' value='댓글달기' onclick='reply("+i+")'><br>"+
								"<input type='button' value='수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정' onclick='commentModify("+i+")'><br>"+
								"<input type='button' value='삭&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제' onclick='commentDel("+i+")'></td></tr><tr id='cn"+i+"'></tr>";
							}else if(userNick == "관리자"){
								console.log("dd")
								html += "<td><input type='button' value='댓글달기' onclick='reply("+i+")'><br>"+
								"<input type='button' value='삭&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제' onclick='commentDel("+i+")'></td></tr><tr id='cn"+i+"'></tr>";
							}else if(userNick != ""){
								console.log("dd2")
								html += "<td><input type='button' value='댓글달기' onclick='reply("+i+")'></td></tr><tr id='cn"+i+"'></tr>";
							}
						}else {
							html += "<tr><input type='hidden' id='cnum"+i+"' value='"+item.cnum+"'>"
							html += "<input type='hidden' id='indent"+i+"' value='"+item.indent+"'>"
							html += "<td style='text-align: center;width: 120px;'>&#10149;</td><td id='cnick"+i+"' style='text-align: center;width: 120px;'>"+item.cnick+"<br><span style='font-size: 10pt;'>"+item.savedate+"</span></td>"
							html += "<td style='width: 560px;'>"+item.comments+"</td>"
							if(item.cnick == userNick){
								html += "<td><input type='button' value='수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정' onclick='commentModify("+i+")'><br>"+
								"<input type='button' value='삭&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제' onclick='commentDel("+i+")'></td></tr><tr id='cn"+i+"'></tr>"
							}else if(userNick == "관리자")
								html += "<td><input type='button' value='삭&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제' onclick='commentDel("+i+")'></td></tr><tr id='cn"+i+"'></tr>"
						}
						i += 1;
					})
					$("#commentlist").html(html);
					totalComment();
					if(a > 9){
						if(i == a){
							html = "<td colspan='4' align='center'><input type='button' value='댓글 닫기' onclick='commentNumberM()'></td>"
							$("#viewmore").html(html);
						}else{
							html = "<td colspan='4' align='center'><input type='button' value='댓글 더보기' onclick='commentNumberP()'></td>"
							$("#viewmore").html(html);
						}
					}else{
						$("#viewmore").html("");
					}
			},error:function(){
				alert("댓글 보기 실패")
			}
		})
	}
	
	function reply(i){
		let html = "<td colspan='3'><input type='text' id='replycomment"+i+"'></td><td><input type='button' id='button' value='등록' onclick='replyReg("+i+")'><input type='button' value='취소' onclick='commentList()'></td>"
		$("#cn"+i).html(html)
	}	
	
	function replyReg(i){
		var num = $("#num").val();
		var cnick = $("#cnick").val();
		var comments = $("#replycomment"+i).val();
		var numgroup = $("#cnum"+i).val();
		var form={num:num, numgroup:numgroup, cnick:cnick, comments:comments}
		if(comments == ""){
			alert("내용을 입력하세요");
		}else{
			$.ajax({
				url:"reply",
				type:"POST",
				data:form,
				success:function(){
					commentList();
				},error:function(){
					alert("댓글 등록 실패")
				}
			})
		}
	}
	
	function commentModify(i){
		let html = "<td colspan='3'><input type='text' id='replycomment"+i+"' value='"+$("#comments"+i).val()+"'></td><td><input type='button' id='button' value='확인' onclick='commentModifyUpdate("+i+")'><input type='button' value='취소' onclick='commentList()'></td>"
		$("#cn"+i).html(html)
	}
	
	function commentModifyUpdate(i){
		var comments = $("#replycomment"+i).val();
		var cnum = $("#cnum"+i).val();
		var form={cnum:cnum, comments:comments}
		if(comments == "" || comments == " "){
			alert("내용을 입력하세요");
		}else{
			$.ajax({
				url:"commentmodify",
				type:"POST",
				data:form,
				success:function(){
					commentList();
				},error:function(){
					alert("댓글 수정 실패")
				}
			})
		}
	}
	
	function commentDel(i){
		var indent = $("#indent"+i).val();
		var cnum = $("#cnum"+i).val();
		var form={cnum:cnum, indent:indent}
		$.ajax({
			url:"commentdelete",
			type:"POST",
			data:form,
			success:function(){
				commentList();
			},error:function(){
				alert("댓글 삭제 실패")
			}
		})
	}
	
	function totalComment(){
		var num = $("#num").val();
		var form={num:num}
		$.ajax({
			url:"totalcomment",
			type:"POST",
			data:form,
			success:function(total){
				if(total == null){
					$("#op").attr("disabled",true);
				}else{
					$("#op").attr("disabled",false);
					a = total.count;
				}
			},error:function(){
				alert("댓글 개수 실패")
			}
		})
	}
	
	function commentNumberP(){
		commentNumber += 10;
		commentList();

	}
	
	function commentNumberM(){
		commentNumber = 10;
		$("#op").val("댓글보기");
		$("#viewmore").html("");
		$("#commentlist").html("");
	}
	
	function modify(){
		document.getElementById("form").action = "contentmodify";
		document.getElementById("form").submit();
	}
	function del(){
		document.getElementById("form").action = "delete";
		document.getElementById("form").submit();
	}
	
	function openClose(){
		if($("#op").val() == "댓글보기"){
			commentList();
			$("#op").val("댓글닫기");
		}else if($("#op").val() == "댓글닫기"){
			$("#op").val("댓글보기");
			$("#commentlist").html("");
			$("#viewmore").html("");
		}
	}
	
	function favoriteUp(){
		var boardnum = $("#boardnum").val();
		var num = $("#num").val();
		var userid = '${loginUser.id}';
		var form = {boardnum:boardnum, num:num, userid:userid};
		$.ajax({
			url:"favoriteUp",
			type:"POST",
			data:form,
			success:function(data){
				favorite();
			},error:function(){
				alert("dd")
			}
		});
	}
	
	
	function favorite(){
		var boardnum = $("#boardnum").val();
		var num = $("#num").val();
		var form = {boardnum:boardnum, num:num};
		$.ajax({
			url:"favorite",
			type:"POST",
			data:form,
			success:function(data){
				$("#favorite").html(data.count);
			},error:function(){
				alert("좋아요 부르기 실패")
			}
		});
		
	}
	
</script>
</head>
<body class="is-preload" onload="totalComment();favorite();">
<fmt:requestEncoding value="UTF-8"/>
	<%@ include file="../defualt/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
				<form id="form" method="post">
					<input type="hidden" id="boardnum" value="1">
					<input type="hidden" id="num" name="num" value="${content.num }">
					<input type="hidden" id="cnick" name="cnick" value="${loginUser.nick }">
					<table style="width: 1070px;">
						<tr>
							<td colspan="4">${content.title }</td>
						</tr>
						<tr>
							<td colspan="2">
								${content.nick }
								<input type="image" src="resources/main_image/heart.png" style="width:28px; vertical-align: middle;" onclick="favoriteUp()">
								<span id="favorite"></span>
							</td>
							<fmt:formatDate var="savedate" value="${content.savedate }" pattern="yyyy-MM-dd"/>
							<td colspan="2" style="text-align: right;">${savedate } | 조회 ${content.hit }</td>
						</tr>
						<tr>
						<tr>
							<td colspan="4" style="background: white; height: 300px;">
								${content.content }
							</td>
						</tr>
						<tr style="background: white; border-bottom: 0;">
							<th colspan="2" style="text-align: left ;">
								<input type="button" value="목록보기" onclick="location.href='reviewboard?boardnum=1&page=1'">	
								<input type="button" value="댓글보기" id="op" onclick="openClose()">	
							</th>
							<th colspan="2" style="text-align: right;">
								<c:choose>
									<c:when test="${loginUser.nick eq content.nick }">
										<input type="button" value="수정" onclick="modify()">
										<input type="button" value="삭제" onclick="del()">
									</c:when>
									<c:when test="${loginUser.nick eq '관리자' }">
										<input type="button" value="삭제" onclick="del()">
									</c:when>
								</c:choose>
							</th>
						</tr>
					</table>
					<table>
						<c:choose>
							<c:when test="${loginUser.nick ne null }">
								<tr>
									<td colspan="3"><input type="text" id="comments" style="width:800px;"></td>
									<td><input type="button" value="댓글달기" onclick="commentReg()"></td>
								</tr>
							</c:when>				
						</c:choose>
						<tbody id="commentlist">
						</tbody>
						<tr id="viewmore"></tr>
					</table>
					</form>
				</div>
			</section>
		</article>
	</div>
	<%@ include file="../defualt/footer.jsp"%>
</body>
</html>