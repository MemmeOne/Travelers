<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<html>
<head>
<title>Home</title>

</head>
<body>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<fmt:requestEncoding value="utf-8" />
	<%@ include file="defualt/header.jsp"%>
	<%@ include file="defualt/footer.jsp"%>
=======
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
<style type="text/css">

ul li{ padding:0 50px; display:inline;  }
#menu1 ul{ width:1000px;  margin:0 auto; position:relative;}
#menu1 .main>li { float:left;  height:2px; line-height:20px;  text-align:center; }
#menu1 .main>li:hover .menu2{ display:block;}
#menu1 .main>li a{ display:block;}
#menu1 .main>li a:hover{ background:orange; color:purple;}
#menu1 .menu2{ position:absolute;  left:0; width:100%; display:none;}

#menu1 .sub{ float:left; width:15%;}
#menu1 .sub li a:hover{ background:yellow;}

#header .submenu{display:none;} /* 정보, 자유, 리뷰 메뉴 안보이게*/
				/*#header .menu > li a{display:block;}*/
#header nav .menu > li:hover .submenu{display:inline;}

#header nav section ul li.menu:hover ul.submenu {display:bolock;}
div.b {
  white-space: nowrap; 
  width: 100px; 
  overflow: hidden;
  text-overflow: ellipsis; 
  border: 1px solid #000000;
}
 .la {
  white-space: nowrap; 
  width: 100px; 
  overflow: hidden;
  text-overflow: ellipsis; 
}
</style>
</head>
<body>
<h1>
	Hello world!  
</h1>
<a href="mate_board_list?page=1">이동</a>
<P>  The time on the server is ${serverTime}. </P>
<label class="la">Heffforsdfgsfdgld!</label>ddd
<div class="b">Heffforsdfgsfdgld!</div>

   <div id="menu1">
      <ul class="main">
         <li><a href="quiz/quiz.jsp">문제</a>
         <div class="menu2">
            <ul class="sub">
               <li><a href="quiz/daily.jsp">데일리 문제</a></li>
               <li><a href="quiz/subject.jsp">단원별 문제</a></li>
               <li><a href="quiz/whole.jsp">한회차 문제</a></li>
            </ul>
         </div>
         <li><a href="board/board.jsp">게시판</a></li>
         <li><a href="rank.jsp">랭킹</a></li>
         <li><a href="info/info.jsp">시험관련정보</a></li>
         <li><a href="login/login.jsp">로그인</a></li>
         <li><a href="reg/reg.jsp">회원가입</a></li>
      </ul>
   </div>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <header id="header">
   	<nav>
		<section>
			<ul  class="menu">
				<li><a href="#"> 게시판 </a>
					<ul class="submenu">
						<li><a href="#">정보</a></li>
						<li><a href="#">자유</a></li>
						<li><a href="#">리뷰</a></li>
					</ul>
				</li>
			</ul>
		</section>
   	</nav>
   </header>

>>>>>>> origin/jw
</body>
</html>
