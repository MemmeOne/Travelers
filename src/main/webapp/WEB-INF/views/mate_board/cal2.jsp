<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
    <title>달력</title>
    <style type="text/css">
        td{
            width: 200px;
            height: 100px;
            text-align: center;
            font-size: 20px;
            font-family: 돋음;
            border:2px border-color:#3333FF;
            border-radius: 0px;/*모서리 둥글게*/
        }
        #calendar{ border-collapse:collapse}
        #hidden{display:none;}
    </style>
<script type="text/javascript">
        var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
        var date = new Date();//today의 Date를 세어주는 역할
        function prevCalendar(data) {//이전 달
        // 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
        //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
        //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
         today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
         buildCalendar(data); //달력 cell 만들어 출력 
        }
 
        function nextCalendar(data) {//다음 달
            // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
            //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
            //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
             today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
             buildCalendar(data);//달력 cell 만들어 출력
        }
        function buildCalendar(data ){//현재 달 달력 만들기
            var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
            //이번 달의 첫째 날,
            //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
            //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
            //왜냐면 getMonth()는 0~11을 반환하기 때문
            var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
            //이번 달의 마지막 날
            //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
            //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
            //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
            var tbCalendar = document.getElementById("calendar");
            //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
            var tbCalendarYM = document.getElementById("tbCalendarYM");
            //테이블에 정확한 날짜 찍는 변수
            //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
            //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
             tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
 
             /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
            while (tbCalendar.rows.length > 2) {
            //열을 지워줌
            //기본 열 크기는 body 부분에서 2로 고정되어 있다.
                  tbCalendar.deleteRow(tbCalendar.rows.length-1);
                  //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
                //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
             }
             var row = null;
             row = tbCalendar.insertRow();
             //테이블에 새로운 열 삽입//즉, 초기화
             var cnt = 0;// count, 셀의 갯수를 세어주는 역할
            // 1일이 시작되는 칸을 맞추어 줌
             for (i=0; i<doMonth.getDay(); i++) {
             /*이번달의 day만큼 돌림*/
                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
             }
            /*달력 출력*/
            var date_s=new Array();
            var ye=today.getFullYear();
            var mon=( today.getMonth() + 1 )
         	//console.log(ye)
        	//console.log(mon)
             for (i=1; i<=lastDate.getDate(); i++) { 
             //1일부터 마지막 일까지 돌림
                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                  //cell.innerHTML ="<a href='mate_content_view?num=10'>"
                  //cell.innerHTML = i
                  cell.innerHTML = i 
                  $.each(data,function(index,item){
                	  //console.log("item.mtravel_date_s="+item.mtravel_date_s)
                	  //console.log("item.title="+item.title)
                	  date_s=item.mtravel_date_s.split("-");
                	 // for(var i=0;i<date_s.length;i++) {
                		  //console.log(date_s[i])
                	  //}
                	 // console.log("년"+today.getFullYear())
                	  //console.log("월"+( today.getMonth() + 1 ))
                	 // today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
                 
                	  if(date_s[0]==ye) {
                		  if(date_s[1]==mon) {
                			  if(date_s[2]==i) {
                				  //console.log("a;lksdjflaskdjf")
                				  cell.innerHTML+="<br>"
                				 cell.innerHTML+="<a href='mate_content_view?num="+item.num+"'>"+item.title
                					//cell.innerHTML+=" <a href='mate_content_view?num=10'> 링크"
                					  //cell.innerHTML+=item.title
                					  //cell.innerHTML+=item.num
                					  //cell.innerHTML+=item.wnick
                					  cell.innerHTML+="</a>"
                			  }
                		  }
                	  }
                	  
                  })

                  //셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
              if (cnt % 7 == 1) {/*일요일 계산*/
                  //1주일이 7일 이므로 일요일 구하기
                  //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
                cell.innerHTML = "<font color=#F79DC2>" + i
                $.each(data,function(index,item){
              	  //console.log("item.mtravel_date_s="+item.mtravel_date_s)
              	  //console.log("item.title="+item.title)
              	  date_s=item.mtravel_date_s.split("-");
              	 // for(var i=0;i<date_s.length;i++) {
              		  //console.log(date_s[i])
              	  //}
              	 // console.log("년"+today.getFullYear())
              	  //console.log("월"+( today.getMonth() + 1 ))
              	 // today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
               
              	  if(date_s[0]==ye) {
              		  if(date_s[1]==mon) {
              			  if(date_s[2]==i) {
              				  //console.log("a;lksdjflaskdjf")
              				  cell.innerHTML+="<br>"
              				 cell.innerHTML+="<a href='mate_content_view?num="+item.num+"'>"+item.title
              					//cell.innerHTML+=" <a href='mate_content_view?num=10'> 링크"
              					  //cell.innerHTML+=item.title
              					  //cell.innerHTML+=item.num
              					  //cell.innerHTML+=item.wnick
              					  cell.innerHTML+="</a>"
              			  }
              		  }
              	  }
              	  
                })               
                
                //1번째의 cell에만 색칠
            }    
              if (cnt%7 == 0){/* 1주일이 7일 이므로 토요일 구하기*/
                  //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
                  cell.innerHTML = "<font color=skyblue>" + i
                  $.each(data,function(index,item){
                	  //console.log("item.mtravel_date_s="+item.mtravel_date_s)
                	  //console.log("item.title="+item.title)
                	  date_s=item.mtravel_date_s.split("-");
                	 // for(var i=0;i<date_s.length;i++) {
                		  //console.log(date_s[i])
                	  //}
                	 // console.log("년"+today.getFullYear())
                	  //console.log("월"+( today.getMonth() + 1 ))
                	 // today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
                 
                	  if(date_s[0]==ye) {
                		  if(date_s[1]==mon) {
                			  if(date_s[2]==i) {
                				  //console.log("a;lksdjflaskdjf")
                				  cell.innerHTML+="<br>"
                				 cell.innerHTML+="<a href='mate_content_view?num="+item.num+"'>"+item.title
                					//cell.innerHTML+=" <a href='mate_content_view?num=10'> 링크"
                					  //cell.innerHTML+=item.title
                					  //cell.innerHTML+=item.num
                					  //cell.innerHTML+=item.wnick
                					  cell.innerHTML+="</a>"
                			  }
                		  }
                	  }
                	  
                  })                 
                  //7번째의 cell에만 색칠
                   row = calendar.insertRow();
                   //토요일 다음에 올 셀을 추가
              }
              /*오늘의 날짜에 노란색 칠하기*/
              if (today.getFullYear() == date.getFullYear()
                 && today.getMonth() == date.getMonth()
                 && i == date.getDate()) {
                  //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
                cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로 
               }
             }
            

            
            
            

            
            
        }
        function db() {
            $.ajax({
            	url:"mate_cal_list",
            	type:"post",
            	success:function(data) {
            		console.log("성공")
            		buildCalendar(data )
            		
            	},
    			error : function(request, status, error) {
    				console.log("실패")
    				alert("code:" + request.status + "\n" + "message:"
    						+ request.responseText + "\n" + "error:" + error);
    			}
            	
            })
        }
        
        function dbprev() {
            $.ajax({
            	url:"mate_cal_list",
            	type:"post",
            	success:function(data) {
            		console.log("성공")
            		prevCalendar(data)
            		
            	},
    			error : function(request, status, error) {
    				console.log("실패")
    				alert("code:" + request.status + "\n" + "message:"
    						+ request.responseText + "\n" + "error:" + error);
    			}
            	
            })
        }
        function dbnext() {
            $.ajax({
            	url:"mate_cal_list",
            	type:"post",
            	success:function(data) {
            		console.log("성공")
            		nextCalendar(data)
            		
            	},
    			error : function(request, status, error) {
    				console.log("실패")
    				alert("code:" + request.status + "\n" + "message:"
    						+ request.responseText + "\n" + "error:" + error);
    			}
            	
            })
        }
        
         
        
    </script>
</head>
<body onload="db()">
	<%@ include file="../default/header.jsp"%>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Main -->
		<article id="main">
			<section class="wrapper style5">
				<div class="inner" style="width: 70%;">
    <p></p>
    <input type="hidden"   value="${mate_list_for_cal}">
 	<!--<c:forEach items="${mate_list_for_cal}" var="mate_dto">
		${mate_dto.mtravel_date_s }  
	</c:forEach>-->
    <h3 align="center">여행 동행 게시판 달력</h3>
<table id="calendar" border="3" align="center" style="border-color:black ">
    <tr><!-- label은 마우스로 클릭을 편하게 해줌 -->
        <td><label onclick="dbprev()"> < </label></td>
        <td align="center" id="tbCalendarYM" colspan="5">
        yyyy년 m월</td>
        <td><label onclick="dbnext()"> > </label></td>
    </tr>
    <tr>
        <td align="center"><font color ="#F79DC2">일</td>
        <td align="center">월</td>
        <td align="center">화</td>
        <td align="center">수</td>
        <td align="center">목</td>
        <td align="center">금</td>
        <td align="center"><font color ="skyblue">토</td>
    </tr> 
</table>
				</div>
			</section>
		</article>
	</div>
	<%@ include file="../default/footer.jsp"%>
	<script type="text/javascript">

    //buildCalendar( );//
</script>
</body>
</html>
