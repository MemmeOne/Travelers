<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="resources/jquery-3.5.1.min.js"></script>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<fmt:requestEncoding value="utf-8" />
	<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
			<form action="package_save" onclick="p_save" id="fff">
					  <table>
						
						<tr>
							<td>출발날짜/도착날짜</td>
							<td style="text-align:left;">
								<input type="date" name="start_date" value="2020-08-05"  placeholder="2020-08-01 09:00" style="color:black;width:40%;">
								<input type="date" name="end_date" value="2020-08-01" placeholder="2020-08-01 09:00" style="color:black;width:40%;">
							</td>
						</tr>					
					 
						<tr>
						<td colspan="2" style="margin: 0 auto;background: white;">
						</td>
						</tr>
	
						<tr>
						<td colspan="2" style="text-align: right;">
						<input type="button" value="완료1" id="contentRegBtn">
						</td>
						</tr>
						
						
						
						
					</table> 

					<input type="submit" value="제출">
					<input type="button" value="완료2"   >
					</form>
										
	 			
					

</body>
</html>