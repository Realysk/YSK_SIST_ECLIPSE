<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "java.util.*"
    import ="wannafit.content.vo.*"
    import ="wannafit.content.DB.*"
    import ="wannafit.content.funding.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value ="utf-8"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Wanna-Fit, 나만의 핏을 찾아서 </title>
<link rel="stylesheet" href="${path}/content/A_settings/main_nav.css">
<style>


body {
width : 70%;
align: center;
margin: 0 auto;
}

.title01 {
text-align : center;
background : #A9BF9F;
height : 50px;
padding-top :10px;
padding-bottom:20px;
}

#title{
font-size:20px;
font-weight:bold;
padding-left:10px;
marigin:10px;
width:100%;
text-align:ceter;
}

section {
margin-top:100px;
width:100%
text-align :left;
}

.sec00 {
width:100%;
text-align :center;
margin-top:10px;
font-size:20px;
}

.tab00 {
width:100% ;
text-align :center;
}
.sec01 {
width:65%;
text-align :left;
margin-top:5px;
padding:0;
float:left;

}

.sec02{
width:35%;
align :right;
margin:0 auto;
float:right;
margin-top:5px;
}

.tab01 {
text-align: center;
margin : 10px 10px 10px 10px;
width:100%;
}

.tab02 {
text-align: center;
margin : 10px 10px 10px 10px;
float:right;
font-size : 20px;
bord:1px;
width:80%;
}

.tab03 {
text-align: center;
float: right;
background:#A9BF9F;
margin : 10px 10px 10px 10px;
width:80%;
background-color: #efefef; 
border-radius: 6px; 
border: 1px solid #dedede; 
         padding: 10px; 
         margin-top: 3px; 
         font-size: 0.9em; 
         color: #3a3a3a; 
}

.tab04 {
text-align: center;
float:right;
margin : 10px 10px 10px 10px;
width:80%;
}

.tab05 {
text-align: left;
float: right;
border-radius: 3px; 
border: 1px solid #dedede; 
margin : 10px 10px 10px 10px;
width:80%;
background:#ffff;
box-shadow:1px 1px 1px #ccc;
}

.content {
	background:#ffff;
	box-shadow:1px 1px 1px #ccc;	
	
	width:100%;
}
.div123 {
align : center;
margin-top:15px;
float:center;
align:center;
}


.wCg {
	line-height:30px;
	padding:14px 20px;
	text-align:center;
	color:none;
	display:inline;
    background:none;
	color:white;
	margin-top:50%;
	width:100%;

}


.wCg:hover {
	background:none;
	color:white;
	margin-top:50%;
	width:300px;
	height:100px;
	box-shadow: 0px 0px 20px #000;
}
.fund_btn {
width:80%;


}

.separate01 {
height:10px;
}
.wantbtn {
width:100%;
}
.frametitle {
float:center;
align:center;
}

#count {
font-size:15px;
font-weight:bold;
color:#8C4D16;
padding-left:10px;
marigin:10px;
}
.p{
text-sixe:5px;
text-weight:bold;
}
.text_s{
text-sixe:6px;
}
.param{
font-size:20px;
font-weight:bold;
}

button{
  background:#F2B01F;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:1.0em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
.info_c {
text-aling:left;
font-weight:bold;
font-size:12px;'
margin-bottom:20px;
}

.info_c2 {
text-aling:left;
font-weight:light;
font-size:13px;'
margin-bottom:20px;
}
.progress {
width:70%;
}
</style>

</head>
<%-- 
# 

--%>
<%
String code = request.getParameter("code");


if(code ==null) code = "";

FUN_dao dao2 = new FUN_dao();
ArrayList<FunPro_VO> funlist = dao2.getDtfundinglist(code);

//getfundinglist


%>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#fundingbtn").click(function(){
		console.log(codeS);
		location.href = "FUN-UI-03-01.jpg?codeS="+codeS;
	});
var dayday = $("input[name=end_Day]").val();
console.log(dayday);
var daysplit = dayday.split("-");
var year = daysplit[0];
console.log(year);
var month = daysplit[1];
console.log(month);
var day = daysplit[2];
console.log(day);
    //var dday = new Date("November 30, 2020, 0:00:00").getTime();
	//var dday = new Date("2021,02,11,11,00,00").getTime();
	//var dday = new Date("September "+day+","+year+", "+"00:00:00").getTime();
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
document.querySelector("#count").innerHTML =  day + "일 " + hour + "시간 " + min + "분 " + sec+ "초";
}, 1000);

});

</script>




<body>

	<nav class="navbar">
		<div class="nav-wrapper">
		<ul class="logo">
			<li><a href="${path}/login.do">WANNAFIT</a></li>
		</ul>
		</div>
	    
		<div class="menu-wrapper">
		<form><input type="hidden" name="proc"/></form>
				<ul class="menu">
				<li><span id="usrGroup">${login_UsrGroup}</span></li>
				<li><span id="usrID">${login_User}님</span></li>
				<li><a href="${path}/login.do?proc=로그아웃">로그아웃</a></li>
				<!--  조건문으로 각 회원별 마이페이지 연결 -->
				
				<c:choose>
					<c:when test="${not empty login_User and login_UsrGroup eq '일반회원'}">
						<li><a href="${path}/mamcrud.do">마이페이지</a></li>
					</c:when>
					<c:when test="${not empty login_User and login_UsrGroup eq '트레이너'}">
						<li><a href="${path}/mytr.do">마이페이지</a></li>
					</c:when>
					<c:when test="${not empty login_User and login_UsrGroup eq '기업'}">
						<li><a href="${path}/mytr.do">마이페이지</a></li>
					</c:when>
				</c:choose>
				
				</ul>
		</div>
	</nav>
  
	<nav class="navar1-1">
		<div><b>내가 원하는 삶을 살기 위한 건강 프로젝트! 워너핏</b></div>
	</nav>
  
	<nav class="navbar2">
		<ul class="side_menu1">
			<li><a href="${path}/content/mapfit/wfmap01.jsp"><b>맵핏</b></a></li>
			<li><a href="${path}/reserve.do"><b>예약</b></a></li>
			<li><a href="${path}/schgrp.do"><b>그룹핏</b></a></li>
			<li><a href="${path}/funding.do"><b>펀인핏</b></a></li>
			<li><a href="#"><b>마인핏</b></a></li>
		</ul>
	</nav>
	
 <div class ="separate1">
  <p></p>
  </div>

<section> 

<% for(FunPro_VO f:funlist){ %>
<input name ="time" type="hidden" value="<%=f.getFp_enddate()%>"/>
<%} %>

<p class = "p"></p>   

	<div class ="sec00">
			<table class ="tab00"> 
			<% for(FunPro_VO f:funlist){ %>
			<tr><td><p id = "title"><%=f.getFp_title()%></p></td></tr>
			<%} %>
			</table>
			<hr>
	</div>

	<div class ="sec01">
		<table class ="tab01"> 
			<tr><td><img src ="img/img01.JPG" width ="100%" height ="100%" /></td></tr>
		</table>
		<br>
		<hr>
		<div class= "div123">
			<div class ="frametitle">
		<span class="wCg"><a href="det_frame1.jsp" target="contentFrame" onclick="wCgChange()" id="wACate1">펀딩정보</a></span>
		<span class="wCg"><a href="det_frame2.jsp" target="contentFrame" onclick="wCgChange()" id="wACate2">수수료안내</a></span>
		<span class="wCg"><a href="det_frame3.jsp" target="contentFrame" onclick="wCgChange()" id="wACate2">문의내역</a></span>
			</div>
				<hr>
		
	</div>
	</div>

	<div class ="sec02">
	
<div class="content">
		<table class ="tab02">
		<% for(FunPro_VO f:funlist){ %>
			<tr><td><p class ="p">펀딩 만료시까지</p><h4 id ="count" class="param"> <%=f.getFp_enddate()%></h4></td></tr>
		<%}%>
		
		
		</table>
		
		<%for(FunPro_VO f:funlist) {%>
		<input name ="end_Day" type ="hidden" value ="<%=f.getFp_enddate()%>"/>
		<%} %>

	
		
		<table class ="tab03">
		<% for(FunPro_VO f:funlist){ %>
			<tr><td class="text_s">목표금액</td></tr>
			<tr><td class="param"><%=f.getFp_tagprice()%></td></tr>
			
			<tr><td class="text_s">달성금액</td></tr>
			<tr><td class="param"><%=f.getFp_accprice()%></td></tr>
		
			<tr><td><%=f.getFp_people()%> 명의 서포터와 함께합니다.</td></tr>
			
			<%}%>
		</table>
		
		
			<form action = "FUN-UI-03-01.jsp?codeS=<%=code%>" method ="post">
			<table class ="tab04">
			<tr><td><button id ="fundingbtn" onclick = "function()" class = "fund_btn">펀딩하기</button></td><tr>
			<tr> 
				<td colspan ="4"><input type ="submit" name = "qna_btn" value = "공유"/>
								<input type ="submit" name = "share_btn" value = "찜"/>
								<input type ="submit" name = "record_btn" value="신고" />
				</td>
			</tr>
		
		</table>
		</form>
	</div>
	
	
	<table class ="tab05">
	<tr><td class="info_c">창작자소개</td></tr>
			<tr><td class="info_c2">기업명:</td></tr>
			<tr><td class="info_c2">연락처:</td></tr>
			<tr><td class="info_c2">sns주소:</td></tr>
			<tr><td>평점: <progress class="progress" value="20" max="100"></progress></td></tr>
			<tr><td><input type ="submit" name = "want_btn" value = "창작자에게 문의하기"/></td></tr>
		
		</table>
	</div>
		



</section>
	
</body>
</html>