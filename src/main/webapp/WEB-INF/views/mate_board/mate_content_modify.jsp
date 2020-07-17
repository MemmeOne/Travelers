<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#hidden{display:none;}
</style>
<script type="text/javascript">

var mtravel_date_s=${ccc.mtravel_date_s}
console.log("날짜 ")
console.log(mtravel_date_s)
var mtravel_date_e=${ccc.mtravel_date_e}+1
console.log(mtravel_date_e)
function chkchk() {
	//$("input:radio[name='mtravel_date']").is(":checked")
	//document.getElementById("mtravel_date").checked = true;; 
$('input:radio[name=mtravel_date]:input[value="확정"]').attr("checked", true);
}
var date_e="${ccc.mtravel_date_e }";
console.log(date_e)
var date="${ccc.mtravel_date }"
console.log(date)
</script>

</head>
<body>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

 <c:set value="${mate_dao.mate_content_viewdao() }" var="mmm"/>
 	<form action="mate_content_modify_update?num=${ccc.num }">
 	<table border="1">
 		<tr> <td colspan="2"> < 여행 정보  > </td></tr>
				<tr> <td colspan="2"> 기간 
				
										<c:set var="ddd" value="${ccc.mtravel_date }"/>
										${ccc.mtravel_date_s} ~ ${ccc.mtravel_date_e}
										<input type="date" name="mtravel_date_s" max="2999-12-31" value="${ccc.mtravel_date_s }"> 
										~ 
										<input type="date" name="travel_date_e" max="2999-12-31"  value="${ccc.mtravel_date_e }">
										<input type="radio" name="mtravel_date" value="미정 " <c:out value="${ccc.mtravel_date eq '미정' ? 'checked':'' }"/> >미정
										<input type="radio" name="mtravel_date" value="확정" <c:out value="${ccc.mtravel_date eq '확정' ? 'checked':'' }"/> >확정
										
										</td></tr>
				<tr> <td colspan="2"> 테마<hr>
				<c:if test="${fn:contains(thema,'관광') }"> <p>checked <p></c:if> <hr>
									<c:set var="thema" value="${ccc.mthema }"/>
									<input type="checkbox" name="mthema" value="관광"  <c:if test="${fn:contains(ccc.mthema,'관광') }"> checked </c:if>     >관광
									<input type="checkbox" name="mthema" value="휴양" <c:if test="${fn:contains(ccc.mthema,'휴양') }"> checked </c:if>  	>휴양  
									<input type="checkbox" name="mthema" value="맛집 탐방"<c:if test="${fn:contains(ccc.mthema,'맛집 ') }"> checked </c:if>  >맛집 탐방  
									<input type="checkbox" name="mthema" value="기타"<c:if test="${fn:contains(ccc.mthema,'기타') }"> checked </c:if>  >	기타
									<label id="hidden">
										<input type="checkbox" name="mthema" value="" checked="checked">
									</label>
									</td></tr>
				 <tr> <td colspan="2"> 숙소 
									<input type="radio" name="mroom" value="상관없음" <c:out value="${ccc.mroom eq '상관없음' ? 'checked':'' }"/> >상관없음
									<input type="radio" name="mroom" value="개인실" <c:out value="${ccc.mroom eq '개인실' ? 'checked':'' }"/> >개인실
									<input type="radio" name="mroom" value="다인실" <c:out value="${ccc.mroom eq '다인실' ? 'checked':'' }"/> >다인실
									<label id="hidden">
										<input type="radio" name="mroom" value="" <c:out value="${ccc.mroom eq '' ? 'checked':'' }"/>>
									</label>
									</td></tr>
				<tr> <td colspan="2"> 1일경비 
									<input type="checkbox" name="mexpenses" value="상관없음">상관없음
									<input type="checkbox" name="mexpenses" value="금액입력">금액입력
									<input type="text" numberOnly >
									<input type="text"   data-placeholder="원" >
									<div class="placeholder" data-placeholder="New placeholder"></div>
									<input type="checkbox" name="mexpenses" value="추후결정">추후결정
									</td></tr>
				<tr> <td colspan="2"> < 여행 동행 조건  > </td></tr>
				<tr> <td colspan="2"> 성별
									<input type="radio" name="mgender" value="상관없음" <c:out value="${ccc.mgender eq '상관없음' ? 'checked':'' }"/> >상관없음
									<input type="radio" name="mgender" value="여자" <c:out value="${ccc.mgender eq '여자' ? 'checked':'' }"/> >여자
									<input type="radio" name="mgender" value="남자" <c:out value="${ccc.mgender eq '남자' ? 'checked':'' }"/> >남자
									<label id="hidden">
										<input type="radio" name="mgender" value="" <c:out value="${ccc.mgender eq '' ? 'checked':'' }"/> >
									</label>
									</td></tr>
				<tr> <td colspan="2"> 나이 
									<input type="checkbox" name="mage" value="7" <c:if test="${fn:contains(ccc.mage,'7') }"> checked </c:if> >상관없음
									<input type="checkbox" name="mage" value="2"<c:if test="${fn:contains(ccc.mage,'2') }"> checked </c:if>>20대
									<input type="checkbox" name="mage" value="3"<c:if test="${fn:contains(ccc.mage,'3') }"> checked </c:if>>30대
									<input type="checkbox" name="mage" value="4"<c:if test="${fn:contains(ccc.mage,'4') }"> checked </c:if>>40대
									<input type="checkbox" name="mage" value="5"<c:if test="${fn:contains(ccc.mage,'5') }"> checked </c:if>>50대
									<input type="checkbox" name="mage" value="6"<c:if test="${fn:contains(ccc.mage,'6') }"> checked </c:if>>60대이상
									<label id="hidden">
										<input type="checkbox" name="mage" value="-1" checked="checked">
									</label>
									</td></tr>
 	
 	
 	
			
				<tr> <td>번호</td> <td>${ccc.num}</td> </tr>  
				<tr> <td>조회수</td> <td>${ccc.hit}</td> </tr>
				<tr> <td>닉네임</td> <td>${ccc.wnick}</td> </tr>
				<tr> <td>제목</td> <td><input name="title"  value="${ccc.title}" type="text"  size="100"></td> </tr>
				<tr> <td>내용</td> <td><textarea name="content" rows="10" cols="50">${ccc.content}</textarea></td> </tr>
				<tr> <td colspan="2">
						<input type="submit" value="수정" onclick="location.href='mate_content_view?num=${ccc.num}'">&nbsp;&nbsp;
						<a href="mate_board_list">목록보기</a>&nbsp;&nbsp;
						<<!--  <a href="delete.jsp?id=${dto.id}">삭제</a>&nbsp;&nbsp;
						<a href="reply_view.jsp?id=${dto.id}">답변</a>  -->
					</td> 
				</tr>
			</table>
		</form>
</body>
</html>