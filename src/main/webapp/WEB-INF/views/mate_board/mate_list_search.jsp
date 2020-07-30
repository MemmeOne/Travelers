<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>mate_list_search.jsp<br>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<input type="hidden" name="page" value="1">
<!-- <h1>동행찾기게시판</h1> -->
<table border="1">
<form action="mate_list_search">
	<tr><td><input type="text" name="word" placeholder="검색할 키워드를 입력하세요" >
	<input type="hidden" name="page" value="1">
	<select name="tag">
		<option value="title">제목</option>
		<option value="nick">닉네임</option>
	</select>0
	<input type="submit" value="검색" > </td></tr>
	</FORM>

	<tr>
		<th>번호</th>   <th>글 제목</th> <th>닉네임</th>
		 <th>날짜</th>  
		 <th>조회수</th> <th>진행상태</th>  
	</tr>
	<c:forEach items="${mate_list_search}" var="mate_dto">
	<tr>
		<td>${mate_dto.num}</td>  
		<td><a href="mate_content_view?num=${mate_dto.num }">${mate_dto.title}</a></td> 
		<td>${mate_dto.wnick}</td>
		<td>${mate_dto.savedate}</td>  
		<td>${mate_dto.hit}</td>
		<td>${mate_dto.deadline}</td>
	</tr>
	</c:forEach>
		<tr>
		<td colspan="7">
		<!--<c:choose>
			<c:when test="${param.page==null }">
				<c:set var="page" value="1"/>
			</c:when>
			<c:otherwise>
				<c:set var="page" value="${param.page }"/>
			</c:otherwise>
		</c:choose>-->
		<c:choose>
			<c:when test="${param.page>1 }">
				<!--<button type="button" onclick="location.href='mate_list_search?
				page=${param.page-1}&word=${word } &tag=${tag }
				&mtravel_date_s=${mtravel_date_s }&mtravel_date_e=${mtravel_date_e }
				&mthema=${mthema }&mroom=${mroom }
				&price1=${price1 }&price2=${price2 }
				&mgender=${mgender }
				&mage=${mage }
				'">이전</button>-->
				<a href="mate_list_search?page=${param.page-1}&word=${word }&tag=${tag }
				&mtravel_date_s=${mtravel_date_s }&mtravel_date_e=${mtravel_date_e }
				&mthema=${mthema }&mroom=${mroom }
				&price1=${price1 }&price2=${price2 }
				&mgender=${mgender }
				&mage=${mage } ">이전 a</a>
			</c:when>
			<c:otherwise>
				<button type="button" disabled>이전</button>
			</c:otherwise>
		</c:choose>
		
		<c:set var="num" value="0"/>
		<c:forEach begin="1" end="${totPage }" step="3" var="cnt">
			<c:set var="num" value="${num+1 }"/>
			<a href="mate_list_search?page=${num }&word=${word }&tag=${tag }
				&mtravel_date_s=${mtravel_date_s }&mtravel_date_e=${mtravel_date_e }
				&mthema=${mthema }&mroom=${mroom }
				&price1=${price1 }&price2=${price2 }
				&mgender=${mgender }
				&mage=${mage } ">[${num}]</a>
		</c:forEach>
		
		
		<c:choose>
			<c:when test="${param.page<num}">
				<!--  <button type="button" 
				onclick="location.href='mate_list_search?
				page=${param.page+1}&word=${word }&tag=${tag }
				&mtravel_date_s=${mtravel_date_s }&mtravel_date_e=${mtravel_date_e }
				&mthema=${mthema }&mroom=${mroom }
				&price1=${price1 }&price2=${price2 }
				&mgender=${mgender }
				&mage=${mage }
				' ">다음</button>-->
				
				<a href="mate_list_search?page=${param.page+1}&word=${word }&tag=${tag }
				&mtravel_date_s=${mtravel_date_s }&mtravel_date_e=${mtravel_date_e }
				&mthema=${mthema }&mroom=${mroom }
				&price1=${price1 }&price2=${price2 }
				&mgender=${mgender }
				&mage=${mage } ">다음 a</a>
			</c:when>
			<c:otherwise>
				<button type="button" disabled>다음</button>
			</c:otherwise>
		</c:choose>
		
		
		
		
		
		<c:choose>
			<c:when test="${num==0 }">
				0 / ${num }
			</c:when>
			<c:otherwise>
				${param.page } / ${num }
			</c:otherwise>
		</c:choose>
		
		총 글 개수 ${totPage}
		</td>
	</tr>
</table>

<a href="mate_write_view">글작성</a>
<a href="mate_board_list?page=1">전체목록보기</a>
</body>
</html>