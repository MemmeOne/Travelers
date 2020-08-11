<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 공유 글 작성 중</title>
<script src="resources/jquery-3.5.1.min.js"></script>
<script src="resources/smarteditor2/photo-uploader/attach_photo.js" ></script>
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
					<form action="info_modify" id="frm">
						<input type="hidden" name="nick" value="${loginUser.nick }" >
						<input type="hidden" name="num" value="${info_post.num }" >
						<h4><a href="info_list?page=1" style="border-bottom: 0;">>> 정보 공유 게시판</a></h4><br>
					<table>
						<tr style="background: white;">
							<td style="width:60px;text-align: center;">닉네임</td>
							<td>${loginUser.nick }</td>
						</tr>
						<tr>
							<td style="width:60px;text-align: center;">태그</td>
							<td>
								<c:choose>
									<c:when test="${loginUser.id=='admin' }">
										<select name="tag" >
											<option value="공지">공지</option>
											<option value="이벤트">이벤트</option>
										</select>
									</c:when>
									<c:otherwise>
										<select name="tag">
											<optgroup label="태그 선택" >
												<option value="관광지">관광지</option>
												<option value="맛집">맛집</option>
												<option value="숙박">숙박</option>
												<option value="이동수단">이동수단</option>
												<option value="여행팁">여행팁</option>
											</optgroup>
										</select>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td style="width:60px;text-align: center;">제목</td>
							<td><input type="text" placeholder="제목을 입력하세요." name="title" autofocus="autofocus" value="${info_post.title }"></td>
						</tr>
						<tr>
						<td colspan="2" style="margin: 0 auto;background: white;">
						<textarea rows="15" cols="50" id="content" name = "content">${info_post.content }</textarea>
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
								        $("#frm").submit();
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
						<td style="text-align: left: ;">
						<input type="button" value="전체목록보기" onclick="location.href='info_list?page=1'">	
						</td>
						<td style="text-align: right;">
						<input type="button" value="수정완료" id="contentRegBtn">
						</td>
						</tr>
					</table>
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
  }
</style>
</body>
</html>