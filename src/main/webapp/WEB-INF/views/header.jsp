<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>Insert title here</title>
</head>
<body>

<title>ul li{margin-left:100px; display:inline;} </title>
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

</style>
</head>
<body>
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
</body>
</html>