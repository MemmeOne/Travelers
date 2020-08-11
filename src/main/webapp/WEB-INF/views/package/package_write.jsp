<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 공유 글 작성 중</title>
<script src="resources/jquery-3.5.1.min.js"></script>
<!-- <script src="resources/smarteditor2/photo-uploader/attach_photo.js" ></script> -->
<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<script type="text/javascript">
	function chk_loginUser() {
		if ('${loginUser}' == "") {
			alert("로그인 후 사용 가능합니다.")
			location.href="login"
		}else {
			console.log("로그인 확인 성공")
		}
	}
</script>
</head>
<body onload="chk_loginUser()" class="is-preload">
	<%@ include file="../default/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<form action="package_save" id="fff">
							
					
					
					
					  <table>
						<tr>
							<td style="width:150px;text-align: center;">제목</td>
							<td><input type="text" placeholder="제목을 입력하세요." value="제목" name="title" autofocus="autofocus"></td>
						</tr>
						<tr>
							<td>가격</td>
							<td style="text-align:left;">
								<input type="number" name="pay" value="10" placeholder="가격을 입력하세요." style="color:black;width:40%;">
							</td>
						</tr>
						<tr>
							<td>테마</td>
							<td>
								<input type="text" name="theme" value="테마" placeholder="여행 테마를 입력하세요.">
							</td>
						</tr>
						<tr>
							<td>기간</td>
							<td style="text-align:left;">
								<input type="number" name="term" value="3" placeholder="여행 일수를 입력하세요." style="color:black;width:40%;">
							</td>
						</tr>
						<tr>
							<td>출발지/도착지</td>
							<td>
								<input type="text" name="start_point" value="인천" placeholder="출발지를 입력하세요. ex) 인천  - 괌">
								<input type="text" name="end_point" value="괌" placeholder="도착지를 입력하세요. ex) 인천  - 괌">
							</td>
						</tr>
						<tr>
							<td>출발날짜/도착날짜</td>
							<td style="text-align:left;">
								<input type="datetime-local" name="start_date" value="2020-08-01"  placeholder="2020-08-01 09:00" style="color:black;width:40%;">
								<input type="datetime-local" name="end_date" value="2020-08-01" placeholder="2020-08-01 09:00" style="color:black;width:40%;">
							</td>
						</tr>
						<tr>
							<td>출발/도착항공편</td>
							<td>
								<input type="text" name="start_plane" value="에어부산 BX797편" placeholder="출발항공편을 입력하세요. ex) 에어부산 BX797편">
								<input type="text" name="end_plane" value="에어부산 BX797편" placeholder="도착항공편을 입력하세요. ex) 에어부산 BX797편">
							</td>
						</tr>
						<tr>
							<td>호텔/도시</td>
							<td>
								<input type="text" name="hotel" value="호텔" placeholder=" ">
								<input type="text" name="city" value="도시" placeholder=" ">
							</td>
						</tr>
						<tr>
							<td>현재예약한인원/최대예약가능인원/패키지최소인원</td>
							<td>
								<input type="number" name="count" value="3">
								<input type="number" name="max" value="10">
								<input type="number" name="cut_line" value="4">
							</td>
							
						</tr>
						
						<tr>
						<td colspan="2" style="margin: 0 auto;background: white;">
						<textarea rows="15" cols="50" id="content" name = "content"></textarea>
						<script type="text/javascript">
							$(function() {
								//전역변수선언
							    var editor_object = [];
							    var ctx = getContextPath();
				
							    nhn.husky.EZCreator.createInIFrame({
							        oAppRef: editor_object,
							        elPlaceHolder: "content",
							        sSkinURI: ctx + "/resources/smarteditor/SmartEditor2Skin.html",
							        htParams : {
							            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							            bUseToolbar : true,             
							            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							            bUseVerticalResizer : true,     
							            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							            bUseModeChanger : true,
							            fOnBeforeUnload : function(){
							                
							            }
							        }
							    });
							    
							  //전송버튼 클릭이벤트
							    $("#contentRegBtn").click(function(){
							    	var title =$("input[name=title]").val();
							    	var pay =$("input[name=pay]").val();
							    	var theme =$("input[name=theme]").val();
							    	var term =$("input[name=term]").val();
							    	var start_point =$("input[name=start_point]").val();
							    	var start_plane =$("input[name=start_plane]").val();
							    	var start_date =$("input[name=start_date]").val();
							    	var end_date =$("input[name=end_date]").val();
							    	start_date=start_date.replace("T"," ");
							    	end_date=end_date.replace("T"," ");
							    	
							    	
							    	console.log("title="+title)
							    	console.log("pay="+pay)
							    	console.log("theme="+theme)
							    	console.log("term="+term)
							    	console.log("start_point="+start_point)
							    	console.log("start_date="+start_date)
							    	console.log("start_date="+start_date)
							    	console.log("start_plane="+start_plane)
							    	
								    editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
							        var content =  document.getElementById("content").value
							        content = content.replace(/<p>/gi,"");
							        content = content.replace(/<\/p>/gi,"");
							        content = content.replace(/<br>/gi,"");
							        content = content.replace(/&nbsp;/gi,"");
							        content = content.replace(/ /gi,"");
							    	if($('input[name=title]').val()=="") {
							    		alert("제목을 입력하세요.")
							    		$('input[name=title]').focus()
							    	}else if(content=="") {
							    		alert("내용을 입력하세요.")
							    		$('input[name=content]').focus()
							    	}else {
								        //id가 smarteditor인 textarea에 에디터에서 대입
								        $("#fff").submit();
							    	}
							    });
							    
							    function getContextPath() {
							    	return sessionStorage.getItem("contextpath");
							    }
							});
							</script>
						</td>
						</tr>
						<tr>
						<td colspan="2" style="text-align: right;">
						<input type="button" value="완료" id="contentRegBtn">
						</td>
						</tr>
					</table> 
					<input type="button" value="완료" id="contentRegBtn">
					</form>
				</div>
			</section>
		</article>
	</div>
	<%@ include file="../default/footer.jsp"%>
<style>
table  {
    width: 100%;
    border-top: 1px solid rgba(50, 50, 50, 0.2);
    border-collapse: collapse;
  }
th, td {
	background-color: white;
    border-bottom: 1px solid rgba(50, 50, 50, 0.2);
    padding: 10px;
    margin: 10px;
    text-align: center;
  }
</style>
</body>
</html>