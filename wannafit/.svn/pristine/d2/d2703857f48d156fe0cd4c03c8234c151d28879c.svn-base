<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
	import = "wannafit.content.funding.*"
	import = "wannafit.content.vo.*"
	
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/MINI/a01_setting/main_nav.css">


<meta charset="UTF-8">
<title> Wanna-Fit, 나만의 핏을 찾아서 </title>
</head>
<script src="${path}/MINI/a01_setting/jquery-3.6.0.js" type="text/javascript"></script>
<style>
﻿* {
	margin:0;
	padding:0;
}
h1 {
	width:100%;
	height:150px;
	background: url('../images/top-bg.jpg') no-repeat left top;
	background-size:cover;
	line-height: 150px;
	padding-left:50px;
}
.sec {
width:98%;
align :center;
margin-top:100px;

}

.sec00{
width:800px;
height:200px;
margin-left:10px;
}

#wrapper {
	width:100%;
	max-width:900px;
	min-width:900px;
	margin: 2px 2px 2px 2px;
	
}
#columns {
	-webkit-column-count:2;
	-webkit-column-gap:10px;
	-moz-column-count:2;
	-moz-column-gap:5px;
	column-count:2;
	column-gap:20px;	
}
.card {
	display:inline-block; 
	width:270px;
	background:#ffff;
	box-shadow:1px 1px 1px #ccc;
	padding:15px;
	margin:2px;
	overflow:hidden;
	margin-left:8px;
}
.card img {
	
	border-bottom:1px solid #ccc;
	padding-bottom:15px;
	margin-bottom:5px;
	width :100%;
    height: 90px;

    border-radius: 3px;
}

.card p {
	font-family:"맑은 고딕", 돋움;
	color:#333;
	margin:0;
	padding:10px;
}
	
@media(min-width:600px){
	#columns{
		-webkit-column-count:3;
		-moz-column-count:3;
		column-count:3;
	}
	}
@media(min-width:600px){
	#columns{
		-webkit-column-count:3;
		-moz-column-count:3;
		column-count:3;
	}
}
.A {
width :100%;
height: 100px;
overflow:hidden;
border-radius: 3px;
}

.A img {

transition: all 0.3s linear;
object-fit: cover;
}

.A:hover img {

 transform:scale(1.1);
}
.p {
height:100px;

}

.content {
font-size:9px;
font-weight:light;
line-height:5px;
}

.titlediv {
height :80px;
}

.title01 {
font-weight:bold;
font-size:15px;
}

.categorydiv {
font-size:12px;
font-weight:bold;
color:  #D9B68B;
padding-left:10px;
}
.hr {
background-color: #A9BF9F;
margin-left:10px;
}

.time{
font-size:15px;
font-weight:bold;
color:#8C4D16;
padding-left:10px;
marigin:10px;
}
.img_2 {
width:900px;
height:250px;

}

.progress {
height:10px;
}
</style>
</head>
<%-- 
# 
<jsp:include page="/MINI/MAIN/Main.jsp"></jsp:include>
	<!-- <p class ="categorydiv"> 달성률:<%=((int)Math.round(f.getFp_accprice())/(int)Math.round(f.getFp_tagprice()))*100)%> </p>-->
		<p class ="categorydiv"> 달성률:((int)Math.round(<%=f.getFp_accprice()%>)/(int)Math.round(<%=f.getFp_tagprice()%>))*100</p> 
	<p class ="categorydiv"> 달성률:<%=((int)Math.round(f.getFp_accprice())/(int)Math.round(f.getFp_tagprice())*100%></p> 
	
--%>
	<% 	
	FUN_dao dao2 = new FUN_dao();
	ArrayList<FunPro_VO> funlist = dao2.getfundinglist();
	//getfundinglist	
	

	%>
	
<body>
<script src="${path}/MINI/a01_setting/jquery-3.6.0.js" type="text/javascript"></script>
<script type ="text/javascript">
$(document).ready(function() {
	$("#img").click(function() {
		var code= $("[name=id]").val();
		console.log(code);
		location.href = "FUN-UI-02.jsp?code="+code; 
	});
});
</script>



<nav class="navbar">
    <div class="nav-wrapper">
      <ul class="logo">
        <li><a href="#">WANNAFIT</a></li>  
      </ul>
    </div>
    
    <div class="menu-wrapper">
      <ul class="menu">
    	<li><a href="#">워너핏 X 파트너</a></li>
        <li><a href="#">로그인</a></li>
        <li><a href="#">회원가입</a></li>
      </ul>
    </div>
  </nav>
  
  <nav class="navar1-1">
 
  <div><b>내가 원하는 삶을 살기 위한 건강 프로젝트! 워너핏</b></div>

  </nav>
  
  
  <nav class="navbar2">
	   <ul class="side_menu1">
	        <li><a href="#"><b>맵핏</b></a></li>
	        <li><a href="#"><b>예약</b></a></li>
	        <li><a href="#"><b>그룹핏</b></a></li>
	        <li><a href="#"><b>펀인핏</b></a></li>
	        <li><a href="#"><b>워너핏</b></a></li>
	   </ul>
   </nav>

<p class = "p"></p>   

<section class="sec00"> 
<div ><img  class="img_2" src ="img/img001.JPG"/></div></section>
<section class ="sec">


<hr class ="hr">
	<div id ="wrapper">
	<div id = "columns">	
	<form action = "FUN-UI-01.jsp" method ="post">
	<%for(FunPro_VO f:funlist) {%>
	<div onclick = "function()"class = "card">
	<div class="titlediv"><p class ="title01" id ="title"><%=f.getFp_title()%></p></div>
	<div class="A"><img onclick = "function()" id = "img" src = "img/<%=f.getFp_picurl()%>"></div>
	<div class="categorydiv"><span><%=f.getFp_category()%></span><span><%=f.getWm_id()%></span></div>
	<p id = "title"><%= f.getFp_intro()%></p>
	<p class ="content" id = "enddate">펀딩마감일:<%=f.getFp_enddate()%></p>
	<p class ="content" id = "attend">서포터참여자:<%= f.getFp_people()%></p>	
	<p class ="content" id = "accumulate">누적금액:<%= f.getFp_accprice()%></p>
	<p class ="content" id = "goal"> 목표금액: <%= f.getFp_tagprice()%></p>
	<progress class="progress" value="<%=f.getFp_accprice() %>" max="<%=f.getFp_tagprice()%>"></progress>
	<div><span class ="categorydiv">남은시간</span><span class="time"></span></div>
	<input type ="hidden" id = "funding" name ="id" value ="<%=f.getWm_id()%>"/>
	<input type ="hidden" id = "funding" name ="end_Date" value ="<%= f.getFp_enddate()%>"/>
	
	<!--  //F1000004 -->
	</div>
	<%} %>
	</form>
	
	</div>
	</div>
</section>

<script type="text/javascript">
$(document).ready(function() {
var dayday = $("input[name=end_Date]").val();
console.log(dayday);
var daysplit = dayday.split("-");
var year = daysplit[0];
console.log(year);
var month = daysplit[1];
console.log(month);
var day = daysplit[2];
console.log(day);
var dday = new Date(month+" "+day+","+year+", "+"00:00:00").getTime();

setInterval(function() {
var today = new Date().getTime();
var gap = dday - today;
var day = Math.ceil(gap / (1000 * 60 * 60 * 24));
var hour = Math.ceil((gap % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
var min = Math.ceil((gap % (1000 * 60 * 60)) / (1000 * 60));
var sec = Math.ceil((gap % (1000 * 60)) / 1000);
var tot =  "D-DAY까지 " + day + "일 " + hour + "시간 " + min + "분 " + sec + "초 남았습니다."
console.log(sec);
document.querySelector(".time").innerHTML =  + day + "일 " + hour + "시간 " + min + "분 " + sec +"초";
}, 1000);

});
</script>

</body>

</html>