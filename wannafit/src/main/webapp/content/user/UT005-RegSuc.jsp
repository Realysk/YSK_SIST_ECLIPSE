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
<style type="text/css">

.section {
	width:100%;
	height:100%;
	margin:0 auto;
	margin-top:100px;
	margin-bottom:80px;
}

.main-container {
	width: 620px;
	height: 500px;
	margin:0 auto;
	text-align:center;
	background-image:url('img/reg-completed001.png');
	background-repeat:no-repeat;
	background-size:100%;
}

div>a {
	position: absolute;
	left:45%;
	top:75%;	
}

 
</style>
</head>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
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
		<ul class="menu">
			<li><a href="${path}/login.do">로그인</a></li>
			<li><a href="${path}/join.do">회원가입</a></li>
			<li><a href="${path}/login.do">워너핏 X 파트너</a></li>
		</ul>
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
		<li><a href="${path}/content/mypage/minepit.jsp"><b>마인핏</b></a></li>
	</ul>
</nav>
<section class="section">
	<div class="main-container">
		<a href="${path}/login.do?proc=로그인">로그인하러가기</a>
	</div>
		
</section>
</body>
</html>