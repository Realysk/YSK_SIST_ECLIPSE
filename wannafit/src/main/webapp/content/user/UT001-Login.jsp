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

a, a:active {
	color:black;
}

img{
	width:32px;
	height:32px;
}

.section {
	width:100%;
	height:100%;
	margin:0 auto;
}

.main-container {
	position:relative;
	width:500px;
	height:500px;
	margin:0 auto;
	margin-top:7%;
}

.member-container {
	position:relative;
	top:50px;
	margin:0 auto;
	text-align:center;
	display:block;
}

.member-class {
	width:61px;
	height:30px;
	margin:0 auto;
	padding:6px;
	display:inline-block;
	font-size:14px;
}

.member-class:hover {
	width:60px;
	height:30px;
	margin:0 auto;
	padding:5px;
	display:inline-block;
	color:#A9BF9F;
	border-bottom:1px solid black;
}

.login-container {
	position:relative;
	top:50px;
	margin:0 auto;
	display:block;
}

#logon_form_table{
	margin:0 auto;
	border:1px solid #D8D9D7;
	padding:30px 50px 30px 50px;
	text-align:center;
	background:var(--gray-100-color);
}

#login-header{
	text-align:center;
	font-size:20px;
	height:40px;
	padding-bottom:20px;
}

#login-footer{
	height:40px;
	padding-top:10px;
	text-align:center;
	font-size:13px;
}

#btnlogin {
	width:100px;
	height:35px;
	margin-top:10px;
	background:var(--point-bg2-color);
	border:1px solid var(--gray-300-color);
	border-radius:1px;
	color:white;
}

[type=text],[type=password] {
	width:185px;
	height:30px;
}

.log-fot {
    background-color: var(--point-bg-color);
    color: var(--point-font-color);
    border-radius: 10px;
    padding: 0.2rem 1rem;
}

</style>
</head>
<jsp:useBean id="dao" class="wannafit.content.user.UserDAO"/>
<jsp:useBean id="acUser" class="wannafit.content.vo.User"/>
<jsp:setProperty property="*" name="acUser"/>
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
	<div class="main-container">
		<div class="login-container">
			<form id="frm01" method="post" action="${path}/login.do">
				<input type="hidden" name="proc" value="로그인시도"/>
				<input type="hidden" name="UsrGroup" value="회원"/>
				<table id="logon_form_table">
					<tr>
						<td id="login-header"> 로그인 </td>
					</tr>
					<tr>
						<td><input type="text" name="wm_id" value="" required/></td>
					</tr>
					<tr><td><input type="password" name="wm_pass" value="" required/></td></tr>
					<tr><td><input type="submit" id="btnlogin" value="Login"/></td></tr>
					<tr><td id="login-footer">
						<a class="log-fot">비밀번호 찾기</a>
						<a href="${path}/join.do?proc=회원가입" class="log-fot">회원가입</a>
					</td></tr>
					<tr><td colspan="2" id="login-footer">
						<img src="${path}/content/user/img/kakao.png">
						<img src="${path}/content/user/img/naver.png">
					</td></tr>
				</table>
			</form>
		</div>
	</div>	
</section>


</body>
</html>