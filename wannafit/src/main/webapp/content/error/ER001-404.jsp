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
	position:relative;
	top:60px;
	width:100%;
	height:80%;
	margin:0 auto;
}

#img-container {
	width:100%;
	margin:0 auto;
	text-align:center;
}

#tab-error {
	width:80%;
	margin:0 auto;
	padding:5%;
}

h2 {
	text-align:left;
}

</style>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		
	});
</script>
</head>
<body>
<nav class="navbar">
	<div class="nav-wrapper">
	<ul class="logo">
		<li><a href="${path}/content/Main.jsp">WANNAFIT</a></li>
	</ul>
	</div>
    
	<div class="menu-wrapper">
	<form><input type="hidden" name="proc"/></form>
		<ul class="menu">
			<li><a href="${path}/login.do?proc=로그인">로그인</a></li>
			<li><a href="${path}/join.do?proc=회원가입">회원가입</a></li>
			<li><span>워너핏 X 파트너</span></li>
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
		<li><a href="${path}/content/funding/FUN-UI-01.jsp"><b>펀인핏</b></a></li>
		<li><a href="#"><b>마인핏</b></a></li>
	</ul>
</nav>
<section class="section">
	<div id="img-container">
		<table id="tab-error">
			<tr>
				<td><img src="${path}/content/error/img/warning.png" width="200px" height="200px"></td>
				<td><h2>404 에러 발생!</h2></td>
			</tr>
		</table>
		<h3><a href="${path}/login.do">메인 화면으로 돌아가기</a></h3>
	</div>
</section>
</body>
