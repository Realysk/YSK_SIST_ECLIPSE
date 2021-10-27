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

:root {
    --gray-100-color: #f9fbff;
    --gray-150-color: #f4f6fb;
    --gray-300-color: #e1e5ee;
    --gray-500-color: #4f546c;

    --point-bg-color: #f4f6fb;
    --point-font-color: #8C4D16;
    --point-bg2-color: #A9BF9F;
}

.section {
	position:relative;
	top:60px;
	width:100%;
	height:80%;
	margin:0 auto;
}

#img-container {
	width:100%;
	height:600px;
	margin:0 auto;
	text-align:center;
}

.footer {
	position:relative;
	width:100%;
	height:100px;
	color:var(--gray-500-color);
	text-align:center;
	padding-top:4%;
	padding-bottom:2%;
}

.footer p {
	font-size:10pt;
}

</style>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">

var userSession = "${login_User}";
var usrGrp = "${login_UsrGroup}";
console.log("[Main] 유저세션 : " + userSession);
console.log("[Main] 유저그룹세션 : " + usrGrp);

var resultAlert = "${resultAlert}";
console.log("[Main]로그인결과 : " + resultAlert);

if(resultAlert != "") {
	alert(resultAlert);
}

	$(document).ready(function(){
		
		
	});
</script>
</head>
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
			<li><a href="${path}/login.do?proc=로그인">로그인</a></li>
			<li><a href="${path}/join.do?proc=회원가입">회원가입</a></li>
			<li><a>워너핏 X 파트너</a></li>
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
<section class="section">
	<jsp:useBean id="dao" class="wannafit.content.reserve.ReserveDAO"/>
	<c:set var="ids" value="daily03"/>
	<c:set var="day" value="${dao.getScheduleDate(ids)}"/>
	<h3>fmt 처리 short(날짜) : <fmt:formatDate type="date" dateStyle="short" value="${day}"/></h3>
	<fmt:formatDate pattern="yyyy" value="${dao.getScheduleDate(ids) }" /> </h3>
</section>
<jsp:include page="/content/A_settings/main_footer.jsp"/>
</body>
