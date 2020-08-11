<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>about Travelers</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/html5up-spectral/assets/css/main.css" />
<noscript><link rel="stylesheet" href="resources/html5up-spectral/assets/css/noscript.css" /></noscript>
</head>
<body class="landing is-preload">
   <%@ include file="default/header.jsp"%>
   
   <!-- Page Wrapper -->
   <div id="page-wrapper">

      <!-- One -->
      <section id="one" class="wrapper style1 special" style="background: none;">
         <div class="inner">
            <header class="major" style="margin-top: 70px;">
               <h2>
             	     About Traverlers
               </h2>
               <p style="color:white;">
               	Traverlers는 같이 여행 갈 동행을 구하는 여행 커뮤니티 사이트입니다.<br>
               	마음이 맞는 친구를 만나 어디든 함께 떠나세요.
               </p>
            </header>
            <!-- <ul class="icons major">
            <li></li>
               <li><span class="icon fa-paper-plane major style1"><span
                     class="label">Lorem</span></span></li>
               <li><span class="icon solid fa-headphones-alt major style2"><span
                     class="label">Ipsum</span></span></li>
               <li><span class="icon fa-heart major style3"><span
                     class="label">Dolor</span></span></li>
               <li><span class="icon solid fa-gem major style3"><span
                     class="label">Dolor</span></span></li>
            </ul> -->
         </div>
      </section>
      
      <!-- Two -->
      <section id="two" class="wrapper alt style2">
         <section class="spotlight">
            <div class="image">
               <img src="resources/html5up-spectral/images/pic01.jpg" alt="" />
            </div>
            <div class="content">
               <h2>
                                          여행 동행 찾기
               </h2>
               <p>달력에 표시된 여행 동행을 선택하세요.<br>
                                       상세 검색을 통해 꼭 맞는 여행 동행을 찾을 수 있습니다.<br>
               	   새로운 여행이 여러분을 기다리고 있어요.</p>
            </div>
         </section>
         <section class="spotlight">
            <div class="image">
               <img src="resources/html5up-spectral/images/pic02.jpg" alt="" />
            </div>
            <div class="content">
               <h2>
                                          여행 리뷰 게시판
               </h2>
               <p>당신의 여행을 기록해 주세요.<br>
               	추억이 고스란히 전해질 거예요.</p>
            </div>
         </section>
         <section class="spotlight">
            <div class="image">
               <img src="resources/html5up-spectral/images/pic03.jpg" alt="" />
            </div>
            <div class="content">
               <h2>
                                        여행 정보 공유 게시판
               </h2>
               	<p>여행에 관한 다양한 정보들이 가득합니다.<br>
              	 여행을 떠나기 전 이 곳을 통해 정보들을 얻어가세요.</p>
            </div>
         </section>
         <section class="spotlight">
            <div class="image">
               <img src="resources/html5up-spectral/images/pic02.jpg" alt="" />
            </div>
            <div class="content">
               <h2>
                                        자유 게시판
               </h2>
               <p>자유롭게 소통하는 공간입니다.<br>
        	       다양한 이야기를 들려주세요. </p>
            </div>
         </section>
      </section>

      <!-- CTA -->
      <section id="cta" class="wrapper style4">
         <div class="inner">
            <header>
               <h2>이제 여행을 떠날 시간입니다.<br/>
            	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;행복하게 여행하세요.</h2>
            </header>
            <ul class="actions stacked">
            <c:choose>
            <c:when test="${loginUser.id eq null }">
                 <li><a href="login" class="button fit primary">로그인</a></li>
               <li><a href="reg_tos" class="button fit">회원가입</a></li>
               </c:when>
               <c:otherwise>
                 <li></li>
                <li><a href="mate_board_list?page=1" class="button fit primary">여행 동행 찾기</a></li>
               </c:otherwise>
               </c:choose>
            </ul>
         </div>
      </section>

   </div>
   <%@ include file="default/footer.jsp"%>
</body>
</html>