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
	width:100%;
	height:100%;
	margin:0 auto;
	margin-top:100px;
	margin-bottom:80px;
}

.reg-table {
	width:70%;
	padding:30px 30px 30px 40px;
}

.reg-table thead td{
	height:40px;
	border:1px solid var(--gray-500-color);
}

.reg-table tbody td{
	height:40px;
	padding:2%;
	border-bottom:1px solid var(--gray-300-color);
}

.reg-table tbody td:nth-child(odd){
	height:40px;
	border-right:1px solid var(--gray-300-color);
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
	$(document).ready(function() {
		
	});
</script>
</head>
<%-- 
# 

--%>
<%

%>
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
	<div class="main-container" align="center">
		<form name="regForm" method="post">
			<table align="center" class="reg-table">
				<thead><tr>
					<td colspan="2"><h2 align="center">워너핏X파트너</h2><h3 align="center">헬스장 파트너 등록 폼</h3></td>
				</tr></thead>
				<tr>
					<td>사용하실 아이디를 입력해주세요.</td>
					<td><input name="id" size="15"></td>
				</tr>
				<tr>
					<td>사용하실 비밀번호를 입력해주세요.</td>
					<td><input name="pass" size="15"></td>
				</tr>
				<tr>
					<td>헬스장의 상호를 입력해주세요.</td>
					<td><input name="fitness center name" size="15"></td>
				</tr>
				<tr>
					<td>대표자 성함을 입력해주세요.</td>
					<td><input name="owner name" size="15"></td>
				</tr>
				<tr>
					<td>연락처를 입력해주세요.</td>
					<td><input name="phone number" size="15"></td>
				</tr>
				<tr>
					<td>사업자번호를 입력해주세요.</td>
					<td><input name="business number" size="15"></td>
				</tr>
				<tr>
					<td>운영 시간을 작성해주세요.</td>
					<td><input name="business hours" size="15"></td>
				</tr>
				<tr>
					<td>헬스장 소개를 작성해주세요.</td>
					<td><input name="fitness center introduction" size="15"></td>
				</tr>
				<tr>
					<td>헬스장의 최대 수용 인원을 작성해주세요.</td>
					<td><input name="maximum" size="15"></td>
				</tr>
				<tr>
					<td>헬스장의 위치를 알려주세요.</td>
					<td><input name="fitness location" size="15"></td>
				</tr>
			</form>
		</table>
	
		<form name="" id="" action="" method="">
			<button type="button" onclick="">취소</button>
			<button type="button" onclick="">확인</button>
		</form>
	</div>
</section>
<jsp:include page="/content/A_settings/main_footer.jsp"/>
</body>
</html>