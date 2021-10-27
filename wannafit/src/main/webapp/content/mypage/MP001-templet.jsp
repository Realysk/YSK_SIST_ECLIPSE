<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "java.util.*"
    import ="wannafit.content.vo.*"
    import ="wannafit.content.DB.*"
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
</head>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
	});
</script>
<style>

	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
	/* .side_menu2:hover {color: #A9BF9F;} */
	
.aside {
	position:absolute;
	width:15%;
	height:1000px;
	border-right:1px solid black;
	margin-top:5%;
	float:left;
}

.section {
	position:relative;
	left:18%;
	width:85%;
	height:100%;
	margin:0 auto;
	margin-top:5%;
	margin-bottom:10%;
	float:left;
}

.main-container {
	position:relative;
	width:80%;
	height:950px;
	margin:0 auto;
	border:1px solid black;
	border-radius:1px 1px 1px 1px;
}

.main-container div{
	width:100%;
	margin:0 auto;
	padding:5%;
}

.sub1-menu ul{
	list-style:none;
	margin:0 auto;
}

.sub1-menu li{
	width:120px;
	height:20px;
	padding:5%;
}

.main-table, .sub-table {
	width:90%;
	border:1px solid black;
}

.main-table td{
	height:35px;
	border:1px solid black;
}

.tab-title {
	width:150px;
	padding:1%;
	text-align:center;
}

#btnTag{
	width:100px;
	height:100px;
	margin:0 auto;
	padding:1%;
	border:1px dotted black;
}

.sub-table td{
	height:40px;
	border:1px solid black;
}

.sub-table p{
	height:20px;
	margin:7px;
}
	
</style>
<body>
<nav class="navbar">
	<div class="nav-wrapper">
	<ul class="logo">
		<li><a href="${path}/login.do">WANNAFIT</a></li>
	</ul>
	</div>
    
	<div class="menu-wrapper">
	<ul class="menu">
			<li><a href="${path}/login.do?proc=로그인">로그인</a></li>
			<li><a href="${path}/join.do?proc=회원가입">회원가입</a></li>
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
	
<aside class="aside">
<div class="sub1-menu">
	<ul id="side-menu">
		<h3> 마이페이지 </h3>
		<li><a href="${path}/content/mypage/schedule/cal.jsp"> 캘린더 </a></li>
		<li><a href="#"> 그룹핏 관리 </a></li>
		<li><a href="#"> 예약 내역 </a></li>
		<li><a href="#"> 펀딩 내역 </a></li>
	</ul>
	<ul id="side-menu">
		<h3> 회원 관리 </h3>
		<li><a href="${path}/mamcrud.do"> 개인정보 수정 </a></li>
		<li><a href="#"> 문의 내역 </a></li>			
	</ul>
</div>		
</aside>
<%-- 해당 페이지 내용은 아래 section 태그 안에서 코딩해주세요~ --%>
<section class="section" style="margin-left:45px;">
	<div class="main-container">
			
		
		
		
		
	</div>
</section>
</body>
</html>