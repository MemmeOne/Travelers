<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#mate_content_view {border-collapse:collapse; }
</style>
<script src="resources/jquery-3.5.1.min.js">
		function deadlineChk() {
			var deadline=1;
			$.ajax({
				url:"deadline_finish",
				type:"POST",
				data:deadline,
				success:function(data) {
					console.log("동행 구하기 마감 성공")
				},
				error:function(request, status, error) {
					console.log("실패");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
			}) 
		}





</script>
<!--  <script type="text/javascript">

	function reply() {
		$.ajax({
			url:"reply_area",
			success:function() {   console.log("성공"); },
			error:function() { alert("reply 문제 발생") }	
		})
	}
	function rep() {
		let html="<table border='1'>";
		html+="<tr><th>닉네임</th></tr>";
		html+="</table>";
		$("#reply_area").html(html)
	}
	
	function reprep() {
		$.ajax( {
			url:"reply_area_b", 
			success:function() { $("#reply_area_b").text(); console.log("reply_area_b 성공");  },
			error:function() { alert("reply_area_b문제 발생") }	
	
		})
	}
	
	function replyyy() {
		var num=$("#num").val();
		var nick=$("#nick")
	}


</script>-->


</head>
<body>mate_content_view.jsp<br>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<c:set value="${ccc }" var="mmm" />
	<form action="mate_content_modify?num=${ccc.num }" method="post">
		<table id="mate_content_view" border="1">
		<tr> <td>  < 여행 정보 > </td> </tr>
		<tr> <td> 기간 : ${ccc.mtravel_date_s } ~ ${ccc.mtravel_date_e } (${ccc.mtravel_date})</td> </tr>
		<tr> <td> </td> </tr>
		<tr> <td> </td> </tr>
		<tr> <td> 테마 : ${ccc.mthema} </td> </tr>
		<tr> <td> 숙소 : ${ccc.mroom }</td> </tr>
		<tr> <td> 1일 경비 : </td> </tr>
		<tr> <td>  < 여행 동행 조건 > </td> </tr>
		<tr> <td> 성별 : ${ccc.mgender } </td> </tr>
		<c:set var="age" value="${ccc.mage }"/>
		

		<tr><td> ${fn:substring(age,0,1) }  </td></tr>
		<tr><td> ${fn:substring(age,1,2) }  </td></tr>
		<tr><td> ${fn:substring(age,4,5) }  </td></tr>
		<tr> <td> 나이 : ${ccc.mage }0대 </td> </tr>
			<tr><td>번호</td><td>${mmm.num}</td></tr>
			<tr><td>조회수</td><td>${ccc.hit}</td></tr>
			<tr><td>닉네임</td><td>${ccc.wnick}</td></tr>
			<tr><td>제목</td><td>${ccc.title}</td></tr>
			<tr><td>내용</td><td>${ccc.content}</td></tr>
			<tr><td>${loginNick }</td></tr>
			<tr>
				<td colspan="2">
					<a href="mate_board_list?page=1">전체목록보기</a>&nbsp;&nbsp; 
				<c:choose>
					<c:when test="${ccc.wnick eq loginNick }">
					<input type="submit" value="수정" > &nbsp;&nbsp;
					<a href="mate_content_delete?num=${ccc.num}">삭제</a>&nbsp;&nbsp; 
					<input type="button" value="모집완료" onclick="deadlineChk()">
					</c:when>
					<c:when test="${admin eq '관리자' }">
					<input type="submit" value="수정" > &nbsp;&nbsp;
					<a href="mate_content_delete?num=${ccc.num}">삭제</a>&nbsp;&nbsp; 
					<form action="deadline">
					</form>
						<input type="submit"  value="모집완료1">
					<button type="button">모집완료3</button>
					<input type="text">
					<input type="button" value="모집완료2" onclick="deadlineChk()">
					</c:when>
				</c:choose>
				</td>
			</tr>
			<!--  <tr>
				<td><span id="reply_area">여기</span>
				<button type="button" onclick="reply()">답변</button>
				<td><span id="reply_area_b">여기b</span>
				<button type="button" onclick="reprep()">답변B</button>
				 <a href="reply_view.jsp?id=${dto.id}">답변</a>  </td>
			</tr>
			<tr><td>
				<textarea name="r" rows="10" cols="50"></textarea>
				<button type="button" onclick="replyyy()">댓글 등록</button>
			</td></tr>
			<tr><td>
				<label id="label">댓글 장소</label>
			</td></tr>-->
		</table>
		
	</form>
		<%@ include file="mate_reply.jsp" %>

</body>
</html>