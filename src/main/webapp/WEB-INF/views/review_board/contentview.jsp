<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:if test="${content.tag eq null }">
	<title>${content.title }</title>
</c:if>
<c:if test="${content.tag ne null }">
	<title>[${content.tag}] ${content.title }</title>
</c:if>
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
					$("#op").css("padding-left","30px");
					$("#op").css("padding-right","30px");
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
		var writerNick = '${content.nick}'
		$.ajax({
			url:"comments",
			type:"POST",
			data:form,
			success:function(data){
				let html= ""
					$.each(data, function(index,item){
						if(item.indent == 0){
							html += "<tr style='background-color: white;'><input type='hidden' id='cnum"+i+"' value='"+item.cnum+"'>"
							html += "<input type='hidden' id='indent"+i+"' value='"+item.indent+"'>"
							html += "<input type='hidden' id='comments"+i+"' value='"+item.comments+"'>"
							if(writerNick == item.cnick){
								html += "<td colspan='2' style='text-align: center; width: 120px;'>"+item.cnick +"<img src='resources/main_image/writer.png' style='vertical-align: middle;'><br><span style='font-size: 10pt;'>"+item.savedate+"</span></td>";
							}else if(item.cnick == '관리자'){
								html += "<td colspan='2' style='text-align: center; width: 120px;'>"+item.cnick +"<img src='resources/main_image/admin.png' style='vertical-align: middle;'><br><span style='font-size: 10pt;'>"+item.savedate+"</span></td>";
							}else{
								html += "<td colspan='2' style='text-align: center; width: 120px;'>"+item.cnick+"<br><span style='font-size: 10pt;'>"+item.savedate+"</span></td>";
							}
							html += "<td style='width: 680px;'>"+item.comments+"</td>";
							if(item.cnick == userNick){
								html += "<td><input type='button' value='댓글달기' onclick='reply("+i+")'><br>"+
								"<input type='button' value='수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정' onclick='commentModify("+i+")'><br>"+
								"<input type='button' value='삭&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제' onclick='commentDel("+i+")'></td></tr><tr id='cn"+i+"' style='background-color: white;'></tr>";
							}else if(userNick == "관리자"){
								html += "<td><input type='button' value='댓글달기' onclick='reply("+i+")'><br>"+
								"<input type='button' value='삭&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제' onclick='commentDel("+i+")'></td></tr><tr id='cn"+i+"' style='background-color: white;'></tr>";
							}else if(userNick != ""){
								html += "<td><input type='button' value='댓글달기' onclick='reply("+i+")'></td></tr><tr id='cn"+i+"'></tr>";
							}
						}else {
							html += "<tr style='background-color: white;'><input type='hidden' id='cnum"+i+"' value='"+item.cnum+"'>"
							html += "<input type='hidden' id='indent"+i+"' value='"+item.indent+"'>"
							if(writerNick == item.cnick){
								html += "<td style='width:20px;'><img src='resources/main_image/reply.png' style='width:18px; vertical-align: middle;'></td><td id='cnick"+i+"' style='text-align: center;width: 220px;'>"+item.cnick +"<img src='resources/main_image/writer.png' style='vertical-align: middle;'><br><span style='font-size: 10pt;'>"+item.savedate+"</span></td>"
							}else if(item.cnick == '관리자'){
								html += "<td style='width:20px;'><img src='resources/main_image/reply.png' style='width:18px; vertical-align: middle;'></td><td id='cnick"+i+"' style='text-align: center;width: 220px;'>"+item.cnick +"<img src='resources/main_image/admin.png' style='vertical-align: middle;'><br><span style='font-size: 10pt;'>"+item.savedate+"</span></td>"
							}else{
								html += "<td style='width:20px;'><img src='resources/main_image/reply.png' style='width:18px; vertical-align: middle;'></td><td id='cnick"+i+"' style='text-align: center;width: 220px;'>"+item.cnick+"<br><span style='font-size: 10pt;'>"+item.savedate+"</span></td>"
							}
							html += "<td style='width: 560px;'>"+item.comments+"</td>"
							if(item.cnick == userNick){
								html += "<td><input type='button' value='수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정' onclick='commentModify("+i+")'><br>"+
								"<input type='button' value='삭&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제' onclick='commentDel("+i+")'></td></tr><tr id='cn"+i+"' style='background-color: white;'></tr>"
							}else if(userNick == "관리자"){
								html += "<td><input type='button' value='삭&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제' onclick='commentDel("+i+")'></td></tr><tr id='cn"+i+"' style='background-color: white;'></tr>"
							}
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
							html = "<td colspan='4' align='center'><input type='button' value='"+(a-i)+"개 댓글 더보기 ' onclick='commentNumberP()'></td>"
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
		let html = "<td colspan='3'><input style='width:850px' type='text' id='replycomment"+i+"'></td><td style='width:270px;'><input type='button' id='button' value='등&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;록' onclick='replyReg("+i+")'><input type='button' value='취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소' onclick='commentList()'></td>"
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
				url:"commentReply",
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
		let html = "<td colspan='3'><input style='width:850px' type='text' id='replycomment"+i+"' value='"+$("#comments"+i).val()+"'></td><td style='width:270px;'><input type='button' id='button' value='확&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인' onclick='commentModifyUpdate("+i+")'><input type='button' value='취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소' onclick='commentList()'></td>"
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
		var check = confirm("글을 삭제하시겠습니까?")
		if(check){
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
		$("#op").val("댓글보기["+a+"]");
		$("#op").css("padding-left","20px");
		$("#op").css("padding-right","20px");
		$("#viewmore").html("");
		$("#commentlist").html("");
	}
	
	function modify(){
		document.getElementById("form").action = "contentmodify";
		document.getElementById("form").submit();
	}
	function del(){
		var check = confirm("글을 삭제하시겠습니까?")
		if(check){
			document.getElementById("form").action = "delete";
			document.getElementById("form").submit();
		}
	}
	
	function openClose(){
		if($("#op").val().includes("댓글보기")){
			commentList();
			$("#op").val("댓글닫기");
			$("#op").css("padding-left","30px");
			$("#op").css("padding-right","30px");
		}else if($("#op").val().includes("댓글닫기")){
			$("#op").val("댓글보기["+a+"]");
			$("#op").css("padding-left","20px");
			$("#op").css("padding-right","20px");
			$("#commentlist").html("");
			$("#viewmore").html("");
		}
	}
	
	function favoriteUp(){
		var num = $("#num").val();
		var userid = '${loginUser.id}';
		var form = {num:num, userid:userid};
		if(userid == ""){
			alert("로그인이 필요합니다")
		}else{
			$.ajax({
				url:"favoriteUp",
				type:"POST",
				data:form,
				success:function(data){
					favorite();
					$("#heart").attr("src", "resources/main_image/heart-on.png");
				},error:function(){
					favoriteDown();
				}
			})
		}
	}
	
	function favoriteDown(){
		var num = $("#num").val();
		var userid = '${loginUser.id}';
		var form = {num:num, userid:userid};
		var check = confirm("추천 취소하시겠습니까?")
		if(check){
			$.ajax({
				url:"favoriteDown",
				type:"POST",
				data:form,
				success:function(data){
					favorite();
					$("#heart").attr("src", "resources/main_image/heart.png");
				},error:function(){
				}
			})
		}
	}
	
	function favorite(){
		var num = $("#num").val();
		var form = {num:num};
		$.ajax({
			url:"favorite",
			type:"POST",
			data:form,
			success:function(data){
				if(data != null){
					$("#favorite").html(data.count);
				}else{
					$("#favorite").html("");
				}
			},error:function(){
				alert("favorite loading fail")
			}
		});
		
	}
	
	// 글 신고
	function report_post() {
		var content=prompt("신고 사유를 입력해주세요."+"");
		var board = "review_board";
		var num = "${content.num }"
		var title = "${content.title }"
		var writer = "${content.nick }"
		var usernick = "${content.nick }"
		console.log(board)
		console.log(num)
		console.log(title)
		console.log(content)
		console.log(writer)
		console.log(usernick)
		if(content==null) {
			alert("신고를 취소합니다.")
		}else if(content=="") {
			alert("신고 사유를 입력하지 않아 신고를 취소합니다.\n다시 시도해주세요.")
		}else if(usernick=="") {
			alert("로그인 후 사용가능합니다.")
			location.href="login"
		}else {
			var form = {
				board:board,
				num:num,
				title:title,
				content:content,
				writer:writer,
				usernick:usernick
			}
			$.ajax({
				url : "report",
				type : "POST",
				data : form,
				dataType: "json",
				success : function(list) {
					console.log(list)
					if(list=="신고 성공") {
						console.log("성공");
						alert("해당 게시글을 신고하였습니다.")
					}else if(list=="신고 실패") {
						console.log("실패");
						alert("이미 해당 게시글을 신고하였습니다.")
					}else {
						console.log("실패");
						alert("오류로 인해 신고에 실패하였습니다.")
					}
				}, error : function(request, status, error) {
				console.log("실패")
				alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
				}
			});
		}
	}
	
	$(document).ready(function() {
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
				$("#op").val("댓글보기["+a+"]");
				$("#op").css("padding-left","20px");
				$("#op").css("padding-right","20px");
				}
			},error:function(){
				alert("댓글 개수 실패")
			}
		})
    });
	
</script>
</head>
<body class="is-preload" onload="favorite();">
<fmt:requestEncoding value="UTF-8"/>
<jsp:useBean id="cdate" class="java.util.Date"/>
<fmt:formatDate var="cdate" value="${cdate }" pattern="yyyy-MM-dd"/>
	<%@ include file="../default/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
				<form onsubmit="return false" id="form" method="post">
					<input type="hidden" id="num" name="num" value="${content.num }">
					<input type="hidden" id="cnick" name="cnick" value="${loginUser.nick }">
					<h4><a href="reviewboard?page=1" style="border-bottom: 0;">>> 여행 리뷰 게시판</a></h4>
					<table style="width: 1070px;">
						<tr>
							<c:if test="${content.tag eq null }">
								<td colspan="4"><br><h2>${content.title }</h2></td>
							</c:if>
							<c:if test="${content.tag ne null }">
								<td colspan="4"><br><h2>[${content.tag}] ${content.title }</h2></td>
							</c:if>
						</tr>
						<tr>
							<td colspan="2">
								<c:if test="${content.nick ne '관리자' }">
									<a onclick="window.open('userInfoPop?nick=${content.nick }','','width=500,height=700')" style="border-bottom: 0; cursor: pointer;"><b>${content.nick }</b>&nbsp;&nbsp;</a>
								</c:if>
								<c:if test="${content.nick eq '관리자' }">
									<b>${content.nick }</b>&nbsp;&nbsp;
								</c:if>
								<c:set var="i" value="0"/>
								<c:forEach var="favoriteList" items="${favoriteList }">
									<c:choose>
										<c:when test="${favoriteList.userid eq loginUser.id && favoriteList.num eq content.num }">
											<c:set var="i" value="1"/>
										</c:when>	
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${i eq 1}">
										<input id="heart" type="image" src="resources/main_image/heart-on.png" style="width:28px; vertical-align: middle;" onclick="favoriteUp()">
									</c:when>
									<c:otherwise>
										<input id="heart" type="image" src="resources/main_image/heart.png" style="width:28px; vertical-align: middle;" onclick="favoriteUp()">
									</c:otherwise>
								</c:choose>
								<span id="favorite"></span>
							</td>
							<fmt:formatDate var="savedate" value="${content.savedate }" pattern="yyyy-MM-dd"/>
							<td colspan="2" style="text-align: right;">${savedate } | 조회 ${content.hit }</td>
						</tr>
						<tr>
						<tr>
							<td colspan="4" style="background: white; height: 300px;">
								<br>
								${content.content }
							</td>
						</tr>
						<tr style="background: white; border-bottom: 0;">
							<th colspan="2" style="text-align: left ;">
								<input type="button" value="목록보기" onclick="location.href='reviewboard?page=1'">	
								<input type="button" value="댓글보기 " id="op" onclick="openClose()">
							</th>
							<th colspan="2" style="text-align: right;">
								<c:if test="${loginUser.nick ne null }">
									<input type="button" value="신고" onclick="report_post()">
								</c:if>
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
					<table style="width:1070px; margin-top: 50px;">
						<c:choose>
							<c:when test="${loginUser.nick ne null }">
								<tr>
									<td colspan="3"><input style="width:850px;" type="text" id="comments"></td>
									<td style="width:270px;"><input type="button" value="댓글달기" onclick="commentReg()"></td>
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
	<%@ include file="../default/footer.jsp"%>
</body>
</html>