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
	function travelDiaryList(rn){
		var nick = $("#nick").val();
		var form={nick:nick}
		$.ajax({
			url:"travelDiaryList",
			type:"POST",
			data:form,
			success:function(list){
				let html = ""
					html += "<tr><td>"+list[0].nation+"</td></tr>"
					html += "<tr><td>"+list[0].startdate+"</td></tr>"
					html += "<tr><td><img src='resources/national flag/"+list[0].nation+".png' width='88mm' height='auto'></td></tr>"
					html += "<tr><td>"+list[0].memo+"</td></tr>"
				$("#view").html(html);
			},error:function(){
				alert("여행 수첩 실패")
			}
		})
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
</body>
</html>