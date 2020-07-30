<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<style type="text/css">
#mate_content_view {border-collapse:collapse; }
</style>
<script src="resources/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
		function deadlineChk() {
			console.log("deadlineChk() 함수 시작부분")
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

		//function modify(${ccc.num}) {
		//	location.href="mate_content_modify?num=${ccc.num }";
		//}
		
		function modify2() {
			return true;
		}
		function d() {
			//frm.action="deadline";
			//frm.submit();
			//return tr
				location.href="deadline";
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
<body class="is-preload">

	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ include file="../defualt/header.jsp"%>
	<!-- Page Wrapper -->
 
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
				<form action="mate_content_modify"> 
	
				<table class="all_white" id="whiteline" border="0">
					<tr>
						<td><h4> >> 여행 동행 찾기 </h4></td>
						<td>
						<img alt="" src="resources/main_image/RecruitmentComplete.png" style="width: 300px; ">
						<img alt="" src="resources/main_image/RecruitmentInProgress.png" style="width: 300px; ">
						</td>
						<TD> ${ccc.deadline }
						</TD>
					</tr>
				
				</table>
					<table  id="mate_content_view" style=" width: 1070px; margin: 0 auto;font-size:0.9em;">
						<tr>
							<td colspan="2" style="background-color:transparent">
								[${ccc.mthema}]  ${ccc.title}
							</td>
							<td colspan="2" style="text-align: right;">작성일   ${ccc.savedate} |  조회 ${ccc.hit} </td>
						</tr>
						<table class="all_white" style=" width: 1070px; margin: 0 auto;font-size:0.8em;">
						<tr>
							<td colspan="2">
							<img alt="" src="resources/main_image/chk2.jpg" style="width: 30px; height: 20px;">
							모집자
							<img alt="" src="resources/main_image/writer.jpg" style=" height: 30px; vertical-align: middle;">
							 ${ccc.wnick}, ${ccc.wage }, ${ccc.wgender }
								<!-- <img src="resources/main_image/heart.png" style="width:28px; vertical-align: middle;"> -->
							</td><!-- style="text-align: right;" -->
								<td colspan="2" >
								<img alt="" src="resources/main_image/chk2.jpg" style="width: 30px; height: 20px;">
								동행자  
								<img alt="" src="resources/main_image/writer.jpg" style=" height: 30px; vertical-align: middle;">
								 성별 : ${ccc.mgender}, 나이 : ${ccc.mage}</td>
						</tr>


							<tr>
								<td style=" width: 130px; background-color:white">
								<img alt="" src="resources/main_image/chk2.jpg" style="width: 30px; height: 20px;">
								여행기간</td>
								<td style="   background-color:white" >
								${ccc.mtravel_date_s } ~ ${ccc.mtravel_date_e } (${ccc.mtravel_date })
								</td>
								<td style=" width: 130px;">
								<img alt="" src="resources/main_image/chk2.jpg" style="width: 30px; height: 20px;">
								숙소 </td>
								<td>${ccc.mroom }</td>
							</tr>

								<td>
								<img alt="" src="resources/main_image/chk2.jpg" style="width: 30px; height: 20px;">
								1일경비</td>
								<td>${ccc.mexpenses } ${ccc.price1 }~${ccc.price2 }</td>
								<td>
								<img alt="" src="resources/main_image/chk2.jpg" style="width: 30px; height: 20px;">
								모집인원
								</td>
								<td>${ccc.mcnt }</td>
							</tr>
						</table>
						<table class="all_white" style=" width: 1070px; margin: 0 auto;font-size:0.9em;">
						<tr>
							<td colspan="4" style="  background-color:white">
								내용 ${ccc.content}
							</td>
						</tr>
						<tr>
							<th  style="text-align: left ;">
								<input type="button" onclick="location.href='mate_board_list?page=1'" value="전체목록보기">	
								<input type="button" value="댓글보기">	
							</th>
						<c:choose>
							<c:when test="${ccc.wnick eq loginNick }">
								<th   style="text-align: right;">
									<input type="submit" value="수정"  >
									<input type="button" onclick="location.href='mate_content_delete?num=${ccc.num}'" value="삭제">	
									<input type="button" value="모집완료 " onclick="d()" >
								</th>
							</c:when>
							<c:when test="${admin eq '관리자' }">
								<th  style="text-align: right;">
									<input type="button" onclick="location.href='mate_content_delete?num=${ccc.num}'" value="삭제">	
									<input type="button" value="모집완료 " onclick="d()" >
								</th>
							</c:when>
						</c:choose>
						</tr>
					</table>
				</form>
				</div>
	    	  	<%@ include file="mate_reply.jsp" %>
			</section>
		</article>
	</div>
	<%@ include file="../defualt/footer.jsp"%>
</body>
</html>