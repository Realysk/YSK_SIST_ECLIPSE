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

// 로그인한 경우 세션이 등록되서 로그인했는지 판별
var userSession = "${login_User}";
console.log("[마이페이지 - 개인정보 수정] 유저세션 : " + userSession);

	$(document).ready(function(){
		
		updateFun();
		
		function updateFun() {
			var xhr = new XMLHttpRequest();
			$("#show td").text("");
			var wm_idVal = $("[name=wm_id]").val();
			xhr.open("get","${path}/mamcrud.do?proc2=sch&wm_id="+userSession,true);
			xhr.send();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					var jTxt = xhr.responseText;
					if(jTxt!="{}"){
						var member = JSON.parse(xhr.responseText);
						console.log(member);
						$("#show td").eq(0).text(member.wm_id);
						$("#show td").eq(1).text(member.wm_pass);
						$("#show td").eq(2).text(member.wm_email);
						$("#show td").eq(3).text(member.wm_nick);
						$("#show td").eq(4).text(member.wm_tel);
					} else {
						alert("해당 회원정보는 존재하지 않습니다.");					
					}
				}
			};
		}
		
		$("[name=wm_id]").keyup(function(event){
			if(event.keyCode==13){
				updateFun();
			}
		});
		
		$("#uptBtn").click(function(){
			if(confirm("회원정보를 수정하시겠습니까?")) {
				$("[name=proc2]").val("upt");
				ajaxFun();
				location.href="${path}/mamcrud.do";
			}
		});
		$("#delBtn").click(function(){
			if(confirm("탈퇴를 진행하시겠습니까?")) {
				if(confirm("정말 탈퇴를 진행하시겠습니까?")) {
					$("[name=proc2]").val("del");
					ajaxFun();
					alert("탈퇴가 완료되었습니다\n 그동안 Wanna-Fit을 이용해주셔서 감사합니다!");
					location.href="${path}/login.do?proc=로그아웃";
				}		
			}
		});		
		function ajaxFun() {
			var xhr = new XMLHttpRequest();
			var snd = $("form").serialize();
			console.log(snd);
			xhr.open("get","${path}/mamcrud.do?"+snd,true);
			xhr.send();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					var jTxt = xhr.responseText;
					console.log(jTxt);
					var jData = JSON.parse(jTxt);
					alert(jData.result);
					var list = jData.list;
					console.log(list);
				}
			};
		}
		
	});
</script>
<style>

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
	width:80%;
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
	height:800px;
	border-radius:1px 1px 1px 1px;
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

h4{
	position:relative;
	left:18%;
}

#usrID {
	color:#A9BF9F;	
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
			<li><a href="${path}/content/mypage/minepit.jsp"><b>마인핏</b></a></li>
		</ul>
	</nav>
	
	<aside class="aside">
	<div class="sub1-menu">
		<ul id="side-menu">
			<h3> 마이페이지 </h3>
			<li><a href="${path}/mamcrud.do"> 개인정보 수정 </a></li>	
<%-- 		<li><a href="${path}/mytr.do"> 예약 내역 </a></li>
			<li><a href="${path}/mytr.do?proc=예약일정"> 예약일정 관리 </a></li> --%>
		</ul>
	</div>		
	</aside>
	
	<section class="section" style="margin-left:45px;">
	<div class="main-container">
			<h1 align="center"> ※ WANNA-FIT : 개인 정보 수정 ※ </h1>
			<form method="post"><input type="hidden" name="proc2"/>
			<table align="center" width="450px">
			<col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%">
				<tr><th> 아이디 </th><td colspan="4"><input type="text" name="wm_id" value="${param.wm_id}" readonly/></td></tr>
				<tr><th> 패스워드 </th><td colspan="4"><input type="text" name="wm_pass" value="${param.wm_pass}" /></td></tr>
				<tr><th> 이메일 </th><td colspan="4"><input type="text" name="wm_email" value="${param.wm_email}" /></td></tr>
				<tr><th> 닉네임 </th><td colspan="4"><input type="text" name="wm_nick" value="${param.wm_nick}" /></td></tr>
				<tr><th> 전화번호 </th><td colspan="4"><input type="text" name="wm_tel" value="${param.wm_tel}" /></td></tr>
				<tr>
					<th colspan="5">
						<input type="button" id="uptBtn" value="수정"/>
						<input type="button" id="delBtn" value="탈퇴"/>
					</th>
				</tr>
			</table>	
			</form>
	</div>
	</section>
   
</body>
</html>