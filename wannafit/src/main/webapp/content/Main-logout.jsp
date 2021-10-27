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
	width:80%;
	height:200px;
	margin:0 auto;
	text-align:center;
}

#usrID {
	color:#A9BF9F;	
}


.footer {
	position:absolute;
	width:70%;
	margin-top:500pt;
	color:var(--gray-500-color);
	text-align:center;
}

.footer p {
	font-size:10pt;
}

.align-right { text-align:right; }
.align-left { text-align:left; }

</style>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">

var userSession = "${login_User}";
var usrGrp = "${login_UsrGroup}";
console.log("[Main] 유저세션 : " + userSession);
console.log("[Main] 유저그룹세션 : " + usrGrp);

$(document).ready(function(){
		
	$("table").eq(0).click(function(){ location.href = "${path}/schgrp.do"; });
	$("table").eq(1).click(function(){ location.href = "${path}/content/mypage/trainer/TR001-trReg.jsp"; });
	$("table").eq(2).click(function(){ location.href = "${path}/content/partner/HZ-01.jsp"; });
	$("table").eq(3).click(function(){ location.href = "${path}/join_com.do"; });

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
			<li><span id="usrGroup">${login_UsrGroup}</span></li>
			<li><span id="usrID">${login_User}님</span></li>
			<li><a href="${path}/login.do?proc=로그아웃">로그아웃</a></li>
			<!--  조건문으로 각 회원별 마이페이지 연결 -->
			<li><a href="${path}/mamcrud.do">마이페이지</a></li>
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
	<div id="img-container">
		<img src="${path}/content/A_settings/images/image2.jpg" width="800px" height="300px"/>
		<h3> 워너핏의 건강파트너가 되어보세요!! <a href="${path}/content/partner/HZ-01.jsp">[헬스장 신청]</a> </h3>
	</div>
</section>
<jsp:include page="/content/A_settings/main_footer.jsp"/>
</body>
