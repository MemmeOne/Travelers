<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.5.1.min.js" ></script>
<script type="text/javascript">
	var rn = 0;
	var length = 0;
	function travelDiaryList(rn){
		var nick = $("#nick").val();
		var form={nick:nick}
		$.ajax({
			url:"travelDiaryList",
			type:"POST",
			data:form,
			success:function(list){
				length = list.length;
				let html = ""
					html += "<tr><td>"+list[rn].nation+"</td></tr>"
					html += "<tr><td>"+list[rn].startdate+"</td></tr>"
					html += "<tr><td><img src='resources/national flag/"+list[rn].nation+".png' width='88mm' height='auto'></td></tr>"
					html += "<tr><td>"+list[rn].memo+"</td></tr>"
				$("#view").html(html);
			},error:function(){
				alert("여행 수첩 실패")
			}
		})
	}
	function pre(){
		if(rn > 0){
			rn = rn - 1;
			travelDiaryList(rn);
		}else if(rn == 0){
			alert("첫페이지")
		}
	}
	function next(){
		if(rn < length-1){
			rn = rn + 1;
			travelDiaryList(rn);
		}else if(rn == length-1){
			alert("마지막 페이지")
		}
	}
</script>
</head>
<body >
	<input type="hidden" id="nick" value="aa">
	<table border="1" style="width: 88mm; height: 125mm; border-collapse: collapse;">
		<tbody id="view">
		<tr><td style="width: 88mm; height: 125mm;"><img src="resources/national flag/passport.png"></td></tr>
		</tbody>
	</table>
	<input type="button" value="열기" onclick="travelDiaryList(rn)">
	<input type="button" value="이전" onclick="pre()">
	<input type="button" value="다음" onclick="next()">
</body>
</html>