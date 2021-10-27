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

	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
	/* .side_menu2:hover {color: #A9BF9F;} */

:root {
    --gray-100-color: #f9fbff;
    --gray-150-color: #f4f6fb;
    --gray-300-color: #e1e5ee;
    --gray-500-color: #4f546c;
    --beige--color: #D9B68B;
}

*,
*::befor,
*::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

table {
	width:90%;
	margin:10pt 20pt 10pt 20pt;
    background-color: white;
    border-collapse: collapse;
    box-shadow: 0px 5px 10px var(--gray-300-color);
    overflow: hidden;
}

table thead {
    box-shadow: 0px 5px 10px var(--gray-300-color);
    background-color: var(--gray-150-color);
}

table thead td {
    padding: 1rem 2rem;
    letter-spacing: 0.1rem;
    font-size: 0.8rem;
    font-weight: 900;
}

table tbody td {
    padding: 1rem 2rem;
    font-size: 0.8rem;
    border-top:1px solid var(--gray-300-color);
}

table th:nth-child(odd){
    background-color: var(--gray-150-color);
    border-top:1px solid var(--gray-300-color);
}
	
.aside {
	position:absolute;
	width:15%;
	height:1000px;
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
}

.main-container div{
	width:100%;
	margin:0 auto;
	padding:5%;
}

.sub1-menu {
	width:80%;
}

.sub1-menu ul{
	list-style:none;
	margin:0 auto;
}

.sub1-menu li{
	width:120px;
	height:20px;
	padding:5%;
	font-size:11pt;
	border-bottom:1px solid var(--gray-150-color);
}

.sub1-menu li:hover{
	border-bottom:1px solid #A9BF9F;
	color:#A9BF9F;
}

#usrID, a:active, a:hover, #ckCt{
	color:#A9BF9F;	
}
	
</style>
</head>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">

var userSession = "${login_User}";
var userGroup = "${login_UsrGroup}";
console.log("[예약리스트] 유저세션 : " + userSession);
console.log("[예약리스트] 유저그룹세션 : " + userGroup);

$(document).ready(function(){
	
	schList();
	
	function schList() {
		var snd = "?proc=예약내역&wm_id=" + userSession;
		
		$.ajax({
			url:"${path}/mytr.do" + snd,
			type:"get",
			data:$(".main-table").serialize(),
			dataType:"json",
			success:function(data){
				var showData = "";
				list = data.list;
				console.log(list);
				$.each(list, function(idx, rev){
					console.log(rev);
					showData += "<tr><td>"+ rev.wr_num +"</td><td>"+ rev.wrs_title 
					+"</td><td>"+ rev.wrs_day +"</td><td>"+ rev.wrs_time 
					+"</td><td>"+ rev.wrs_step +"</td></tr>";  
				});
				$(".main-table tbody").html(showData);
			},
			error:function(err){
				console.log(err);
			}
		});
	}
	
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
		<li><a href="#"><b>마인핏</b></a></li>
	</ul>
</nav>
<aside class="aside">
<div class="sub1-menu">
	<ul id="side-menu">
		<h3> 마이페이지 </h3>
		<li><a href="${path}/mamcrud.do"> 개인정보 수정 </a></li>	
		<li><a id="ckCt" href="${path}/mytr.do"> 예약 내역 </a></li>			
		<li><a href="${path}/mytr.do?proc=예약일정"> 예약일정 관리 </a></li>
	</ul>
</div>		
</aside>
<section class="section">
	<div class="main-container">
		<h4> 예약 내역</h4>
		<table class="main-table">
			<thead>
				<tr><td>예약번호</td>
				<td>예약명</td>
				<td>날짜</td>
				<td>시간</td>
				<td>진행단계</td></tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</section>
</body>
</html>