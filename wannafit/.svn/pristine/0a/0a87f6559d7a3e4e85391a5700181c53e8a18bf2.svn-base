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
}

*,
*::befor,
*::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

.aside {
	position:absolute;
	width:15%;
	height:1000px;
	margin-top:7%;
	float:left;
}

.sub1-menu {
	height:100%;
}

.sub1-menu ul{
	list-style:none;
	margin:0 auto;
}

.sub1-menu li{
	width:120px;
	height:20px;
	padding:5%;
	border-bottom:1px solid var(--gray-300-color);
}

.section {
	position:relative;
	left:18%;
	width:85%;
	height:2em;
	margin:0 auto;
	margin-top:4%;
	margin-bottom:10%;
	float:left;
}

.main-container {
	width: 620px;
	height: 500px;
	margin:0 auto;
	text-align:center;
	background-image:url('${path}/content/reserve/rev-com.png');
	background-repeat:no-repeat;
	background-size:100%;
}

div>a {
	position: absolute;
	left:45%;
	top:75%;	
}

#usrID, a:active, a:hover, #ckCt{
	color:#A9BF9F;	
}


</style>
</head>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">

function revOk() {
	var isRevResult = "${isRevResult}";

	if(isRevResult) {
		alert("예약이 완료되었습니다!");
		$("#result_Title").html("예약완료!");
		$("#result_Content").html("시간에 맞추어 방문해주세요");
		$("#back").text("메인으로 가기").attr("href", "${path}/login.do");
	} else {
		alert("예약이 실패했습니다");
		$("#result_Title").html("예약실패!");
		$("#result_Content").html("처음부터 다시 신청해주세요");
		$("#back").text("뒤로 가기").attr("href", "history.back(-1)");
	}
}
	$(document).ready(function(){
		revOk();
		
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
<!--  Section의 왼쪽 : 예약 카테고리 -->
<aside class="aside">
<div class="sub1-menu">
	<ul id="side-menu"><h3>예약하기</h3>
		<li><a id="ckCt">트레이너 예약</a></li>
		<li><a>헬스장 예약</a></li>
		<li><a>예약 문의</a></li>
	</ul>
</div>
</aside>

<!--  Section의 오른쪽 : 내용 -->
<section class="section">
	<div class="main-container">
		<span id="result_Title"></span>
		<span id="result_Content"></span>	
		<a id="back"></a>	
	</div>
</section>
</body>
</html>